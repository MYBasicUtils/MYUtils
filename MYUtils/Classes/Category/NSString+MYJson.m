//
//  NSString+MYJson.m
//  MYUtils
//
//  Created by APPLE on 2024/1/17.
//

#import "NSString+MYJson.h"

@implementation NSString (MYJson)

- (NSDictionary *)jsonByError:(NSError **)aError {
    NSError *error;
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding]; // 将NSString转成NSData

    if (jsonData) {
        // 尝试解析JSON数据
        id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];

        if (jsonObject != nil && error == nil) {
            // 成功解析到JSON对象, jsonObject可能是NSDictionary或NSArray，取决于你的JSON内容
//            NSLog(@"Successfully deserialized...");
            if ([jsonObject isKindOfClass:[NSDictionary class]]) {
                // 是字典
                NSDictionary *deserializedDictionary = (NSDictionary *)jsonObject;
//                NSLog(@"Deserialized JSON Dictionary = %@", deserializedDictionary);
                return deserializedDictionary;
            } else if ([jsonObject isKindOfClass:[NSArray class]]) {
                // 是数组
                NSArray *deserializedArray = (NSArray *)jsonObject;
//                NSLog(@"Deserialized JSON Array = %@", deserializedArray);
                return @{@"json":deserializedArray};
            } else {
                // jsonObject是一个其他的数据类型
            }
        } else if (error != nil) {
            // 解析错误
//            &aError = &error;
//            NSLog(@"An error happened while deserializing the JSON data.");
        }
    } else {
//        &aError = &error;
        // jsonString转换成NSData失败
//        NSLog(@"Error creating JSON data from string");
    }
    return nil;
}

@end
