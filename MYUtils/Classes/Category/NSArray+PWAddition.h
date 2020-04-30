//
//  NSArray+ChildAddition.h
//  ChildBaseIOS
//
//  Created by mingyan on 2018/5/17.
//  Copyright © 2019年 明妍. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSArray (MYAddition)

- (id)my_firstObject;
- (id)my_randomObject;
- (NSArray *)my_reverse;
- (BOOL)my_hasIndex:(NSInteger)index;
- (id)pw_objectAtSafeIndex:(NSUInteger)index;

- (void)my_addObservers:(NSArray *)observers forKeyPaths:(NSArray *)keyPaths options:(NSKeyValueObservingOptions)options context:(void *)context;
- (void)my_removeObservers:(NSArray *)observers forKeyPaths:(NSArray *)keyPaths;
@end

@interface NSArray (JsonStringExtention)

- (NSString *)my_JsonString;   //将数组转化为json类型的字符串，只支持数组中元素是字典类型的数据
- (void)my_serialzeWithJsonString:(NSMutableString *)jsonString;   // 将数组进行json转换时使用

@end

@interface NSArray (MYSafeAccess)

- (id)my_objectAtIndex:(NSUInteger)index;//安全地取值，做了数组越界的判断
- (void)my_addObject:(id)anObject;//安全地增加元素，做了是否为nil的判断
- (void)my_insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)my_removeObjectAtIndex:(NSUInteger)index;
- (void)my_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;

@end

