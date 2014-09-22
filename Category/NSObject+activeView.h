//
//  NSObject+activeView.h
//  cdleishisdk
//
//  Created by mrdai on 13-10-17.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//
/**
 *  获取当前活动视图
 */
#import <Foundation/Foundation.h>

@interface NSObject (activeView)

-(UIWindow *)currentWindow;
-(UIViewController *)currentController;
-(UIView *)currentView;

@end
