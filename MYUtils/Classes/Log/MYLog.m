//
//  MYLog.m
//  MYBookkeeping
//
//  Created by APPLE on 2022/1/28.
//

#import "MYLog.h"
#import <CocoaLumberjack/DDLog.h>

@implementation MYLog

+ (void)debug:(NSString *)format, ... {
    DDLogDebug(format);
}

@end
