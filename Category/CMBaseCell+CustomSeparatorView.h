//
//  CMBaseCell+CustomSeparatorView.h
//  cdleishisdk
//
//  Created by mrdai on 13-10-16.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import "CMBaseCell.h"

@interface CMBaseCell (CustomSeparatorView)

- (UIView *)normalSeperatorWithColor:(UIColor *)color withHeight:(CGFloat)height;
- (UIView *)highlightSeperatorWithColor:(UIColor *)color withHighlightColor:(UIColor *)highlightColor;

@end
