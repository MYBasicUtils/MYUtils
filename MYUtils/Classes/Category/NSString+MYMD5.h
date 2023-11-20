//
//  NSString+MYMD5.h
//  MYUtils
//
//  Created by APPLE on 2023/11/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (MYMD5)

- (NSString *)MD5ForUpper32Bate;

/// md5加盐
/// - Parameter inPutText: 盐
- (NSString *)upperMD5:(NSString *)inPutText;



@end

NS_ASSUME_NONNULL_END
