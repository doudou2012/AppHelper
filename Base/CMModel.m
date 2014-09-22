//
//  CMModel.m
//  cdleishisdk
//
//  Created by mrdai on 13-10-21.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import "CMModel.h"
#import <objc/runtime.h>

@implementation CMModel

Class nsDictionaryClass;
Class nsArrayClass;

- (id)init
{
    self = [super init];
    if (self)
    {
        _needChangeDic = [NSMutableDictionary dictionary];
    }
    return self;
}

-(void)setValue:(id)value forKey:(NSString *)key
{
    //key need replace?
    id replaceKey = _needChangeDic[key];
    
    if (replaceKey)
    {
        [super setValue:value forKey:replaceKey];
    }
    else if(value != nil)
    {
        [super setValue:value forKey:key];
    }
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"实体类:%@属性:%@必须存在",NSStringFromClass([self class]),key);
    NSAssert(NO, @"please check");
}

-(NSDictionary *) dictionaryWithProperties
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    for (int i = 0; i < count; i++)
    {
        __block NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        Class classObject = NSClassFromString([key capitalizedString]);
        if (classObject)
        {
            id subObj = [[self valueForKey:key] dictionaryWithProperties];
            if (subObj!=nil)
            {
                [dict setObject:subObj forKey:key];   
            }
        }
        else
        {
            id value = [self valueForKey:key];
            
            //判断key是否是被替换的
            [_needChangeDic enumerateKeysAndObjectsUsingBlock:^(id mkey, id mobj, BOOL *stop)
             {
                 if ([key isEqualToString:mobj])
                 {
                     key = mkey;
                     *stop = YES;
                 }
             }];
            
            if(value != nil)
            {
                [dict setObject:value forKey:key];
            }
        }
    }
    
    free(properties);
    
    return [NSDictionary dictionaryWithDictionary:dict];
}


- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    for (int i = 0; i < count; i++)
    {
        __block NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
//        DLog(@"%@",[self valueForKey:key]);
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
    
    free(properties);
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    if (self)
    {
        unsigned count;
        objc_property_t *properties = class_copyPropertyList([self class], &count);
        
        for (int i = 0; i < count; i++)
        {
            __block NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
//            DLog(@"%@",[aDecoder decodeObjectForKey:key]);
            [self setValue:[aDecoder decodeObjectForKey:key] forKey:key];
        }
        
        free(properties);
    }
    return self;
}

-(void)saveToArchive
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:self]
                                              forKey:[self archvieKey]];
}
-(id)getFromArchive
{
    return [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults]
                                                       objectForKey:[self archvieKey]]];
}

//用户本地化索引KEY
-(NSString*)archvieKey
{
    return NSStringFromClass([self class]);
}


-(id)initWithDictionary:(NSDictionary *)dictionary
{
    if (!nsDictionaryClass)
    {
        nsDictionaryClass = [NSDictionary class];
    }
    if (!nsArrayClass)
    {
        nsArrayClass = [NSArray class];
    }
    if ((self = [self init]))
    {
        for (NSString *key in [Helper_Runtime propertyNames:[self class]])
        {
            id value = [dictionary objectForKey:key];
            if (value == [NSNull null] || value == nil)
            {
                continue;
            }
            if ([Helper_Runtime isPropertyReadOnly:[self class] propertyName:key])
            {
                continue;
            }
            
            if ([value isKindOfClass:nsDictionaryClass])
            {
                Class klass = [Helper_Runtime propertyClassForPropertyName:key ofClass:[self class]];
                value = [[klass alloc] initWithDictionary:value];
            }
            else if([value isKindOfClass:nsArrayClass])
            {
                //获取约定的class (s属性_class)
                SEL getArrayClass = NSSelectorFromString([NSString stringWithFormat:@"%@_class",key]);
                if ([[self class] respondsToSelector:getArrayClass])
                {
                    Class arrayItemType;
                    SuppressPerformSelectorLeakWarning(arrayItemType = [[self class] performSelector:getArrayClass]);
                    NSMutableArray *childObjects = [NSMutableArray arrayWithCapacity:[(NSArray*)value count]];
                    for (id child in value)
                    {
                        if ([[child class] isSubclassOfClass:nsDictionaryClass])
                        {
                            CMModel *childDTO = [[arrayItemType alloc]initWithDictionary:child];
                            [childObjects addObject:childDTO];
                        }
                        else
                        {
                            [childObjects addObject:child];
                        }
                    }
                    value = childObjects;
                }
                else
                {
                    NSLog(@"实体类:%@\n方法:%@_class存在",NSStringFromClass([self class]),key);
                    NSAssert(NO, @"please check");
                }

            }
            [self setValue:value forKey:key];
        }
    }
    return self;
}

@end
