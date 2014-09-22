//
//  Macro_Device.h
//  cdleishisdk
//
//  Created by mrdai on 13-10-15.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

/**
 *  设备相关的宏
 */

#ifndef cdleishisdk_Macro_Device_h
#define cdleishisdk_Macro_Device_h

#define IS_IPHONE() ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define is_iPhone5 ([UIDevice currentResolution]==UIDevice_iPhoneTallerHiRes)

//屏幕尺寸模块
#define kDeviceWidth  [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height
//状态栏
#define kStaHeight 20.0f
//导航栏高度
#define kNavHeight 44.0f
//tabbar高度
#define kTabHeight 49.0f


#define DEVICE_NAME             [[UIDevice currentDevice] name]
#define DEVICE_MODEL            [[UIDevice currentDevice] model]
#define DEVICE_SYSTEMVERSION    [[UIDevice currentDevice] systemVersion]

#define IS_IOS7 ([DEVICE_SYSTEMVERSION compare:@"7.0"] != NSOrderedAscending)

#endif
