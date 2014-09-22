//
//  CMViewController.h
//  cdleishisdk
//
//  Created by mrdai on 13-10-16.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

typedef enum
{
    UIViewControllerType_Out=0, //一个VC到当前VC
    UIViewControllerType_In   //从一个VC返回到当前VC
}UIViewControllerType;

#import <UIKit/UIKit.h>

@interface CMViewController : UIViewController

/**
 *  uiviewcontroller跳转方式
 */
@property (nonatomic,assign) UIViewControllerType vcType;

/**
 *  标题
 */
@property (nonatomic, strong) UILabel *titleLabelView;

@end
