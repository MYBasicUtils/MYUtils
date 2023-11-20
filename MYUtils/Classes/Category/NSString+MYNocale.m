//
//  NSString+MYNocale.m
//  MYUtils
//
//  Created by APPLE on 2023/11/3.
//

#import "NSString+MYNocale.h"

@implementation NSString (MYNocale)

- (NSString *)local {
    return NSLocalizedString(self, nil);
}

@end
