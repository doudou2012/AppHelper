//
//  NSObject+NSDictionaryRepresentation.m
//  cdleishisdk
//
//  Created by mrdai on 13-12-30.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import "NSObject+NSDictionaryRepresentation.h"
#import <objc/runtime.h>

@implementation NSObject (NSDictionaryRepresentation)

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [self.propertyDictionary.allKeys enumerateObjectsUsingBlock:^(id objTop, NSUInteger idxTop, BOOL *stopTop)
    {
        id valueTop = [self valueForKey:objTop];
        if (valueTop)
        {
            //if array
            if ([valueTop isKindOfClass:[NSArray class]])
            {
                NSMutableArray *arrayValue = [NSMutableArray array];
                [((NSArray*)valueTop) enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
                {
                    [arrayValue addObject:((NSObject*)obj).dictionaryRepresentation];
                }];
                [dictionary setObject:arrayValue forKey:objTop];
            }
            else
            {
                 [dictionary setObject:valueTop forKey:objTop];   
            }
        }
        else
        {
            [dictionary setObject:[NSNull null] forKey:objTop];
        }
    }];
    return dictionary;
}

@end
