//
//  JsonParse.m
//  QQQQQQQQQQQQQQQQQ
//
//  Created by sunkang on 2018/7/13.
//  Copyright © 2018年 sunkang. All rights reserved.
//

#import "JsonParse.h"


@implementation JsonParse

//json解析
+ (id) jsonParseWithString:(NSString*)jsonString
{
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    return [JsonParse jsonParseWithData:jsonData];
}

+ (id) jsonParseWithData:(NSData *)jsonData
{
    NSError *error = nil;
    if (jsonData == nil) {
        return nil;
    }
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
    if (jsonObject != nil && error == nil)
    {
        if ([jsonObject isKindOfClass:[NSDictionary class]])
        {
            NSDictionary *deserializedDictionary = (NSDictionary *)jsonObject;
            return deserializedDictionary;
        }
        else if ([jsonObject isKindOfClass:[NSArray class]])
        {
            NSArray *deserializedArray = (NSArray *)jsonObject;
            return deserializedArray;
        }
    }
    return nil;
}


+ (NSString *)JsonStringWithdata:(id)data
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        return nil;
    }
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end
