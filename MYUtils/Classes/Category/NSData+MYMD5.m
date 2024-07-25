//
//  NSData+MYMD5.m
//  MYUtils
//
//  Created by APPLE on 2024/7/22.
//

#import "NSData+MYMD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSData (MYMD5)

- (NSString *)MD5String {
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.bytes, (CC_LONG)self.length, result);
    
    NSMutableString *hash = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x", result[i]];
    }
    return [hash copy];
}

@end
