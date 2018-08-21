//
//  DataTool.m
//  QQQQQQQQQQQQQQQQQ
//
//  Created by sunkang on 2018/7/13.
//  Copyright © 2018年 sunkang. All rights reserved.
//


#import "DataTool.h"

@implementation DataTool


+(instancetype)shareDataTool{
    static DataTool *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!tool) {
            tool = [[self alloc]init];
        }
    });
    return tool;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        self.requestSerializer = [AFHTTPRequestSerializer serializer];
        self.responseSerializer = [AFHTTPResponseSerializer serializer];
        [self.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];

    }
    return self;
}
@end
