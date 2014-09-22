//
//  CMNetworkOperation.m
//  cdleishisdk
//
//  Created by mrdai on 13-10-16.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import "CMNetworkOperation.h"

@implementation CMNetworkOperation

- (id)initWithURLString:(NSString *)aURLString
                 params:(NSMutableDictionary *)params
             httpMethod:(NSString *)method
{
    if (params==nil)
    {
        params = [NSMutableDictionary dictionary];
    }
    [params setValue:DEVICE_SYSTEMVERSION forKey:@"vs"];
    [params setValue:APP_VERSION forKey:@"vc"];
    [params setValue:DEVICE_MODEL  forKey:@"hardName"];
    [params setValue:DEVICE_NAME forKey:@"deviceName"];
    return [super initWithURLString:aURLString params:params httpMethod:method];
}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [[NSNotificationCenter defaultCenter] postNotificationName:NetworkOperationFinishedNotification object:self];
    [super connection:connection didFailWithError:error];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [[NSNotificationCenter defaultCenter] postNotificationName:NetworkOperationFinishedNotification object:self];
    [super connectionDidFinishLoading:connection];
}
-(id) responseJSON
{
    id json = [super responseJSON];
    if ([NSJSONSerialization class])
    {
        return json;
    }else
    {
        return [((NSString *)json) objectFromJSONString];
    }
}

@end
