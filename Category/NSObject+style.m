//
//  NSObject+style.m
//  cdleishisdk
//
//  Created by mrdai on 13-10-18.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import "NSObject+style.h"

@implementation NSObject (style)

-(void)styleForEmail
{
    [self styleForEditMode];
    
    if ([self respondsToSelector:@selector(setKeyboardType:)])
    {
        [(UITextField*)self setKeyboardType:UIKeyboardTypeEmailAddress];
    }
    if ([self respondsToSelector:@selector(setAutocapitalizationType:)])
    {
        [(UITextField*)self setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    }
}

-(void)styleForUserName
{
    [self styleForEditMode];
    
    if ([self respondsToSelector:@selector(setAutocapitalizationType:)])
    {
        [(UITextField*)self setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    }
    if ([self respondsToSelector:@selector(setKeyboardType:)])
    {
        [(UITextField*)self setKeyboardType:UIKeyboardTypeEmailAddress];
    }
}

-(void)styleForPhone
{
    [self styleForEditMode];
    
    if ([self respondsToSelector:@selector(setKeyboardType:)])
    {
        [(UITextField*)self setKeyboardType:UIKeyboardTypeNumberPad];
    }
}

-(void)styleForNumberCanEdit:(BOOL)edit
{
    if (edit)
    {
        [self styleForEditMode];
    }
    if ([self respondsToSelector:@selector(setKeyboardType:)])
    {
        [(UITextField*)self setKeyboardType:UIKeyboardTypeNumberPad];
    }
}

-(void)styleForPassWorld
{
    [self styleForEditMode];
    if ([self respondsToSelector:@selector(setSecureTextEntry:)])
    {
        [self setValue:@(YES) forKey:@"secureTextEntry"];
    }
}

-(void)styleForEditMode
{
    if ([self respondsToSelector:@selector(setClearButtonMode:)])
    {
        [(UITextField*)self setClearButtonMode:UITextFieldViewModeWhileEditing];
    }
}


-(void)styleWithFont:(UIFont *)font color:(UIColor *)color
{
    if (font&&[self respondsToSelector:@selector(setFont:)])
    {
        [self setValue:font forKey:@"font"];
    }
    if (color&&[self respondsToSelector:@selector(setTextColor:)])
    {
        [self setValue:color forKey:@"textColor"];
    }
}

-(void)styleWithSystemFontSize:(CGFloat)size color:(UIColor *)color
{
    [self styleWithFont:[UIFont systemFontOfSize:size] color:color];
}

@end
