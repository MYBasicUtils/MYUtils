//
//  NSArray+TYSafe.h
//  MYFoundationKit
//
//  Created by wmy on 2018/12/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray<ObjectType> (MYSafe)

- (ObjectType)my_safeObjectAtIndex:(NSUInteger)index;

@end

@interface NSMutableArray (MYSafe)

- (void)my_safeAddObject:(id)anObject;
- (void)my_safeInsertObject:(id)anObject atIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
