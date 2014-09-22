//
//  NSObject+NSDictionaryRepresentation.h
//  cdleishisdk
//
//  Created by mrdai on 13-12-30.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (NSDictionaryRepresentation)

/**
 *  NSObject的子类——>NSDictionary(能解析NSArray)
 *
 *  @return NSDictionary
 */
- (NSDictionary *)dictionaryRepresentation;

@end
