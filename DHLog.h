//
//  DHLog.h
//  cdleishisdk
//
//  Created by mrdai on 13-11-15.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#ifndef cdleishisdk_DHLog_h
#define cdleishisdk_DHLog_h

#import "LoggerClient.h"
#import "LoggerCommon.h"

//NSLogger service config
#define NSLogger_Host @"192.168.3.101"
#define NSLogger_Port 50000

//NSLogger Tag config
#define LogTag_Normal   @"普通日志"
#define LogTag_NetWork  @"网络请求日志"
#define LogTag_Error    @"错误日志"
#define LogTag_Data     @"数据日志"
#define LogTag_Image    @"图片日志"

#ifdef DEBUG
    #define NSLogTag(tag,...)       LogMessageF( __FILE__,__LINE__,__FUNCTION__, tag, 0, __VA_ARGS__)
    #define NSLogData(tag,data)     LogData(tag, 0, data)
    #define NSLogImage(tag,image)   LogImageData(tag, 0, image.size.width, \
                                                         image.size.height, UIImagePNGRepresentation(image))

    #define DHLog_Normal(...)   NSLogTag(LogTag_Normal,__VA_ARGS__)
    #define DHLog_NetWork(...)  NSLogTag(LogTag_NetWork,__VA_ARGS__)
    #define DHLog_Error(...)    NSLogTag(LogTag_Error,__VA_ARGS__)
    #define DHLogData(data)     NSLogData(LogTag_Data,data)
    #define DHLogImage(image)   NSLogImage(LogTag_Image,image)
#else
    #define DHLog_Normal(...)
    #define DHLog_NetWork(...)
    #define DHLog_Error(...)
    #define DHLogData(data)
    #define DHLogImage(image)   
#endif

#endif
