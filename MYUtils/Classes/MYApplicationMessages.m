//
//  MYApplicationMessages.m
//  MYNote
//
//  Created by mingyan on 2018/12/25.
//  Copyright © 2018 明妍. All rights reserved.
//

#import "MYApplicationMessages.h"

@implementation MYApplicationMessages

static MYApplicationMessages *__onetimeClass;
+ (instancetype)sharedInstance {
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        __onetimeClass = [[MYApplicationMessages alloc] init];
    });
    return __onetimeClass;
}

- (NSString *)version {
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
    return appVersion;
}

@end
