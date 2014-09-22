//
//  CMNavigationController.m
//  cdleishisdk
//
//  Created by mrdai on 13-10-16.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import "CMNavigationController.h"
#import <QuartzCore/QuartzCore.h>

@interface CMNavigationController ()

@end

@implementation CMNavigationController

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    return [super initWithRootViewController:rootViewController];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//  去掉背景图片用纯色代替
//    [self.navigationBar.layer setMasksToBounds:YES];
//    if(IS_IPHONE())
//        self.backgroundImage = [UIImage imageNamed:@"Top_Bar.png"];
//    else
//        self.backgroundImage = [UIImage imageNamed:@"SetTopBarHD.png"];
}

-(void)setBackgroundImage:(UIImage *)aBackgroundImage
{
    [self.navigationBar setBackgroundImage:aBackgroundImage
                             forBarMetrics:UIBarMetricsDefault];
}

- (UIImage *)backgroundImage
{
    return [self.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault];
}

- (BOOL)disablesAutomaticKeyboardDismissal
{
    return [self.topViewController disablesAutomaticKeyboardDismissal];
}

#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    DHLog_Normal(@"内存警告");
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    if (IS_IPHONE())
    {
        return NO;
    }else
    {
        return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
    }
}

@end
