//
//  Utilities.h
//  PlainProgress
//
//  Created by Gome on 15/1/16.
//  Copyright (c) 2015年 xude. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class ZDProgressHUD;
@interface ZDUtilities : NSObject

+(void)setUserDefaultWithValue:(id)value forKey:(NSString *)key;
+(id)valueForKey:(NSString *)key;

//获取label高度
+(CGSize) getStrLenByFontStyle:(NSString*) str fontStyle:(UIFont*) fontStyle textWidth:(float) textWidth;
//生成随机整数区间
+(int)getRandomNumber:(int)from to:(int)to;

@end
