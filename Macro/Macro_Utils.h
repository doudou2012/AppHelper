//
//  Macro_Utils.h
//  cdleishisdk
//
//  Created by mrdai on 13-10-15.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#ifndef cdleishisdk_Macro_Utils_h
#define cdleishisdk_Macro_Utils_h

//字符串
#define StringFormat(a,...) [NSString stringWithFormat:a,##__VA_ARGS__]

//rect改变
/**
 *  rect只改变x,y
 *
 *  @param rect 要改变的rect
 *  @param x    x(若为NSNotFound则不改变)
 *  @param y    y
 *
 *  @return 改变后的rect
 */
CG_INLINE CGRect
CGRectChangeXY(CGRect rect,CGFloat x, CGFloat y)
{
    if (x != NSNotFound)
    {
        rect.origin.x = x;
    }
    if (y != NSNotFound)
    {
        rect.origin.y = y;
    }
    return rect;
}
/**
 *  rect只改变width,height
 *
 *  @param rect   要改变的rect
 *  @param width  width(若为NSNotFound则不改变)
 *  @param height height
 *
 *  @return 改变后的rect
 */
CG_INLINE CGRect
CGRectChangeWH(CGRect rect,CGFloat width, CGFloat height)
{
    if (width != NSNotFound)
    {
        rect.size.width = width;
    }
    if (height != NSNotFound)
    {
        rect.size.height = height;
    }
    return rect;
}

/**
 *  size只改变width,height
 *
 *  @param size   要改变的size
 *  @param width  新的width(若为NSNotFound则不改变)
 *  @param height 新的height
 *
 *  @return 改变后的rect
 */
CG_INLINE CGSize
CGSizeChangeWH(CGSize size,CGFloat width, CGFloat height)
{
    if (width != NSNotFound)
    {
        size.width = width;
    }
    if (height != NSNotFound)
    {
        size.height = height;
    }
    return size;
}

/**
 *  arc中去除performSelector警告
 */
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

/**
 *  Debug
 */
#ifdef DEBUG
#   define DLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#   define ELog(err) {if(err) DLog(@"%@", err)}
#else
#   define DLog(...)
#   define ELog(err)
#endif

#endif
