//
//  MYLog.h
//  MYBookkeeping
//
//  Created by APPLE on 2022/1/28.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/CocoaLumberjack.h>

NS_ASSUME_NONNULL_BEGIN


#ifdef __OPTIMIZE__
#define NSLog(...) {}
#else
#define NSLog(...) [MYLog debug:__VA_ARGS__]
#endif

@interface MYLog : NSObject

+ (void)debug:(NSString *)format, ...;

@end

NS_ASSUME_NONNULL_END
