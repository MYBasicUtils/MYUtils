//
//  NSString+MYEmpty.h
//  MYNote
//
//  Created by mingyan on 2019/1/8.
//  Copyright © 2019 明妍. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (MYEmpty)

-(BOOL)isEmpty;

- (NSString *)trim;

@end

NS_ASSUME_NONNULL_END
