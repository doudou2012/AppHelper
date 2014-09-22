//
//  Helper_Path.h
//  cdleishisdk
//
//  Created by mrdai on 13-10-15.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//
/**
 *  ios文件路径
 */
#import <Foundation/Foundation.h>
#include <sys/xattr.h>

@interface Helper_Path : NSObject

+ (NSString *)documentDirectory;
+ (NSString *)cacheDirectory;
+ (NSString *)filePathInDocument:(NSString *)filename;
+ (NSString *)filePathInMainBundle:(NSString *)filename;
+ (NSString *)filePathInCacheDirectory:(NSString *)filename;

/**
 加上文件不能被系统删除的标志，
 */
+ (BOOL)addSkipBackupAttributeToItemAtPath:(NSString *)path;

@end
