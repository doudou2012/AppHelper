//
//  Helper_Runtime.m
//  cdleishisdk
//
//  Created by mrdai on 13-10-22.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import "Helper_Runtime.h"

@implementation Helper_Runtime

static NSMutableDictionary *propertyListByClass;
static NSMutableDictionary *propertyClassByClassAndPropertyName;

const char *property_getTypeName(objc_property_t property)
{
    const char *attributes = property_getAttributes(property);
    char buffer[1 + strlen(attributes)];
    strcpy(buffer, attributes);
    char *state = buffer, *attribute;
    while ((attribute = strsep(&state, ",")) != NULL) {
        if (attribute[0] == 'T') {
            size_t len = strlen(attribute);
            attribute[len - 1] = '\0';
            return (const char *)[[NSData dataWithBytes:(attribute + 3) length:len - 2] bytes];
        }
    }
    return "@";
}

+(Class)propertyClassForPropertyName:(NSString *)propertyName ofClass:(Class)klass
{
    if (!propertyClassByClassAndPropertyName)
    {
        propertyClassByClassAndPropertyName = [[NSMutableDictionary alloc]init];
    }
    
    NSString *key = [NSString stringWithFormat:@"%@:%@",NSStringFromClass(klass),propertyName];
    NSString *value = [propertyClassByClassAndPropertyName objectForKey:key];
    if (value)
    {
        return NSClassFromString(value);
    }
    
    unsigned int propertyCount = 0;
    objc_property_t *properties = class_copyPropertyList(klass, &propertyCount);
    const char *cPropertyName = [propertyName UTF8String];
    for (unsigned int i=0 ; i<propertyCount; i++)
    {
        objc_property_t property = properties[i];
        const char *name = property_getName(property);
        if (strcmp(cPropertyName, name) == 0)
        {
            free(properties);
            
            NSString *className = [NSString stringWithUTF8String:property_getTypeName(property)];
            [propertyClassByClassAndPropertyName setObject:className forKey:key];
            return NSClassFromString(className);
        }
    }
    free(properties);
    return [self propertyClassForPropertyName:propertyName ofClass:class_getSuperclass(klass)];
}

+(NSArray*)propertyNames:(Class)klass
{
    if (klass == [CMModel class])
    {
        return [NSArray array];
    }
    if (!propertyListByClass)
    {
        propertyListByClass = [NSMutableDictionary dictionary];
    }
    NSString *className = NSStringFromClass(klass);
    NSArray *value = [propertyListByClass objectForKey:className];
    if (value)
    {
        return value;
    }
    NSMutableArray *propertyNamesArray = [NSMutableArray array];
    unsigned int propertyCount = 0;
    objc_property_t *properties = class_copyPropertyList(klass, &propertyCount);
    for (unsigned int i = 0; i<propertyCount; i++)
    {
        objc_property_t property = properties[i];
        const char *name = property_getName(property);
        [propertyNamesArray addObject:[NSString stringWithUTF8String:name]];
    }
    free(properties);
    [propertyListByClass setObject:propertyNamesArray forKey:className];
    NSArray *arr = [Helper_Runtime propertyNames:class_getSuperclass(klass)];
    [propertyNamesArray addObjectsFromArray:arr];
    return propertyNamesArray;
}

+(BOOL)isPropertyReadOnly:(Class)klass propertyName:(NSString *)propertyName
{
    const char *type = property_getAttributes(class_getProperty(klass, [propertyName UTF8String]));
    NSString *typeString = [NSString stringWithUTF8String:type];
    NSArray *attributes = [typeString componentsSeparatedByString:@","];
    NSString *typeAttribute = [attributes objectAtIndex:1];
    return [typeAttribute rangeOfString:@"R"].length>0;
}

@end
