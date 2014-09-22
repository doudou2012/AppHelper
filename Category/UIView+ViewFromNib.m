//
//  UIView+ViewFromNib.m
//  cdleishisdk
//
//  Created by mrdai on 13-10-15.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import "UIView+ViewFromNib.h"

@implementation UIView (ViewFromNib)

+ (UIView *)viewFromNib
{
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    return [views objectAtIndex:0];
}

@end
