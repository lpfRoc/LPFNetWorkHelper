//
//  ZDRequestParamsFilter.m
//  NetworkHelper
//
//  Created by Roc on 2017/4/25.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "ZDRequestParamsFilter.h"
#import <JSONKit.h>
#import <UIKit/UIKit.h>
@implementation ZDRequestParamsFilter
+(NSDictionary *)filterExtraParams:(NSDictionary *)params requestJKID:(NSString *)requestJKID
{
   requestJKID = requestJKID ? requestJKID : @"";
 
    NSDictionary *paramDictionary = @{
                                @"arg1":params,
                                @"arg0":requestJKID,
                                };
    

    return paramDictionary;
}
@end
