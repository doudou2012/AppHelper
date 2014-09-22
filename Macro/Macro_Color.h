//
//  Macro_Color.h
//  cdleishisdk
//
//  Created by mrdai on 13-10-15.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

/**
 *  颜色相关的宏
 */

#ifndef cdleishisdk_Macro_Color_h
#define cdleishisdk_Macro_Color_h

#define RGBCOLOR_MAX 255.0

#define RGBCOLOR(r,g,b)\
    [UIColor colorWithRed:(r)/(RGBCOLOR_MAX) green:(g)/(RGBCOLOR_MAX) blue:(b)/(RGBCOLOR_MAX) alpha:1]

#define RGBACOLOR(r,g,b,a)\
    [UIColor colorWithRed:(r)/(RGBCOLOR_MAX) green:(g)/(RGBCOLOR_MAX) blue:(b)/(RGBCOLOR_MAX) alpha:(a)]

#endif
