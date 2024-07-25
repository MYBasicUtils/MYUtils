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
    if (!format) {
        return;
    }
    va_list args;
    va_start(args, format);
    NSString *formatString;
    if ([format isKindOfClass:[NSString class]]){
        formatString = format;
    } else {
        formatString = [NSString stringWithFormat:@"%@", format];
    }
    NSString *message = [[NSString alloc] initWithFormat:formatString arguments:args];
       va_end(args);
    NSMutableString *log = [NSMutableString string];
    [log appendString:message];
    DDLogDebug(message);
}

+ (void)setup {
//    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [DDLog addLogger:[DDASLLogger sharedInstance]];
}

@end
