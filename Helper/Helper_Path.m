//
//  Helper_Path.m
//  cdleishisdk
//
//  Created by mrdai on 13-10-15.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import "Helper_Path.h"

@implementation Helper_Path

static NSString *documentPath = nil;
static NSString *cachePath = nil;

+ (NSString *)documentDirectory
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        documentPath = paths[0];
    });
    return documentPath;
}

+ (NSString *)cacheDirectory
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        NSArray *cache = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        cachePath = cache[0] ;
    });
    return cachePath;
}

+ (NSString *)filePathInDocument:(NSString *)filename
{
    return [[self documentDirectory] stringByAppendingPathComponent:filename];
}

+ (NSString *)filePathInCacheDirectory:(NSString *)filename
{
    return [[self cacheDirectory] stringByAppendingPathComponent:filename];
}

+ (NSString *)filePathInMainBundle:(NSString *)filename
{
    if (filename != nil)
    {
        NSArray *keywords = [filename componentsSeparatedByString:@"."];
        NSString *suffix = keywords[[keywords count]-1];
        NSUInteger length = [filename length] - [suffix length];
        NSString *path = [[NSBundle mainBundle] pathForResource:[filename substringToIndex:length-1] ofType:suffix];
        return path;
    }
    return nil;
}

+ (BOOL)addSkipBackupAttributeToItemAtPath:(NSString *)path
{
    NSURL *url = [NSURL fileURLWithPath:path];
    
    const char* filePath = [[url path] fileSystemRepresentation];
    const char* attrName = "com.apple.MobileBackup";
    u_int8_t attrValue = 1;
    int result = setxattr(filePath, attrName, &attrValue, sizeof(attrValue), 0, 0);
    return result == 0;
}

@end
