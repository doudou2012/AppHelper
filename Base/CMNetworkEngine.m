//
//  CMNetworkEngine.m
//  cdleishisdk
//
//  Created by mrdai on 13-10-16.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import "CMNetworkEngine.h"

@implementation CMNetworkEngine

-(MKNetworkOperation *)getOperationWithURLString:(NSString *)urlString params:(NSMutableDictionary *)params success:(OperationSuccessBlock)successBlock error:(MKNKErrorBlock)errorBlock
{
    return [self cmOperationWithURLString:urlString params:params method:@"GET" success:successBlock error:errorBlock];
}

-(MKNetworkOperation *)postOperationWithURLString:(NSString *)urlString params:(NSMutableDictionary *)params success:(OperationSuccessBlock)successBlock error:(MKNKErrorBlock)errorBlock
{
    return [self cmOperationWithURLString:urlString params:params method:@"POST" success:successBlock error:errorBlock];
}

-(MKNetworkOperation *)cmOperationWithURLString:(NSString *)urlString params:(NSMutableDictionary *)params method:(NSString *)method success:(OperationSuccessBlock)successBlock error:(MKNKErrorBlock)errorBlock
{
    MKNetworkOperation *operation = [self operationWithURLString:urlString params:params httpMethod:method];
    DLog(@"%@", [operation url]);
    [operation onCompletion:^(MKNetworkOperation *completedOperation)
     {
         NSDictionary *json = [completedOperation responseJSON];
         id errorCode = json[@"error"];
         if (errorCode!=nil)
         {//
             NSString *message = json[@"message"];
             DLog(@"%@",message);
             NSError *error = [[NSError alloc] initWithDomain:message? : @"请求服务器发生错误。" code:[errorCode intValue] userInfo:nil];
             errorBlock(error);
         }else
         {
             //DLog(@"result json:%@", json);
             successBlock(completedOperation,json);
         }
     } onError:^(NSError *error)
     {
         if ([error.domain isEqualToString:@"NSURLErrorDomain"])
         {
             error = [NSError errorWithDomain:@"网络错误，请检查网络配置。" code:-1 userInfo:0];
         }
         errorBlock(error);
     }];
    
    [self enqueueOperation:operation];
    
    return operation;
}

-(MKNetworkOperation *)uploadWithURLString:(NSString *)urlString
                             ImageFromFile:(NSString *)file
                               ImageForKey:(NSString *)fileKey
                                    Params:(NSMutableDictionary *)params
                         completionHandler:(IDBlock) completionBlock
                              errorHandler:(MKNKErrorBlock) errorBloc
{
    MKNetworkOperation *op = [self operationWithURLString:urlString params:params httpMethod:@"POST"];
    [op addFile:file forKey:fileKey mimeType:@"multipart/form-data"];
    // setFreezable uploads your images after connection is restored!
    [op setFreezable:YES];
    [op onCompletion:^(MKNetworkOperation *completedOperation)
     {
         NSString *xmlString = [completedOperation responseString];
         DLog(@"%@", xmlString);
         completionBlock(xmlString);
     } onError:^(NSError *error)
     {
         errorBloc(error);
     }];
    [self enqueueOperation:op];
    return op;
}

- (MKNetworkOperation*)operationWithSoapAction1_2Webservice:(NSString *)webservice andAction:(NSString *)action params:(NSDictionary *)params  success:(OperationSuccessBlock)successBlock error:(MKNKErrorBlock)errorBlock
{
#ifdef NetWorkKitLog_Params
    DHLog_NetWork(@"\nAction:%@\nparams:%@\n",action,params);
#endif
    //generate soapbody
    NSString *soapbody = [NSString string];
    NSArray *keys = [params allKeys];
    for (NSString *key in keys)
    {
        NSString *value = [params objectForKey:key];
        soapbody = [soapbody stringByAppendingFormat:@"<%@>%@</%@>\n",key,value,key];
    }
    //generate soapMsg
    NSString *soapMsg = [NSString stringWithFormat:
                         @"<?xml version=\"1.0\" encoding=\"utf-8\"?> \n"
                         "<soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\"> \n"
                         "<soap12:Header>"
                         "<MySoapHeader xmlns=\"http://tempuri.org/\">"
                         "<Token>%@</Token>"
                         "</MySoapHeader>"
                         "</soap12:Header>"
                         "<soap12:Body> \n"
                         "<%@ xmlns=\"%@\"> \n"
                         "%@"
                         "</%@>\n"
                         "</soap12:Body> \n"
                         "</soap12:Envelope>",
                         @"",action,@"http://tempuri.org/",soapbody,action];
    
    MKNetworkOperation *operation = [self operationWithURLString:webservice params:nil httpMethod:@"POST"];
    
    [operation setCustomPostDataEncodingHandler:^NSString *(NSDictionary *postDataDict)
     {
         return soapMsg;
     } forType:@"application/soap+xml"];
    
    [operation onCompletion:^(MKNetworkOperation *completedOperation)
     {
#ifdef NetWorkKitLog_Response
         DHLog_NetWork(@"\nResponse MKNetworkOperation:%@",completedOperation);
#endif
         NSString *responseXml = completedOperation.responseString;
         //若没有数据返回
         if (responseXml&&responseXml.length>0)
         {
             //parse xml
             NSError *xmlError;
             NSDictionary *responseDic = [XMLReader dictionaryForXMLString:responseXml error:&xmlError];
             id result = [[[[[responseDic objectForKey:@"soap:Envelope"]objectForKey:@"soap:Body"]objectForKey:[NSString stringWithFormat:@"%@Response",action]]objectForKey:[NSString stringWithFormat:@"%@Result",action]]objectForKey:@"text"];
             NSDictionary *responseJson = [result objectFromJSONString];
             successBlock(completedOperation,responseJson);
         }
         else
         {
             errorBlock([NSError errorWithDomain:@"没有查询到数据，请重试!" code:-1 userInfo:nil]);
         }
     } onError:^(NSError *error)
     {
         if ([error.domain isEqualToString:@"NSURLErrorDomain"])
         {
             error = [NSError errorWithDomain:@"网络错误，请检查网络配置。" code:-1 userInfo:0];
         }
         errorBlock(error);
     }];
#ifdef NetWorkKitLog_Request
    DHLog_NetWork(@"\nRequest MKNetworkOperation:%@",operation);
#endif
    [self enqueueOperation:operation];
    return operation;
    
}

- (void)canelAllOperations
{
    [_workingOperations makeObjectsPerformSelector:@selector(cancel)];
    [_workingOperations removeAllObjects];
}

- (id) initWithHostName:(NSString*) hostName customHeaderFields:(NSDictionary*) headers
{
    self = [super initWithHostName:hostName customHeaderFields:headers];
    if (self)
    {
        [self registerOperationSubclass:[CMNetworkOperation class]];
        self.workingOperations = [NSMutableArray array];
        return self;
    }
    return nil;
}


-(void)enqueueOperation:(MKNetworkOperation *)operation forceReload:(BOOL)forceReload
{
    [super enqueueOperation:operation forceReload:forceReload];
    
    if (![_workingOperations containsObject:operation])
    {
        [_workingOperations addObject:operation];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkOperationFinished:) name:NetworkOperationFinishedNotification object:operation];
    }
}

-(void)networkOperationFinished:(NSNotification *)notification
{
    CMNetworkOperation *operation = notification.object;
    if (operation!=nil)
    {
        [_workingOperations removeObject:operation];
    }
}

-(int)cacheMemoryCost
{
    return 1;
}

-(void)dealloc
{
    [self canelAllOperations];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}




@end
