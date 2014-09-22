//
//  Helper_UI.m
//  cdleishisdk
//
//  Created by mrdai on 13-10-18.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import "Helper_UI.h"

@implementation Helper_UI

+(void)showAlertMessage:(NSString *)message
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertView show];
}

+(void)showAlertMessageWithTitle:(NSString *)title andMessage:(NSString*)msg
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}

@end
