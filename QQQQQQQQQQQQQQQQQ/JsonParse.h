//
//  JsonParse.h
//  QQQQQQQQQQQQQQQQQ
//
//  Created by sunkang on 2018/7/13.
//  Copyright © 2018年 sunkang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonParse : NSObject

//json解析
+ (id) jsonParseWithString:(NSString*)jsonString;

+ (id) jsonParseWithData:(NSData *)jsonData;


+ (NSString *)JsonStringWithdata:(id)data;

@end
