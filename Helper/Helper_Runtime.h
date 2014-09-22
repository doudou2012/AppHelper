//
//  Helper_Runtime.h
//  cdleishisdk
//
//  Created by mrdai on 13-10-22.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface Helper_Runtime : NSObject
/**
 *  获取属性的type
 *
 *  @param property
 *
 *  @return    
 */
const char *property_getTypeName(objc_property_t property);

/**
 *  获取class中property的class
 *
 *  @param propertyName 要获取的属性
 *  @param klass        属性的类
 *
 *  @return class
 */
+(Class)propertyClassForPropertyName:(NSString *)propertyName ofClass:(Class)klass;

/**
 *  获取klass的所有属性
 *
 *  @param klass 要获取的klass
 *
 *  @return 属性集合
 */
+(NSArray*)propertyNames:(Class)klass;

/**
 *  判断klass中的属性是否是只读
 *
 *  @param klass        klass
 *  @param propertyName propertyName
 *
 *  @return 
 */
+(BOOL)isPropertyReadOnly:(Class)klass propertyName:(NSString *)propertyName;

@end
