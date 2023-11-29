//
//  NSObject+MYDefiniteness.h
//  TYFoundationKit
//
//  Created by TuyaInc on 2019/3/27.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (MYDefiniteness)

/**
 convert id or NSObject to int
 retrun 0 if fail
 */
- (NSInteger)my_int;
/**
 convert id or NSObject to unsigned int
 retrun 0 if fail
 */
- (NSUInteger)my_uInt;
/**
 convert id or NSObject to float
 retrun 0.0 if fail
 */
- (CGFloat)my_float;
/**
 convert id or NSObject to double
 retrun 0.0 if fail
 */
- (double)my_double;
/**
 convert id or NSObject to bool
 retrun NO if fail
 */
- (BOOL)my_bool;
/**
 convert id or NSObject to string
 retrun nil if fail
 */
- (NSString *)my_string;
/**
 convert id or NSObject to array
 retrun nil if fail
 */
- (NSArray *)my_array;
/**
 convert id or NSObject to dictionary
 retrun nil if fail
 */
- (NSDictionary *)my_dictionary;


- (BOOL)my_isDictionaryAndNotEmpty;
- (BOOL)my_isStringAndNotEmpty;
- (BOOL)my_isArrayAndNotEmpty;

@end

NS_ASSUME_NONNULL_END
