//
//  UIScrollView+ScrollToBottom.m
//  cdleishisdk
//
//  Created by mrdai on 13-10-15.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import "UIScrollView+ScrollToBottom.h"

@implementation UIScrollView (ScrollToBottom)

-(void)scrollToBottom:(BOOL)animation
{
    CGSize contentSize = self.contentSize;
    CGRect frame = self.bounds;
    frame.origin.y = MAX(0, contentSize.height-frame.size.height);
    [self scrollRectToVisible:frame animated:animation];
}

@end
