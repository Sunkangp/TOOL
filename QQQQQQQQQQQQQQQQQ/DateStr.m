//
//  DateStr.m
//  QQQQQQQQQQQQQQQQQ
//
//  Created by sunkang on 2018/7/13.
//  Copyright © 2018年 sunkang. All rights reserved.
//

#import "DateStr.h"

@implementation DateStr

+ (NSString *)currentTimeStrWitnFormat:(NSString *)str{
    NSDate *senddate = [NSDate date];
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:str];
    NSString *currentTimeStr = [dateformatter stringFromDate:senddate];
    return currentTimeStr;
}


+(NSString*)currentTimeWithday:(int)day{
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    NSTimeInterval  oneDay = 24*60*60*1;  //1天的长度
    NSDate *theDate = [localeDate initWithTimeIntervalSinceNow: -oneDay*day];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd"];
    NSString *  currentTimeStr=[dateformatter stringFromDate:theDate];
    return currentTimeStr;
}


+(NSString*)currentTimeCuo{
    NSDate* dat = [NSDate date];
    NSTimeInterval a=[dat timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%.0f",a];
    return timeString;
}
+(NSString*)currentTimeWithFifteen{//获取15分钟前的时间字符串
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    NSTimeInterval  oneMin = 60;  //1天的长度
    NSDate *theDate = [localeDate initWithTimeIntervalSinceNow: -oneMin*15];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"HH:mm:ss"];
    NSString *  currentTimeStr=[dateformatter stringFromDate:theDate];
    return currentTimeStr;
}

+ (NSString*)getNewSid {
    
    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    NSString *uuid= (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
    uuid =[uuid stringByReplacingOccurrencesOfString:@"-" withString:@""];
    return uuid;
}



@end
