//
//  NSString+Utils.h
//  cdleishisdk
//
//  Created by mrdai on 13-10-18.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Utils)

/**
 *  判断字符串是否为nil或者@""
 *  @return YES为空
 */
+(BOOL)isEmpty:(NSString *)testString;

/**
 *  判断是否是邮箱
 *
 *  @return YES是邮箱
 */
-(BOOL)isValidateEmail;

/**
 *  是否是手机号码
 *
 *
 *  @return YES是手机号
 */
-(BOOL)isValidateMobile;


-(NSString *)getUrlwithSize:(CGSize)size;

@end
