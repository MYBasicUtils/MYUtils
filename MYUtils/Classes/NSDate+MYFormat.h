//
//  NSDate+MYFormat.h
//  MYBookkeeping
//
//  Created by WenMingYan on 2022/3/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (MYFormat)

@property (nonatomic, readonly) NSDateComponents *my_dateComponments __deprecated_msg("Use my_dateComponents instead");
@property (nonatomic, readonly) NSDateComponents *my_dateComponents;
@property (nonatomic, readonly) NSInteger my_year;
@property (nonatomic, readonly) NSInteger my_month;
@property (nonatomic, readonly) NSInteger my_day;
@property (nonatomic, readonly) NSInteger my_weekday;
@property (nonatomic, readonly) NSInteger my_hour;
@property (nonatomic, readonly) NSInteger my_minute;
@property (nonatomic, readonly) NSInteger my_second;

/**
 format current date
 if dateFormat == nil, use "yyyy-MM-dd HH:mm:ss" instead
 */
- (NSString *)my_stringWithFormat:(NSString * _Nullable)dateFormat;
- (NSString *)my_stringWithFormat:(NSString * _Nullable)dateFormat timeZone:(NSTimeZone * _Nullable)timeZone;
/**
 format current date
 if formatter == nil, use "yyyy-MM-dd HH:mm:ss" instead
 */
- (NSString *)my_stringWithFormatter:(NSDateFormatter * _Nullable)formatter;


/**
 create date with format string
 if dateFormat == nil, use "yyyy-MM-dd HH:mm:ss" instead
 */
+ (instancetype)my_dateFromString:(NSString *)dateStr withFormat:(NSString * _Nullable)dateFormat;
+ (instancetype)my_dateFromString:(NSString *)dateStr withFormat:(NSString * _Nullable)dateFormat timeZone:(NSTimeZone * _Nullable)timeZone;
/**
 create date with format string
 if dateFormat == nil, use "yyyy-MM-dd HH:mm:ss" instead
 */
+ (instancetype)my_dateFromString:(NSString *)dateStr withFormatter:(NSDateFormatter * _Nullable)formatter;


/**
 return YES if self.my_year self.my_month self.my_day equal to [NSDate date]
 */
- (BOOL)my_isToday;

- (BOOL)my_isMonth;

- (BOOL)my_isYear;
/**
 if unit == 0, return self.timeIntervalSince1970 == date.timeIntervalSince1970
 */
- (BOOL)my_isEqualToDate:(NSDate *)date withOptions:(NSCalendarUnit)unit;



+ (BOOL)my_is24HourClock;

@end

NS_ASSUME_NONNULL_END
