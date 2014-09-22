//
//  CMViewController.m
//  cdleishisdk
//
//  Created by mrdai on 13-10-16.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import "CMViewController.h"

@interface CMViewController ()

@end

@implementation CMViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (IS_IOS7)
    {
        //坐标偏移修正.
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    //设置通用title
    self.titleLabelView = [[UILabel alloc]init];
    self.titleLabelView.backgroundColor = [UIColor clearColor];
    self.titleLabelView.textColor = kColor_NavTitle;
    self.titleLabelView.font = kSize_NavTitle;
    self.navigationItem.titleView = self.titleLabelView;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.titleLabelView.text = self.title;
    [self.titleLabelView sizeToFit];   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    DHLog_Normal(@"内存警告");
}

-(UIColor *)defaultBarItemTextColor
{
    return [UIColor redColor];
}

-(NSString *)defaultBackbuttonBg
{
    return @"button_naLeft";
}

@end
