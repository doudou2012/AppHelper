//
//  Macro_APP.h
//  cdleishisdk
//
//  Created by mrdai on 13-10-15.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

/**
 *  APP相关的宏
 */

#ifndef cdleishisdk_Macro_APP_h
#define cdleishisdk_Macro_APP_h

#define APP_VERSION\
    [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleVersionKey]

#define APP_BundleName\
    [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleNameKey]


#endif
