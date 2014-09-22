//
//  NSObject+activeView.m
//  cdleishisdk
//
//  Created by mrdai on 13-10-17.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import "NSObject+activeView.h"

@implementation NSObject (activeView)

-(UIWindow*)currentWindow
{
    id appDelegate = [UIApplication sharedApplication].delegate;
    return (UIWindow *)[appDelegate valueForKey:@"window"];
}
-(UIViewController *)currentController
{
    UIWindow *window = self.currentWindow;
    UIViewController *viewController;
    if ([window.rootViewController isKindOfClass:[UINavigationController class]])
    {
        UINavigationController *navigationController = (UINavigationController *)window.rootViewController;
        viewController = navigationController.visibleViewController;
    }else if ([window.rootViewController isKindOfClass:[UITabBarController class]])
    {
        UITabBarController *tabBarController = (UITabBarController *)window.rootViewController;
        if ([tabBarController.selectedViewController isKindOfClass:[UINavigationController class]])
        {
            UINavigationController *navigationController = (UINavigationController *)tabBarController.selectedViewController;
            viewController = navigationController.visibleViewController;
        }else
        {
            viewController = tabBarController.selectedViewController;
        }
    }else
    {
        viewController = window.rootViewController;
    }
    return viewController;
}

-(UIView*)currentView
{
    return self.currentController.view;
}

@end
