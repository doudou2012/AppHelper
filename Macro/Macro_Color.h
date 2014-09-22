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



UIColor * hexStringToColor(NSString * stringToConvert)
{
     NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
     // String should be 6 or 8 characters
 
     if ([cString length] < 6) return [UIColor blackColor];
     // strip 0X if it appears
     if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
     if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
     if ([cString length] != 6) return [UIColor blackColor];
 
     // Separate into r, g, b substrings
 
     NSRange range;
     range.location = 0;
     range.length = 2;
     NSString *rString = [cString substringWithRange:range];
     range.location = 2;
     NSString *gString = [cString substringWithRange:range];
     range.location = 4;
     NSString *bString = [cString substringWithRange:range];
     // Scan values
     unsigned int r, g, b;
 
     [[NSScanner scannerWithString:rString] scanHexInt:&r];
     [[NSScanner scannerWithString:gString] scanHexInt:&g];
     [[NSScanner scannerWithString:bString] scanHexInt:&b];
 
     return [UIColor colorWithRed:((float) r / 255.0f)
                                 green:((float) g / 255.0f)
                                   blue:((float) b / 255.0f)
                                 alpha:1.0f];
}
#endif
