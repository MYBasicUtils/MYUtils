//
//  MYApplicationMessages.h
//  MYNote
//
//  Created by mingyan on 2018/12/25.
//  Copyright © 2018 明妍. All rights reserved.
//  用于获取app的各种信息

#import <Foundation/Foundation.h>

@interface MYApplicationMessages : NSObject

+ (instancetype)sharedInstance;

- (NSString *)version;

@end
