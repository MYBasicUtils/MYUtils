//
//  MYUtils.h
//  MYNote
//
//  Created by 明妍 on 2018/11/25.
//  Copyright © 2018 明妍. All rights reserved.
//

#ifndef MYUtils_h
#define MYUtils_h
#import <CocoaLumberjack/CocoaLumberjack.h>



#import "RACEXTScope.h"
#import "UIView+MYAdditons.h"
#import "NSString+MYEmpty.h"
#import "NSArray+MYAddition.h"
#import "MBProgressHUD+MYUtils.h"
#import "NSString+MYMD5.h"
#import "NSString+MYNocale.h"
#import "MYLog.h"
#import "NSData+MYEtension.h"
#import "NSString+MYJson.h"
#import "NSArray+MYSafe.h"
#import "MYDefines.h"
#import "NSData+MYMD5.h"

#if DEBUG
#define rac_keywordify autoreleasepool {}
#else
#define rac_keywordify try {} @catch (...) {}
#endif

#define weakify(...) \
rac_keywordify \
metamacro_foreach_cxt(rac_weakify_,, __weak, __VA_ARGS__)

#define strongify(...) \
rac_keywordify \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
metamacro_foreach(rac_strongify_,, __VA_ARGS__) \
_Pragma("clang diagnostic pop")


#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)



#endif /* MYUtils_h */
