//
//  Utilities.m
//  PlainProgress
//
//  Created by Gome on 15/1/16.
//  Copyright (c) 2015年 xude. All rights reserved.
//

#import "ZDUtilities.h"
#import <objc/runtime.h>
@implementation ZDUtilities
#pragma mark NSUserDefault使用封装
+(void)setUserDefaultWithValue:(id)value forKey:(NSString *)key{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:value forKey:key];
    [userDefaults synchronize];
}

+(id)valueForKey:(NSString *)key{
    return [[NSUserDefaults standardUserDefaults]objectForKey:key];
}


+(CGSize) getStrLenByFontStyle:(NSString*) str fontStyle:(UIFont*) fontStyle textWidth:(float) textWidth{
    if (!fontStyle) {
        fontStyle = [UIFont systemFontOfSize:14];
    }
    if ([str isEqual:[NSNull null]] || [str isEqualToString:@"(null)"]) {
        return CGSizeZero;
    }
    NSDictionary *attributes = @{NSFontAttributeName: fontStyle};
    CGRect rect = [str boundingRectWithSize:CGSizeMake(textWidth, 0)
                                    options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading
                                 attributes:attributes
                                    context:nil];
    return rect.size;
}

+(int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to - from + 1)));
}
@end
