//
//  CMModel.h
//  cdleishisdk
//
//  Created by mrdai on 13-10-21.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMModel : NSObject<NSCoding>

/**
 *  需要做转换的key-value @"id":@"iD"
 */
@property (nonatomic,strong) NSMutableDictionary *needChangeDic;

-(NSDictionary *) dictionaryWithProperties;

-(void)saveToArchive;
-(id)getFromArchive;

//object map

-(id)initWithDictionary:(NSDictionary *)dictionary;

@end

