//
//  CMNetworkEngine.h
//  cdleishisdk
//
//  Created by mrdai on 13-10-16.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import "MKNetworkEngine.h"

//webservice返回结果定义
#define WebService_isSuccess @"WebService_isSuccess"
#define WebService_successMsg  @"WebService_successMsg"
#define WebService_errorMsg  @"WebService_errorMsg"
#define Webservice_model     @"Webservice_model"
#define Webservice_models    @"Webservice_models"

#define Webservice_moredata  @"moredata"
#define Webservice_ret       @"ret"
#define Webservice_retmsg    @"retmsg"

typedef void (^OperationSuccessBlock)(MKNetworkOperation* completedOperation,id result);
typedef void (^IDBlock)(id object);

@interface CMNetworkEngine : MKNetworkEngine

@property(nonatomic, strong) NSMutableArray *workingOperations;

-(MKNetworkOperation *)getOperationWithURLString:(NSString *)urlString params:(NSMutableDictionary *)params success:(OperationSuccessBlock)successBlock error:(MKNKErrorBlock)errorBlock;

-(MKNetworkOperation *)postOperationWithURLString:(NSString *)urlString params:(NSMutableDictionary *)params success:(OperationSuccessBlock)successBlock error:(MKNKErrorBlock)errorBlock;

/**
 *  文件上传
 *
 *  @param urlString
 *  @param file
 *  @param fileKey
 *  @param params
 *  @param completionBlock
 *  @param errorBloc
 *
 *  @return
 */
-(MKNetworkOperation *)uploadWithURLString:(NSString *)urlString
                             ImageFromFile:(NSString *)file
                               ImageForKey:(NSString *)fileKey
                                    Params:(NSMutableDictionary *)params
                         completionHandler:(IDBlock) completionBlock
                              errorHandler:(MKNKErrorBlock) errorBloc;

/**
 *  soapaction1_2
 *
 *  @param action       action description
 *  @param params       params description
 *  @param successBlock successBlock description
 *  @param errorBlock   errorBlock description
 *
 *  @return return value description
 */
- (MKNetworkOperation*)operationWithSoapAction1_2Webservice:(NSString *)webservice andAction:(NSString *)action params:(NSDictionary *)params  success:(OperationSuccessBlock)successBlock error:(MKNKErrorBlock)errorBlock;

- (void)canelAllOperations;

@end
