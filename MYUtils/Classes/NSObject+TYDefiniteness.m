//
//  NSObject+MYDefiniteness.m
//  TYFoundationKit
//
//  Created by TuyaInc on 2019/3/27.
//

#import "NSObject+TYDefiniteness.h"

#import <CoreGraphics/CoreGraphics.h>

@implementation NSObject (MYDefiniteness)

- (NSInteger)my_int {
    if ([self isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)self integerValue];
    }
    
    NSInteger result;
    @try {
        result = [[NSString stringWithFormat:@"%@", self] integerValue];
    }
    @catch (NSException *exception) {
        result = 0;
    }
    
    return result;
}

- (NSUInteger)my_uInt {
    if ([self isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)self unsignedIntegerValue];
    }
    
    NSUInteger result;
    @try {
        result = [[NSString stringWithFormat:@"%@", self] integerValue];
    }
    @catch (NSException *exception) {
        result = 0;
    }
    
    return result;
}

- (CGFloat)my_float {
    if ([self isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)self floatValue];
    }
    
    CGFloat result;
    @try {
        result = [[NSString stringWithFormat:@"%@", self] floatValue];
    }
    @catch (NSException *exception) {
        result = 0.0f;
    }
    
    return result;
}

- (double)my_double {
    if ([self isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)self doubleValue];
    }
    
    double result;
    @try {
        result = [[NSString stringWithFormat:@"%@", self] doubleValue];
    }
    @catch (NSException *exception) {
        result = 0.0f;
    }
    
    return result;
}

- (BOOL)my_bool {
    if ([self isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)self boolValue];
    } else if ([self isKindOfClass:[NSString class]]) {
        if ([(NSString *)self caseInsensitiveCompare:@"null"] == NSOrderedSame) {
            return NO;
        }
    } else if ([self isKindOfClass:[NSNull class]]) {
        return NO;
    }
    
    return self != nil;
}

- (NSString *)my_string {
    if ([self isKindOfClass:[NSString class]]) {
        if ([(NSString *)self caseInsensitiveCompare:@"null"] == NSOrderedSame) {
            return nil;
        }
        else {
            return (NSString *)self;
        }
    }
    
    NSString *result;
    @try {
        if (self == nil || [self isKindOfClass:[NSNull class]]) {
            result = nil;
        }
        else {
            result = [NSString stringWithFormat:@"%@", self];
        }
    }
    @catch (NSException *exception) {
        result = nil;
    }
    
    return result;
}

- (NSArray *)my_array {
    return [self isKindOfClass:[NSArray class]] ? (NSArray *)self : nil;
}

- (NSDictionary *)my_dictionary {
    return [self isKindOfClass:[NSDictionary class]] ? (NSDictionary *)self : nil;
}


- (BOOL)my_isDictionaryAndNotEmpty {
    NSDictionary *dic = (NSDictionary *)self;
    return [dic isKindOfClass:[NSDictionary class]] && dic.count > 0;
}
- (BOOL)my_isStringAndNotEmpty {
    NSString *str = (NSString *)self;
    return [str isKindOfClass:[NSString class]] && str.length > 0;
}
- (BOOL)my_isArrayAndNotEmpty {
    NSArray *arr = (NSArray *)self;
    return [arr isKindOfClass:[NSArray class]] && arr.count > 0;
}

@end
