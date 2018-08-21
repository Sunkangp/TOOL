//
//  SHA.m
//  QQQQQQQQQQQQQQQQQ
//
//  Created by sunkang on 2018/7/13.
//  Copyright © 2018年 sunkang. All rights reserved.
//

#import "SHA.h"
#include <CommonCrypto/CommonDigest.h>
#include <CommonCrypto/CommonHMAC.h>

@implementation SHA

+ (NSString*)sha256:(NSString *)stringToSign{
        const char *cstr = [stringToSign cStringUsingEncoding:NSUTF8StringEncoding];
        NSData *data = [NSData dataWithBytes:cstr length:stringToSign.length];
        
        uint8_t digest[CC_SHA256_DIGEST_LENGTH];
        
        CC_SHA256(data.bytes, data.length, digest);
        
        NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
        
        for(int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++)
            [output appendFormat:@"%02x", digest[i]];
        
        return output;
  
}
@end
