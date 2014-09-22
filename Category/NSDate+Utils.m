//
//  NSDate+Utils.m
//  cdleishisdk
//
//  Created by mrdai on 13-10-15.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import "NSDate+Utils.h"

//static double ticksToNanoseconds = 0.0;

@implementation NSDate (Utils)

+(NSString*)date:(NSDate*)date withFormat:(NSString*)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:date];
}

+(NSString*)currentTimeWithFormat:(NSString*)format
{
    return [self date:[NSDate date] withFormat:format];
}

+(NSString*)currentTimeWithFormat:(NSString*)format andOffsetDay:(NSInteger)offset
{
    NSTimeInterval interval = offset*HOURS*MINUTE*SECOND;
    NSDate *offsetDate = [NSDate dateWithTimeIntervalSinceNow:interval];
    return [self date:offsetDate withFormat:format];
}

+(NSDate*)dateFromString:(NSString*)dateString withFormat:(NSString*)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setDateFormat:format];
    //转换成通一格式
    dateString = [dateString stringByReplacingOccurrencesOfString:@"/" withString:@"-"];
    return [dateFormatter dateFromString:dateString];
}

+(NSArray *) compareCurrentTime:(NSDate*) compareDate
{
    NSTimeInterval  timeInterval = [compareDate timeIntervalSinceNow];
    int days = timeInterval/Day_Second ;
    int hours = (timeInterval -days*Day_Second)/Hours_Second;
    int minutes = (timeInterval -days*Day_Second - hours*Hours_Second)/MINUTE;
    int seconds = (timeInterval -days*Day_Second - hours*Hours_Second - minutes*SECOND);
    NSString *result = StringFormat(@"还剩%d天%d小时%d分钟%d秒",days,hours,minutes,seconds);
    DLog(@"%@",result);
    return @[@(days),@(hours),@(minutes),@(seconds)];
}

+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:Default_TimeFormat];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    NSLog(@"date1 : %@, date2 : %@", oneDay, anotherDay);
    if (result == NSOrderedDescending)
    {
        //NSLog(@"Date1  is in the future");
        return 1;
    }
    else if (result == NSOrderedAscending)
    {
        //NSLog(@"Date1 is in the past");
        return -1;
    }
    //NSLog(@"Both dates are the same");
    return 0;
}

+ (NSString *)stringDate:(NSString *)string
{
    //判断获取的时间格式类型
    NSString *geshistring = @"-";
    NSString *geshistring1 = @"/";
    NSRange range = [string rangeOfString:geshistring];
    NSRange range1 = [string rangeOfString:geshistring1];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    
    [formatter setTimeZone:timeZone];
    if (range.length>0) {
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
    if (range1.length>0) {
        [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    }
    
    NSDate *dateTime = [formatter dateFromString:string];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formatter stringFromDate:dateTime];
}

+ (NSDate *)dateFromString:(NSString *)dateString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    return destDate;
}

@end
