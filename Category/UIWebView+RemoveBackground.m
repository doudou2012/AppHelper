//
//  UIWebView+RemoveBackground.m
//  cdleishisdk
//
//  Created by mrdai on 13-10-15.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import "UIWebView+RemoveBackground.h"

@implementation UIWebView (RemoveBackground)

- (void)removeBackgroundView
{
    id scrollview = (self.subviews)[0];
    for (UIView *subview in [scrollview subviews])
    {
        if ([subview isKindOfClass:[UIImageView class]])
        {
            subview.hidden = YES;
        }
    }
}

@end
