//
//  UIDevice+Resolutions.m
//  cdleishisdk
//
//  Created by mrdai on 13-10-15.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import "UIDevice+Resolutions.h"

@implementation UIDevice (Resolutions)

+ (UIDeviceResolution) currentResolution
{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)] && [[UIScreen mainScreen] scale] == 2.0)
        {
            CGSize result = [[UIScreen mainScreen] bounds].size;
            result = CGSizeMake(result.width * [UIScreen mainScreen].scale, result.height * [UIScreen mainScreen].scale);
            return (result.height == 960 ? UIDevice_iPhoneHiRes : UIDevice_iPhoneTallerHiRes);
        }
        else
        {
            return UIDevice_iPhoneStandardRes;
        }
    }
    else
    {
        return (([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) ? UIDevice_iPadHiRes : UIDevice_iPadStandardRes);
    }
}

@end
