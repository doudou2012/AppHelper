//
//  UIViewController+navBarButton.h
//  cdleishisdk
//
//  Created by mrdai on 13-10-15.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

/**
 *  自定义nav按钮
 */

#import <UIKit/UIKit.h>

@interface UIViewController (navBarButton)

// Baritem字体颜色
@property (nonatomic,strong) UIColor *defaultBarItemTextColor;
//Baritem背景
@property (nonatomic,strong) NSString *defaultBackbuttonBg;

/**
 *  添加默认返回按钮
 */
- (void)addDefualtBackBarButton;
/**
 *  添加默认返回按钮
 *
 *  @param title 返回按钮标题
 */
- (void)addBackBarButtonWithTitle:(NSString *)title;

/**
 *  leftItem自定义图片
 *
 *  @param image  image name
 *  @param action action
 */
- (void)addLeftBarButtonWithImage:(NSString *)image andTiltle:(NSString*)title withAction:(SEL)action;

/**
 *  rightItem自定义图片
 *
 *  @param image  image name
 *  @param action action
 */
- (void)addRightBarButtonWithImage:(NSString *)image andTiltle:(NSString*)title withAction:(SEL)action;


/**
 *  自定义barItem
 *
 *  @param name
 *  @param normalImage
 *  @param highlightedImage
 *  @param action
 *
 *  @return 
 */
- (UIBarButtonItem *)barButtonItemWithName:(NSString *)name withNormalImage:(UIImage *)normalImage withHighlightedImage:(UIImage *)highlightedImage withAction:(SEL)action;

/**
 *  baritem置nil
 *
 *  @param clearLeft  yes置nil
 *  @param clearRight no忽略
 */
-(void)clearLeftButton:(BOOL)clearLeft RightButton:(BOOL)clearRight;

@end
