//
//  NSOperation+Utils.m
//  cdleishisdk
//
//  Created by mrdai on 13-10-22.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import "NSOperation+Utils.h"

@implementation NSOperation (Utils)

-(void)clearMemory
{
    BOOL isCancle = (!self || [self isFinished]);
    if (!isCancle)
    {
        [self cancel];
    }
}

@end
