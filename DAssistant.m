//
//  DAssistant.m
//  cdleishisdk
//
//  Created by mrdai on 13-11-15.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import "DAssistant.h"
@interface DAssistant()
{
    Logger *logger;
}
@end

@implementation DAssistant

SINGLETON_CLASS(DAssistant)

#pragma mark
#pragma mark DAssistant lifecyle
-(void)instanceDidCreated
{
#ifdef DEBUG
    logger = LoggerInit();
    LoggerSetViewerHost(logger, (CFStringRef)NSLogger_Host, NSLogger_Port);
#endif
    DHLog_Normal(@"DAssistant instanceDidCreated");
}

-(void)willTerminate
{
    DHLog_Normal(@"DAssistant willTerminate");    
#ifdef DEBUG
    LoggerStop(logger);
#endif
}

-(void)didReceiveMemoryWarning
{
    
}

@end
