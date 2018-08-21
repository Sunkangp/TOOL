//
//  ViewController.m
//  QQQQQQQQQQQQQQQQQ
//
//  Created by sunkang on 2018/7/13.
//  Copyright © 2018年 sunkang. All rights reserved.
//

#import "ViewController.h"
#import "HttpTool.h"
#import "DateStr.h"
#import "JsonParse.h"
#import "SHA.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}







- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
#warning 填写自己的URL,参数
    [HttpTool post:@"http://...." parameters:@{} progress:^(NSProgress * _Nullable uploadProgress) {

    } success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
        NSDictionary *dic = [JsonParse jsonParseWithData:responseObject];
        NSLog(@"%@",dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error) {

    } timeout:20.0f];

    


}


@end
