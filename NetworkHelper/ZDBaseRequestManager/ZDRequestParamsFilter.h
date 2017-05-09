//
//  ZDRequestParamsFilter.h
//  NetworkHelper
//
//  Created by Roc on 2017/4/25.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZDRequestParamsFilter : NSObject
/**
 *  这里复杂参数处理
 *
 *  @param params   params
 *
 *  @anotherParam requestJKID   requestJKID
 *
 *  @return NSDictionary   处理后的参数字典
 */

+(NSDictionary *)filterExtraParams:(NSDictionary *)params requestJKID:(NSString *)requestJKID;
@end
