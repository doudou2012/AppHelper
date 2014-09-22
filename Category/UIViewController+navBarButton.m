//
//  UIViewController+navBarButton.m
//  cdleishisdk
//
//  Created by mrdai on 13-10-15.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import "UIViewController+navBarButton.h"

@implementation UIViewController (navBarButton)

@dynamic defaultBarItemTextColor;
@dynamic defaultBackbuttonBg;

- (void)gotoBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIBarButtonItem *)barButtonItemWithName:(NSString *)name withNormalImage:(UIImage *)normalImage withHighlightedImage:(UIImage *)highlightedImage withAction:(SEL)action
{
    UIFont *buttonFont = [UIFont systemFontOfSize:15.0f];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    CGSize nameSize;
    
    if (IS_IOS7)
    {
        NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    buttonFont,NSFontAttributeName,
                                    nil];
        nameSize = [name sizeWithAttributes:attributes];
    }
    else
    {
        nameSize = [name sizeWithFont:buttonFont];
    }
    
    button.frame = CGRectMake(0, 0, MAX(normalImage.size.width,nameSize.width), normalImage.size.height);
    button.titleLabel.font = buttonFont;
    
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:name forState:UIControlStateNormal];
    [button setTitle:name forState:UIControlStateHighlighted];
    [button setTitleColor:self.defaultBarItemTextColor?self.defaultBarItemTextColor:[UIColor blackColor]
                 forState:UIControlStateNormal];
    [button setTitleColor:self.defaultBarItemTextColor?self.defaultBarItemTextColor:[UIColor blackColor]
                 forState:UIControlStateHighlighted];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)addDefualtBackBarButton
{
    [self addBackBarButtonWithTitle:nil];
}
- (void)addBackBarButtonWithTitle:(NSString *)title
{
    self.navigationItem.leftBarButtonItem = [self barButtonItemWithName:title?title:@"返回"
                                                        withNormalImage:[UIImage imageNamed:self.defaultBackbuttonBg?self.defaultBackbuttonBg:@"button_naLeft"]
                                                   withHighlightedImage:nil
                                                             withAction:@selector(gotoBack)];
    
    UIButton *button = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, -25, 0, 0)];
}


#pragma mark
#pragma mark custom

- (void)addLeftBarButtonWithImage:(NSString *)image andTiltle:(NSString*)title withAction:(SEL)action
{
    self.navigationItem.leftBarButtonItem = [self barButtonItemWithName:title withNormalImage:[UIImage imageNamed:image] withHighlightedImage:nil withAction:action];
}

- (void)addRightBarButtonWithImage:(NSString *)image andTiltle:(NSString*)title withAction:(SEL)action
{
    self.navigationItem.rightBarButtonItem = [self barButtonItemWithName:title withNormalImage:[UIImage imageNamed:image] withHighlightedImage:nil withAction:action];
    UIButton *button = (UIButton *)self.navigationItem.rightBarButtonItem.customView;
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -25)];
}

-(void)clearLeftButton:(BOOL)clearLeft RightButton:(BOOL)clearRight
{
    if (clearLeft)
    {
        self.navigationItem.leftBarButtonItem = nil;
    }
    if (clearRight)
    {
        self.navigationItem.rightBarButtonItem = nil;
    }
}

@end
