//
//  Helper_Device.h
//  cdleishisdk
//
//  Created by mrdai on 13-10-21.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//
//设备相关操作
#import <Foundation/Foundation.h>

@interface Helper_Device : NSObject

/**
 *  拨打电话
 *
 *  @param telPhone 电话号码
 */
+(void)callToString:(NSString*)telPhone;

@end
