//
//  ZDBaseRequestManager.m
//  NetworkHelper
//
//  Created by Roc on 2017/4/25.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "ZDBaseRequestManager.h"
#import <PPNetworkHelper.h>
#import "ZDRequestParamsFilter.h"
#import <Reachability.h>
#define CONFIG_SERVER_URL @"http://api.jisuapi.com/weather/query"//测试所用的免费天气预报接口
#ifndef    ZDWeakify_self
#if __has_feature(objc_arc)
#define ZDWeakify_self autoreleasepool{} __weak __typeof__(self) weakSelf = self;
#else
#define ZDWeakify_self autoreleasepool{} __block __typeof__(self) blockSelf = self;
#endif
#endif
#ifndef    ZDStrongify_self
#if __has_feature(objc_arc)
#define ZDStrongify_self try{} @finally{} __typeof__(weakSelf) self = weakSelf;
#else
#define ZDStrongify_self try{} @finally{} __typeof__(blockSelf) self = blockSelf;
#endif
#endif

@implementation ZDBaseRequestManager
+ (BOOL)isWebAvailible{//判断网络是否可用
    Reachability * reach = [Reachability reachabilityForInternetConnection];
    switch ([reach currentReachabilityStatus]){
        case NotReachable:return NO; break;
        case ReachableViaWiFi: return YES;break;
        default: return YES;
    }
    return YES;
}

+ (__kindof NSURLSessionTask *)GETJKID:(NSString *)JKID
                            parameters:(id)parameters
                               success:(ZDHttpRequestSuccess)success
                               failure:(ZDHttpRequestFailed)failure
{
    /**
     *  网络是否可用
     */
    if (![self isWebAvailible]) {
        failure ? failure(ZDURLResponseStatusErrorNoNetwork) : nil;
        return nil;
    }
    
//    NSDictionary*parametersDic = [ZDRequestParamsFilter filterExtraParams:parameters requestJKID:JKID];
    __block NSURLSessionDataTask * task = nil;
    task =  [PPNetworkHelper GET:CONFIG_SERVER_URL parameters:parameters success:success failure:^(NSError *error) {
        NSHTTPURLResponse *httpUrlResponse = (NSHTTPURLResponse *)task.response;
        
        if (httpUrlResponse.statusCode == 404) {
            /**
             *  版本检测，用于版本交替时可能访问不存在的服务
             */
            
            failure ? failure(ZDURLResponseStatusErrorNoServe) : nil;
        }else
        {
            
            failure ? failure(ZDURLResponseStatusErrorTimeout) : nil;
        }
    }];
    return task;
}

+ (__kindof NSURLSessionTask *)GETJKID:(NSString *)JKID
                            parameters:(id)parameters
                         responseCache:(ZDHttpRequestCache)responseCache
                               success:(ZDHttpRequestSuccess)success
                               failure:(ZDHttpRequestFailed)failure
{
    
//    NSDictionary*parametersDic = [ZDRequestParamsFilter filterExtraParams:parameters requestJKID:JKID];
    __block NSURLSessionDataTask * task = nil;
    task = [PPNetworkHelper GET:CONFIG_SERVER_URL parameters:parameters responseCache:responseCache success:success failure:^(NSError *error) {
        
        /**
         *  网络是否可用(放到这里判断网络，是为了能够得到缓存数据)
         */
        if (![self isWebAvailible]) {
            failure ? failure(ZDURLResponseStatusErrorNoNetwork) : nil;
            return ;
        }
        
        NSHTTPURLResponse *httpUrlResponse = (NSHTTPURLResponse *)task.response;
        
        if (httpUrlResponse.statusCode == 404) {
            /**
             *  版本检测，用于版本交替时可能访问不存在的服务
             */
            
            failure ? failure(ZDURLResponseStatusErrorNoServe) : nil;
        }else
        {
            
            failure ? failure(ZDURLResponseStatusErrorTimeout) : nil;
        }
    }];
    return task;
}

+ (__kindof NSURLSessionTask *)POSTJKID:(NSString *)JKID
                             parameters:(id)parameters
                                success:(ZDHttpRequestSuccess)success
                                failure:(ZDHttpRequestFailed)failure
{
    /**
     *  网络是否可用
     */
    if (![self isWebAvailible]) {
        failure ? failure(ZDURLResponseStatusErrorNoNetwork) : nil;
        return nil;
    }
    
//    NSDictionary*parametersDic = [ZDRequestParamsFilter filterExtraParams:parameters requestJKID:JKID];
    __block NSURLSessionDataTask * task = nil;
    task = [PPNetworkHelper GET:CONFIG_SERVER_URL parameters:parameters success:success failure:^(NSError *error) {
        NSHTTPURLResponse *httpUrlResponse = (NSHTTPURLResponse *)task.response;
        
        if (httpUrlResponse.statusCode == 404) {
            /**
             *  版本检测，用于版本交替时可能访问不存在的服务
             */
            
            failure ? failure(ZDURLResponseStatusErrorNoServe) : nil;
        }else
        {
            
            failure ? failure(ZDURLResponseStatusErrorTimeout) : nil;
        }
    }];
    
    return task;
}

+ (__kindof NSURLSessionTask *)POSTJKID:(NSString *)JKID
                             parameters:(id)parameters
                          responseCache:(ZDHttpRequestCache)responseCache
                                success:(ZDHttpRequestSuccess)success
                                failure:(ZDHttpRequestFailed)failure
{
    //    NSDictionary*parametersDic = [ZDRequestParamsFilter filterExtraParams:parameters requestJKID:JKID];
        __block NSURLSessionDataTask * task = nil;
        task =[PPNetworkHelper POST:CONFIG_SERVER_URL parameters:parameters responseCache:responseCache success:success failure:^(NSError *error) {
            /**
             *  网络是否可用(放到这里判断网络，是为了能够得到缓存数据)
             */
            if (![self isWebAvailible]) {
                failure ? failure(ZDURLResponseStatusErrorNoNetwork) : nil;
                return ;
            }
        NSHTTPURLResponse *httpUrlResponse = (NSHTTPURLResponse *)task.response;
        NSLog(@"------------ %ld",httpUrlResponse.statusCode);
        if (httpUrlResponse.statusCode == 404) {
            /**
             *  版本检测，用于版本交替时可能访问不存在的服务
             */
            
            failure ? failure(ZDURLResponseStatusErrorNoServe) : nil;
        }else
        {
            
            failure ? failure(ZDURLResponseStatusErrorTimeout) : nil;
        }
        
    }];
    return task;
}
@end
