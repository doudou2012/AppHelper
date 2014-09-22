//
//  UIColor+Utils.h
//  cdleishisdk
//
//  Created by mrdai on 13-10-15.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Utils)

/**
 *  16进制颜色(html颜色值)字符串转为UIColor
 *
 *  @param stringToConvert 16进制颜色
 *
 *  @return uicolor
 */
+(UIColor *) hexStringToColor: (NSString *) stringToConvert;

@end
