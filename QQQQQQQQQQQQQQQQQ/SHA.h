//
//  SHA.h
//  QQQQQQQQQQQQQQQQQ
//
//  Created by sunkang on 2018/7/13.
//  Copyright © 2018年 sunkang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHA : NSObject

+ (NSString*)sha256:(NSString *)stringToSign;
@end
