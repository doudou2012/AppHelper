//
//  NSObject+Additions.h
//  GYApp
//
//  Created by mrdai on 14-1-8.
//  Copyright (c) 2014年 cdleichi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Additions)

@end

#pragma mark
#pragma mark Enumerate

@interface NSObject (Enumerate)

@property (nonatomic,strong) id<NSCopying> eKey;
@property (nonatomic,strong) id eValue;

/**
 *  用于枚举
 *
 *  @param key   key(@(int))
 *  @param value value
 *
 *  @return 
 */
-(id)initWithKey:(id<NSCopying>)key value:(id)value;

/**
 *  枚举Key集合
 *
 *  @return 
 */
-(NSArray*)enumerateAllKeys;

/**
 *  枚举Value集合
 *
 *  @return 
 */
-(NSArray*)enumerateAllValues;


/**
 *  根据key查找value
 *
 *  @param key
 *
 *  @return 
 */
-(id)enumerateValueForKey:(id<NSCopying>)key;

/**
 *  根据value查找key
 *
 *  @param value
 *
 *  @return 
 */
-(id<NSCopying>)enumerateKeyForValue:(id)value;


/**
 *  排除key剩下的枚举
 *
 *  @param withoutKey
 *
 *  @return 
 */
-(NSArray*)enumerateObjectsWithOut:(NSArray *)withoutKey;

@end
