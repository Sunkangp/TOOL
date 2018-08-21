//
//  HttpTool.h
//  QQQQQQQQQQQQQQQQQ
//
//  Created by sunkang on 2018/7/13.
//  Copyright © 2018年 sunkang. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface HttpTool : NSObject

/*************************************************************************/
//GET 请求
+ (void)get:(NSString
             
             *_Nullable)urlStr
     progress:(void (^_Nullable)(NSProgress * _Nullable uploadProgress))progress
     success:(void (^_Nullable)(NSURLSessionDataTask * _Nullable  task, id _Nullable  responseObject))success
     failure:(void (^_Nullable)(NSURLSessionDataTask * _Nullable  task, NSError * _Nullable  error))failure
     timeout:(double)timeoutInterval;

//POST请求
+ (void)post:(NSString*_Nullable)urlStr parameters:(id _Nullable )parameters
      progress:(void (^_Nullable)(NSProgress * _Nullable uploadProgress))progress
      success:(void (^_Nullable)(NSURLSessionDataTask * _Nullable  task, id _Nullable  responseObject))success
      failure:(void (^_Nullable)(NSURLSessionDataTask * _Nullable  task, NSError * _Nullable  error))failure
      timeout:(double)timeoutInterval;
//支付
//POST请求
+ (void)postPay:(NSString*_Nullable)urlStr parameters:(id _Nullable )parameters
    progress:(void (^_Nullable)(NSProgress * _Nullable uploadProgress))progress
     success:(void (^_Nullable)(NSURLSessionDataTask * _Nullable  task, id _Nullable  responseObject))success
     failure:(void (^_Nullable)(NSURLSessionDataTask * _Nullable  task, NSError * _Nullable  error))failure
     timeout:(double)timeoutInterval;


//上传图片
+ (void)postImage:(NSString*_Nullable)urlStr parameters:(id _Nullable )parameters
  constructingBody:(void (^_Nullable)(id<AFMultipartFormData>  _Nonnull formData))constructingBody
          progress:(void (^_Nullable)(NSProgress * _Nullable uploadProgress))progress
           success:(void (^_Nullable)(NSURLSessionDataTask * _Nullable  task, id _Nullable  responseObject))success
           failure:(void (^_Nullable)(NSURLSessionDataTask * _Nullable  task, NSError * _Nullable  error))failure
           timeout:(double)timeoutInterval;
//文件上传
+(void)upLoad:(NSString *_Nullable)urlStr
     filePath:(NSURL *_Nullable)filePath
     progress:(void (^_Nullable)(NSProgress * _Nullable uploadProgress))progress
      success:(void (^_Nullable)(NSURLResponse * _Nullable response, id _Nullable responseObject, NSError * _Nullable error))success
      failure:(void (^_Nullable)(NSURLResponse * _Nullable response, id _Nullable responseObject, NSError * _Nullable error))failure;

//文件下载
+(void)downLoad:(NSString *_Nullable)urlStr
     parameters:(id _Nullable )parameters
       progress:(void (^_Nullable)(NSProgress * _Nullable uploadProgress))progress
        success:(NSURL* _Nullable (^_Nullable)(NSURL * _Nullable targetPath, NSURLResponse * _Nullable response))success
        failure:(void (^_Nullable)(NSURLResponse * _Nullable response, NSURL * _Nullable filePath,NSError * _Nullable error))failure;
//网络监听
+(void)reachabilityStatusChangeBlock:(void(^_Nullable)(AFNetworkReachabilityStatus status))status;

@end
