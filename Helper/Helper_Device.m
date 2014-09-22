//
//  Helper_Device.m
//  cdleishisdk
//
//  Created by mrdai on 13-10-21.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import "Helper_Device.h"

@implementation Helper_Device

+(void)callToString:(NSString*)telPhone
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:StringFormat(@"tel://%@",telPhone)]];
}

@end
