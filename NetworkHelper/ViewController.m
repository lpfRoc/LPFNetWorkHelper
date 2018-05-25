//
//  ViewController.m
//  NetworkHelper
//
//  Created by Roc on 2017/4/21.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "ViewController.h"
#import <PPNetworkHelper.h>
#import <AFNetworking.h>
#import <JSONKit.h>
#import "ZDBaseRequestManager.h"
#import <ZDUtilities.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

   NSLog(@"ZDUtilities ==%d",[ZDUtilities getRandomNumber:10 to:100]) ;
    //亲求参数
    NSDictionary *dic= @{
                         @"appkey":@"99343c9d4dbf72f5",
                         @"city":@"上海"
                         };
    __block NSURLSessionDataTask * task = nil;
          task=  [ZDBaseRequestManager POSTJKID:@"" parameters:dic responseCache:^(id responseCache) {
        //加载缓存数据
        NSLog(@"加载缓存数据----responseCache%@",responseCache);
        if (responseCache) {
            return ;
        }
    } success:^(id responseObject) {
        //请求成功
        NSLog(@"请求成功----responseObject%@",responseObject);
    } failure:^(ZDURLResponseStatus errorCode) {
        //请求失败
        NSLog(@"请求失败----error%ld",errorCode);
        switch (errorCode) {
            case ZDURLResponseStatusErrorNoNetwork:
                NSLog(@"无网络");
                break;
            case ZDURLResponseStatusErrorTimeout:
                NSLog(@"超时");
                break;
                case ZDURLResponseStatusErrorNoServe:
                 NSLog(@"无服务");
                break;
            default:
                break;
        }

    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
