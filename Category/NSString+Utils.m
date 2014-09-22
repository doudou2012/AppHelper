//
//  NSString+Utils.m
//  cdleishisdk
//
//  Created by mrdai on 13-10-18.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

+(BOOL)isEmpty:(NSString *)testString
{
    return ((testString == nil)||testString.length<=0);
}

-(BOOL)isValidateEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

-(BOOL)isValidateMobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:self];
}


-(NSString *)getUrlwithSize:(CGSize)size
{
    if (self!=nil&&self.length>0)
    {
        NSArray *strings =  [self componentsSeparatedByString:@"."];
        NSString *houzui = [strings lastObject];
        NSString *newStrings = self;
        if (houzui)
        {
            newStrings = [self stringByReplacingOccurrencesOfString:StringFormat(@".%@",houzui)
                                                              withString:StringFormat(@"-%d-%d.%@",(int)size.width,(int)size.height,houzui)];
        }
        return newStrings;
    }
    return @"";
}


@end
