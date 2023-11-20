//
//  NSData+MYEtension.h
//  MYUtils
//
//  Created by APPLE on 2023/11/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (MYEtension)

/**
 NSData转化成string

 @return 返回nil的解决方案
 */
-(NSString *)convertedToUtf8String;

@end

NS_ASSUME_NONNULL_END
