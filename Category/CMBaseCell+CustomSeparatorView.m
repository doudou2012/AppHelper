//
//  CMBaseCell+CustomSeparatorView.m
//  cdleishisdk
//
//  Created by mrdai on 13-10-16.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import "CMBaseCell+CustomSeparatorView.h"

@implementation CMBaseCell (CustomSeparatorView)

- (UIView *)normalSeperatorWithColor:(UIColor *)color withHeight:(CGFloat)height
{
    //使highlight状态下separator不消失，所以用UIControl
    UIControl *graySeperator = [[UIControl alloc] initWithFrame:CGRectMake(0.0f, self.frame.size.height - height, self.frame.size.width, height)];
    graySeperator.backgroundColor = color;
    graySeperator.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    return graySeperator;
}

- (UIView *)highlightSeperatorWithColor:(UIColor *)color withHighlightColor:(UIColor *)highlightColor
{
    CGFloat height = 2.0f;
    CGRect frame = CGRectMake(0.0f, self.frame.size.height - height, self.frame.size.width, height);
    UIControl *commonSeperator = [[UIControl alloc] initWithFrame:frame];
    commonSeperator.backgroundColor = highlightColor;
    commonSeperator.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    UIControl *graySeperator = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height / 2.0f)];
    graySeperator.backgroundColor = color;
    [commonSeperator addSubview:graySeperator];
    commonSeperator.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    
    return commonSeperator;
}

@end
