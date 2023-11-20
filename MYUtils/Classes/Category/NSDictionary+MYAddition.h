//
//  NSDictionary+ChildAddition.h
//  ChildBaseIOS
//
//  Created by mingyan on 2018/3/15.
//  Copyright © 2019年 明妍. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (MYAddition)
- (NSString *)MY_stringForKey:(NSString *)key;
- (NSInteger)MY_integerForKey:(NSString *)key;                 //返回对象integerValue，默认为0
+ (NSDictionary *)MY_dictionaryWithJsonString:(NSString *)jsonString;

- (NSArray *)MY_arrayForKey:(NSString *)key;                           //默认为nil
- (NSDictionary *)MY_dictionaryForKey:(NSString *)key;                 //默认为nil

// add by yitang
- (id)MY_valueForKey:(NSString *)key withClass:(Class)aClass;  //指定key和class的value，默认为nil
- (int)MY_intForKey:(NSString *)key;                           //返回对象intValue，默认为0
- (float)MY_floatForKey:(NSString *)key;                       //返回对象floatValue，默认为0.0
- (double)MY_doubleForKey:(NSString *)key;                     //返回对象doubleValue，默认为0.0
- (BOOL)MY_boolForKey:(NSString *)key;                         //返回对象boolValue，默认为NO
- (NSString *)MY_safeStringForKey:(NSString *)key;             //返回非nil字符串，默认为@""
- (NSString *)MY_intStringForKey:(NSString *)key;              //返回内容为整型值的字符串，默认为@"0"
- (NSURL *)MY_urlForKey:(NSString *)key;
- (NSDate *)MY_dateForKey:(NSString *)key;                     //返回日期，默认为nil(可处理NSDate对象、秒数、“yyyy-MM-dd HH:mm:ss”格式字符串)
- (NSDate *)MY_dateForMSKey:(NSString *)key;                   //返回日期，默认为nil(可处理NSDate对象、毫秒数、“yyyy-MM-dd HH:mm:ss”格式字符串)
- (NSArray *)MY_arrayForKey:(NSString *)key;                           //默认为nil
- (NSMutableArray *)MY_mutableArrayForKey:(NSString *)key;             //默认为nil
- (NSDictionary *)MY_dictionaryForKey:(NSString *)key;                 //默认为nil
- (NSMutableDictionary *)MY_mutableDictionaryForKey:(NSString *)key;   //默认为nil
- (NSString *)MY_jsonString;                                           //将字典转换为json格式的字符串
- (void)MY_serialzeWithJsonString:(NSMutableString *)jsonString;       //将字典进行json转换时使用


@end

@interface NSMutableDictionary (MYSafeAccess)
-(void)MY_setObject:(id)anObject forKey:(id)aKey;//安全地设值，做了object以及key是否为nil的判断
-(void)MY_setValue:(id)value forKey:(NSString*)key;//安全地设值，做了key是否为NSString的判断
@end

