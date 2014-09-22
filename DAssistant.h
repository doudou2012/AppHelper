//
//  DAssistant.h
//  cdleishisdk
//
//  Created by mrdai on 13-11-15.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//
/**
 *  DAssistant入口
 */
#import <Foundation/Foundation.h>

#import "DHLog.h"
#import "Bases.h"
#import "Helpers.h"
#import "Macros.h"
#import "librarys.h"
#import "Categorys.h"

//for NetWorkDebug
#define NetWorkKitLog_Params 1
#define NetWorkKitLog_Response 1
#define NetWorkKitLog_Request 1

@interface DAssistant : NSObject

+(DAssistant*)sharedInstance;

@end
