//
//  Macro_Singleton.h
//  cdleishisdk
//
//  Created by mrdai on 13-10-15.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

/**
 *  单列宏
 *  1.调用   [classname sharedInstance]
 *  2.声明周期
 *          -(void)instanceDidCreated; //创建
 *          -(void)willTerminate;      //app结束
 */

#ifndef cdleishisdk_Macro_Singleton_h
#define cdleishisdk_Macro_Singleton_h

#define SINGLETON_CLASS(classname)\
\
static classname *shared##classname = nil;\
+(classname *)sharedInstance\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^\
{\
shared##classname = [[self alloc] init];\
});\
return shared##classname;\
}\
\
-(id)init\
{\
if(shared##classname != nil)\
{\
[NSException raise:NSInternalInconsistencyException format:@"[%@ %@] cannot be called; use +[%@ %@] instead",NSStringFromClass([self class]), \
NSStringFromSelector(_cmd), \
NSStringFromClass([self class]),\
NSStringFromSelector(@selector(shared##classname))];\
}\
else if(self=[super init])\
{\
shared##classname = self;\
if ([self respondsToSelector:@selector(instanceDidCreated)])\
[shared##classname performSelector:@selector(instanceDidCreated)];\
if ([self respondsToSelector:@selector(willTerminate)])\
[[NSNotificationCenter defaultCenter] addObserver:shared##classname selector:@selector(willTerminate) name:UIApplicationWillTerminateNotification object:nil];\
if ([self respondsToSelector:@selector(didReceiveMemoryWarning)])\
[[NSNotificationCenter defaultCenter] addObserver:shared##classname selector:@selector(didReceiveMemoryWarning) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];\
}\
return shared##classname;\
}\
\
-(void)dealloc\
{\
[[NSNotificationCenter defaultCenter] removeObserver:self];\
}\
\
/**
*  service单列宏定义
*
*  @param classname
*  @param hostName
*
*  @return
*/
#define SINGLETON_CLASS_FOR_SERVICE(classname,hostName)\
\
static classname *shared##classname = nil;\
+(classname *)sharedInstance\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^\
{\
shared##classname = [[self alloc] initWithHostName:hostName customHeaderFields:nil];\
});\
return shared##classname;\
}\
\
-(id)init\
{\
if(shared##classname != nil)\
{\
[NSException raise:NSInternalInconsistencyException format:@"[%@ %@] cannot be called; use +[%@ %@] instead",NSStringFromClass([self class]), \
NSStringFromSelector(_cmd), \
NSStringFromClass([self class]),\
NSStringFromSelector(@selector(shared##classname))];\
}\
else if(self=[super init])\
{\
shared##classname = self;\
if ([self respondsToSelector:@selector(instanceDidCreated)])\
[shared##classname performSelector:@selector(instanceDidCreated)];\
if ([self respondsToSelector:@selector(willTerminate)])\
[[NSNotificationCenter defaultCenter] addObserver:shared##classname selector:@selector(willTerminate) name:UIApplicationWillTerminateNotification object:nil];\
if ([self respondsToSelector:@selector(didReceiveMemoryWarning)])\
[[NSNotificationCenter defaultCenter] addObserver:shared##classname selector:@selector(didReceiveMemoryWarning) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];\
}\
return shared##classname;\
}\
\
-(void)dealloc\
{\
[[NSNotificationCenter defaultCenter] removeObserver:self];\
}\

#endif
