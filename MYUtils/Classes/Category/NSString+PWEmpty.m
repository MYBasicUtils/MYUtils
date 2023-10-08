//
//  NSString+MYEmpty.m
//  MYNote
//
//  Created by mingyan on 2019/1/8.
//  Copyright © 2019 明妍. All rights reserved.
//

#import "NSString+MYEmpty.h"

@implementation NSString (MYEmpty)

-(BOOL)isEmpty {
    if ([self trim].length) {
        return NO;
    }
    return YES;
}

- (NSString *)trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
