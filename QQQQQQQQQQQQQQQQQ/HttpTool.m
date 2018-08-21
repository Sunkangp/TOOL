//
//  HttpTool.m
//  QQQQQQQQQQQQQQQQQ
//
//  Created by sunkang on 2018/7/13.
//  Copyright © 2018年 sunkang. All rights reserved.
//

#import "HttpTool.h"
#import "DataTool.h"

static AFHTTPSessionManager *_manager;

@implementation HttpTool

////////////////////////////////////////////////
+(void)get:(NSString*)urlStr
  progress:(void (^)(NSProgress * uploadProgress))progress
   success:(void (^)(NSURLSessionDataTask *  task, id  responseObject))success
   failure:(void (^)(NSURLSessionDataTask *  task, NSError *  error))failure
   timeout:(double)timeoutInterval
{
    DataTool *datatool = [DataTool shareDataTool];
    datatool.requestSerializer.timeoutInterval = timeoutInterval;
    [datatool GET:urlStr parameters:nil progress:progress success:success failure:failure];
}

////////////////////////////////////////////////
+ (void) post:(NSString*)urlStr parameters:(id)parameters
     progress:(void (^)(NSProgress * uploadProgress))progress
      success:(void (^)(NSURLSessionDataTask *  task, id  responseObject))success
      failure:(void (^)(NSURLSessionDataTask *  task, NSError *  error))failure
      timeout:(double)timeoutInterval
{
    DataTool *datatool = [DataTool shareDataTool];
    datatool.requestSerializer.timeoutInterval = timeoutInterval;
    [datatool POST:urlStr parameters:parameters progress:progress success:success failure:failure];
}
+ (void)postPay:(NSString*_Nullable)urlStr parameters:(id _Nullable )parameters
       progress:(void (^_Nullable)(NSProgress * _Nullable uploadProgress))progress
        success:(void (^_Nullable)(NSURLSessionDataTask * _Nullable  task, id _Nullable  responseObject))success
        failure:(void (^_Nullable)(NSURLSessionDataTask * _Nullable  task, NSError * _Nullable  error))failure
        timeout:(double)timeoutInterval{
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    //申明请求的数据是json类型
    manger.requestSerializer = [AFJSONRequestSerializer serializer];
    //申明返回的结果是json类型
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    NSString *accessToken = [userDefaults valueForKey:kaccessToken];
//    [manger.requestSerializer setValue:accessToken forHTTPHeaderField:@"Authorization"];

    [manger.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    
    manger.requestSerializer.timeoutInterval = timeoutInterval;
    
    
    [manger POST:urlStr parameters:parameters progress:progress success:success failure:failure];
}

+ (void) postImage:(NSString*)urlStr parameters:(id)parameters
    constructingBody:(void(^)(id<AFMultipartFormData>  _Nonnull formData))constructingBody
     progress:(void (^)(NSProgress * uploadProgress))progress
      success:(void (^)(NSURLSessionDataTask *  task, id  responseObject))success
      failure:(void (^)(NSURLSessionDataTask *  task, NSError *  error))failure
      timeout:(double)timeoutInterval
{
    DataTool *datatool = [DataTool shareDataTool];
    datatool.requestSerializer.timeoutInterval = timeoutInterval;
    [datatool POST:urlStr parameters:parameters constructingBodyWithBlock:constructingBody progress:progress success:success failure:failure];
}


////////////////////////////////////////////////
+(void)upLoad:(NSString *)urlStr
        filePath:(NSURL *)filePath
        progress:(void (^)(NSProgress * uploadProgress))progress
        success:(void (^)(NSURLResponse *response, id responseObject, NSError *error))success
        failure:(void (^)(NSURLResponse *response, id responseObject, NSError *error))failure{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];

    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithRequest:request fromFile:filePath progress:progress completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            failure(response,filePath,error);
        }else{
            success(response,filePath,error);
        }
    }];
    [uploadTask resume];
}


////////////////////////////////////////////////
+(void)downLoad:(NSString *)urlStr
        parameters:(id)parameters
        progress:(void (^)(NSProgress *uploadProgress))progress
        success:(NSURL* (^)(NSURL *targetPath, NSURLResponse *response))success
        failure:(void (^)(NSURLResponse *response, NSURL *filePath,NSError *error))failure
{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURL *URL = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:progress destination:success completionHandler:failure];
    [downloadTask resume];
}
////////////////////////////////////////////////////////
+(void)reachabilityStatusChangeBlock:(void(^)(AFNetworkReachabilityStatus status))status{
    AFNetworkReachabilityManager *reachabilityManager = [AFNetworkReachabilityManager sharedManager];
    [reachabilityManager setReachabilityStatusChangeBlock:status];
    //开始监听网络状况.
    [reachabilityManager startMonitoring];
}


@end
