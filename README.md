# LPFNetWorkHelper
这个一个基于AFNetworking 3.x 与YYCache，对PPNetworkHelper进行的二次封装，新增了请求失败多状态回调，和统一网络监听。本Demo是基于自己项目封装而成，如需使用，需要自己稍微加以改变。

## Usage 使用方法
### 自动缓存(GET与POST请求用法相同)

```objc
[ZDBaseRequestManager POSTJKID:@"" parameters:nil responseCache:^(id responseCache) {
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
```
