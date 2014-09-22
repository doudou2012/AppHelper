//
//  NSObject+style.h
//  cdleishisdk
//
//  Created by mrdai on 13-10-18.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (style)

#pragma mark
#pragma mark uitextfiled style

/**
 *  uitextfiled email样式
 */
-(void)styleForEmail;

/**
 *  uitextfiled 用户名样式
 */
-(void)styleForUserName;

/**
 *  uitextfiled phone样式
 */
-(void)styleForPhone;

/**
 *  uitextfiled 数字样式
 */
-(void)styleForNumberCanEdit:(BOOL)edit;

/**
 *  uitextfiled 密码样式
 */
-(void)styleForPassWorld;

/**
 *  uitextfiled 编辑模式
 */
-(void)styleForEditMode;

/**
 *  uitextfiled 字体和颜色
 *
 *  @param font
 *  @param color
 */
-(void)styleWithFont:(UIFont *)font color:(UIColor *)color;

/**
 *  uitextfiled 系统字体和颜色
 *
 *  @param size
 *  @param color 
 */
-(void)styleWithSystemFontSize:(CGFloat)size color:(UIColor *)color;

@end
