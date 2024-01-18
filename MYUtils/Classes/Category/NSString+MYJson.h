//
//  NSString+MYJson.h
//  MYUtils
//
//  Created by APPLE on 2024/1/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (MYJson)

- (NSDictionary *)jsonByError:(NSError **)aError;

@end

NS_ASSUME_NONNULL_END
