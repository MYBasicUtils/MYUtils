//
//  NSDate+MYFormat.m
//  MYBookkeeping
//
//  Created by WenMingYan on 2022/3/13.
//

#import "NSDate+MYFormat.h"
#import <objc/runtime.h>
#import "NSObject+TYDefiniteness.h"

NSDateFormatter * MY_DefaultFormatter() {
    static NSDateFormatter *formatter;
    if (!formatter) {
        formatter = [NSDateFormatter new];
        formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    }
    return formatter;
}

inline BOOL my_Is24HourClock(void) {
    return [NSDate my_is24HourClock];
}

@implementation NSDate (MYFormat)

- (NSString *)my_stringWithFormatter:(NSDateFormatter *)formatter {
    return [formatter ? : MY_DefaultFormatter() stringFromDate:self];
}

- (NSString *)my_stringWithFormat:(NSString *)dateFormat {
    return [self my_stringWithFormat:dateFormat timeZone:nil];
}
- (NSString *)my_stringWithFormat:(NSString * _Nullable)dateFormat timeZone:(NSTimeZone * _Nullable)timeZone {
    NSDateFormatter *formatter;
    if ([dateFormat my_isStringAndNotEmpty]) {
        formatter = [NSDateFormatter new];
        formatter.dateFormat = dateFormat;
        formatter.timeZone = timeZone;
    }
    return [self my_stringWithFormatter:formatter];
}

- (BOOL)my_isToday {
    return [self my_isEqualToDate:[NSDate date] withOptions:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay];
}

- (BOOL)my_isMonth {
    return [self my_isEqualToDate:[NSDate date] withOptions:NSCalendarUnitYear|NSCalendarUnitMonth];
}

- (BOOL)my_isYear {
    return [self my_isEqualToDate:[NSDate date] withOptions:NSCalendarUnitYear];
}

- (BOOL)my_isEqualToDate:(NSDate *)date withOptions:(NSCalendarUnit)unit {
    if (!date) {
        return NO;
    }
    BOOL timeIntervalEqual = [date timeIntervalSince1970] == [self timeIntervalSince1970];
    if (timeIntervalEqual || unit == 0) {
        return timeIntervalEqual;
    }
    
    if (unit & NSCalendarUnitEra && date.my_dateComponents.era != self.my_dateComponents.era) {
        return NO;
    }
    if (unit & NSCalendarUnitYear && date.my_dateComponents.year != self.my_dateComponents.year) {
        return NO;
    }
    if (unit & NSCalendarUnitMonth && date.my_dateComponents.month != self.my_dateComponents.month) {
        return NO;
    }
    if (unit & NSCalendarUnitYear && date.my_dateComponents.year != self.my_dateComponents.year) {
        return NO;
    }
    if (unit & NSCalendarUnitMonth && date.my_dateComponents.month != self.my_dateComponents.month) {
        return NO;
    }
    if (unit & NSCalendarUnitDay && date.my_dateComponents.day != self.my_dateComponents.day) {
        return NO;
    }
    if (unit & NSCalendarUnitHour && date.my_dateComponents.hour != self.my_dateComponents.hour) {
        return NO;
    }
    if (unit & NSCalendarUnitMinute && date.my_dateComponents.minute != self.my_dateComponents.minute) {
        return NO;
    }
    if (unit & NSCalendarUnitSecond && date.my_dateComponents.second != self.my_dateComponents.second) {
        return NO;
    }
    if (unit & NSCalendarUnitWeekday && date.my_dateComponents.weekday != self.my_dateComponents.weekday) {
        return NO;
    }
    if (unit & NSCalendarUnitWeekdayOrdinal && date.my_dateComponents.weekdayOrdinal != self.my_dateComponents.weekdayOrdinal) {
        return NO;
    }
    if (unit & NSCalendarUnitQuarter && date.my_dateComponents.quarter != self.my_dateComponents.quarter) {
        return NO;
    }
    if (unit & NSCalendarUnitWeekOfMonth && date.my_dateComponents.weekOfMonth != self.my_dateComponents.weekOfMonth) {
        return NO;
    }
    if (unit & NSCalendarUnitWeekOfYear && date.my_dateComponents.weekOfYear != self.my_dateComponents.weekOfYear) {
        return NO;
    }
    if (unit & NSCalendarUnitYearForWeekOfYear && date.my_dateComponents.yearForWeekOfYear != self.my_dateComponents.yearForWeekOfYear) {
        return NO;
    }
    if (unit & NSCalendarUnitNanosecond && date.my_dateComponents.nanosecond != self.my_dateComponents.nanosecond) {
        return NO;
    }
    if (unit & NSCalendarUnitTimeZone && ![date.my_dateComponents.timeZone.name isEqualToString:self.my_dateComponents.timeZone.name]) {
        return NO;
    }
    return YES;
}


+ (instancetype)my_dateFromString:(NSString *)dateStr withFormat:(NSString * _Nullable)dateFormat {
    return [self my_dateFromString:dateStr withFormat:dateFormat timeZone:nil];
}
+ (instancetype)my_dateFromString:(NSString *)dateStr withFormat:(NSString * _Nullable)dateFormat timeZone:(NSTimeZone * _Nullable)timeZone {
    NSDateFormatter *formatter;
    if ([dateFormat my_isStringAndNotEmpty]) {
        formatter = [NSDateFormatter new];
        formatter.dateFormat = dateFormat;
        formatter.timeZone = timeZone;
    }
    return [self my_dateFromString:dateStr withFormatter:formatter];
}

+ (instancetype)my_dateFromString:(NSString *)dateStr withFormatter:(NSDateFormatter * _Nullable)formatter {
    return [formatter ? : MY_DefaultFormatter() dateFromString:dateStr];
}

+ (BOOL)my_is24HourClock {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateStyle:NSDateFormatterNoStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    NSString *dateString = [formatter stringFromDate:[NSDate date]];
    NSRange amRange = [dateString rangeOfString:[formatter AMSymbol]];
    NSRange pmRange = [dateString rangeOfString:[formatter PMSymbol]];
    return amRange.location == NSNotFound && pmRange.location == NSNotFound;
}

#pragma mark - Accessor
- (NSDateComponents *)my_dateComponments {
    return [self my_dateComponents];
}

- (NSDateComponents *)my_dateComponents {
    NSDateComponents *obj = objc_getAssociatedObject(self, _cmd);
    if (!obj) {
        NSCalendarUnit unit = NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitWeekday|NSCalendarUnitWeekdayOrdinal|NSCalendarUnitQuarter|NSCalendarUnitWeekOfMonth|NSCalendarUnitWeekOfYear|NSCalendarUnitYearForWeekOfYear|NSCalendarUnitNanosecond|NSCalendarUnitTimeZone|NSCalendarUnitCalendar;
        
        obj = [[NSCalendar autoupdatingCurrentCalendar] components:unit fromDate:self];
        objc_setAssociatedObject(self, _cmd, obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return obj;
}

- (NSInteger)my_year {
    return self.my_dateComponents.year;
}
- (NSInteger)my_month {
    return self.my_dateComponents.month;
}
- (NSInteger)my_day {
    return self.my_dateComponents.day;
}
- (NSInteger)my_weekday {
    return self.my_dateComponents.weekday;
}
- (NSInteger)my_hour {
    return self.my_dateComponents.hour;
}
- (NSInteger)my_minute {
    return self.my_dateComponents.minute;
}
- (NSInteger)my_second {
    return self.my_dateComponents.second;
}

@end
