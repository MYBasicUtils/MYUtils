//
//  NSArray+TYSafe.m
//  MYFoundationKit
//
//  Created by wmy on 2018/12/17.
//

#import "NSArray+MYSafe.h"

@implementation NSArray (MYSafe)

- (id)my_safeObjectAtIndex:(NSUInteger)index {
    return index < self.count ? [self objectAtIndex:index] : nil;
}

@end

@implementation NSMutableArray (MYSafe)

- (void)my_safeAddObject:(id)anObject {
    if (anObject) {
        [self addObject:anObject];
    }
}

- (void)my_safeInsertObject:(id)anObject atIndex:(NSUInteger)index {
    if (!anObject || index < 0) {
        return;
    }
    if (index == self.count) {
        [self addObject:anObject];
    } else if (index < self.count) {
        [self insertObject:anObject atIndex:index];
    }
}

@end
