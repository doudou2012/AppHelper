//
//  CMNavigationController.h
//  cdleishisdk
//
//  Created by mrdai on 13-10-16.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMNavigationController : UINavigationController

@property (nonatomic, strong) UIImage *backgroundImage;

- (id)initWithRootViewController:(UIViewController *)rootViewController;

@end
