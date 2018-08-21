//
//  DateStr.h
//  QQQQQQQQQQQQQQQQQ
//
//  Created by sunkang on 2018/7/13.
//  Copyright © 2018年 sunkang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateStr : NSObject
+(NSString*)currentTimeStrWitnFormat:(NSString*)str;//当前时间的字符串
+(NSString*)currentTimeWithday:(int)day;//day天之前的日期
+(NSString*)currentTimeCuo;//获取当前的时间戳
+(NSString*)currentTimeWithFifteen;//获取15分钟前的时间字符串



+(NSString*)getNewSid;//获取随机数
@end
