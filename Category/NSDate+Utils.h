//
//  NSDate+Utils.h
//  cdleishisdk
//
//  Created by mrdai on 13-10-15.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MONTH 30
#define WEEK 7
#define HOURS 24
#define MINUTE 60
#define SECOND 60

#define Day_Second (HOURS*MINUTE*SECOND)
#define Hours_Second (MINUTE*SECOND)

#define Default_TimeFormat @"yyyy-MM-dd HH:mm:ss"

@interface NSDate (Utils)

//NSDate to NSString
+(NSString*)currentTimeWithFormat:(NSString*)format;
+(NSString*)currentTimeWithFormat:(NSString*)format andOffsetDay:(NSInteger)offset;
+(NSString*)date:(NSDate*)date withFormat:(NSString*)format;

//NSString to NSDate
+(NSDate*)dateFromString:(NSString*)dateString withFormat:(NSString*)format;


+(NSArray *) compareCurrentTime:(NSDate*) compareDate;

/**
 *  日期比较
 *
 *  @param oneDay
 *  @param anotherDay
 *
 *  @return 1 oneDay is in the future
 *         -1 oneDay is in the past
 *          0 Both dates are the same
 */
+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;

+ (NSString *)stringDate:(NSString *)string;
+ (NSDate *)dateFromString:(NSString *)dateString;
@end
