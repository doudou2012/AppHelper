//
//  CMBaseCell.m
//  cdleishisdk
//
//  Created by mrdai on 13-10-16.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import "CMBaseCell.h"
#import "CMBaseCell+CustomSeparatorView.h"

@interface CMBaseCell()

@property (nonatomic, strong, readwrite) UIView *customSeparatorView;

@end

@implementation CMBaseCell

-(void)defaultInit
{
    self.customSelectionStyle = CMBaseCellSelectionStyleWhite;
    self.customSeparatorStyle = CMBaseCellSeparatorStyleNone;
    self.normalSeperatorColor = [UIColor blackColor];
    self.highlightSeperatorColor = [UIColor blackColor];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self defaultInit];
    }
    
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self defaultInit];
    }
    return self;
}

- (void)reset
{
    
}

+ (NSString *)cellIdentifier
{
    return NSStringFromClass([self class]);
}

+ (id)cellForTableView:(UITableView *)tableView withStyle:(UITableViewCellStyle)style
{
    NSString *cellID = nil;
    if (style == UITableViewCellStyleDefault)
        cellID = @"UITableViewCellStyleDefault";
    else if (style == UITableViewCellStyleValue1)
        cellID = @"UITableViewCellStyleValue1";
    else if (style == UITableViewCellStyleValue2)
        cellID = @"UITableViewCellStyleValue2";
    else if (style == UITableViewCellStyleSubtitle)
        cellID = @"UITableViewCellStyleSubtitle";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[self alloc] initWithStyle:style reuseIdentifier:cellID];
    }
    return cell;
}

+ (id)cellForTableView:(UITableView *)tableView fromNib:(UINib *)nib
{
    NSString *cellID = [self cellIdentifier];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        NSArray *nibObjects = [nib instantiateWithOwner:nil options:nil];
        cell = nibObjects[0];
    }
    else
    {
        [(CMBaseCell *)cell reset];
    }
    
    return cell;
}

+ (id)cellForTableView:(UITableView *)tableView fromNib:(UINib *)nib withCellIdentifier:(NSString *)cellIdentifier
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        NSArray *nibObjects = [nib instantiateWithOwner:nil options:nil];
        for (UITableViewCell *nibCell in nibObjects)
        {
            if ([nibCell.reuseIdentifier isEqualToString:cellIdentifier])
            {
                cell = nibCell;
                break;
            }
        }
    }
    else
    {
        [(CMBaseCell *)cell reset];
    }
    
    return cell;
}

+ (NSString *)nibName
{
    if (IS_IPHONE())
    {
        return [self cellIdentifier];
    }else
    {
        return [NSString stringWithFormat:@"%@HD", [self cellIdentifier]];
    }
}

+ (UINib *)nib
{
    NSBundle *classBundle = [NSBundle bundleForClass:[self class]];
    return [UINib nibWithNibName:[self nibName] bundle:classBundle];
}

+ (CGFloat)cellHeight
{
    return 44.0f;
}

+ (CGFloat)cellHeightForContent:(id)content
{
    return [self cellHeight];
}

- (void)setContent:(id)content withIndexPath:(NSIndexPath *)indexPath
{
    [self setContent:content withIndexPath:indexPath withTable:nil];
}

- (void)setContent:(id)content withIndexPath:(NSIndexPath *)indexPath withTable:(UITableView *)tableView
{
    self.indexPath = indexPath;
}

- (void)setCustomSelectionStyle:(CMBaseCellSelectionStyle)customSelectionStyle
{
    if (_customSelectionStyle == customSelectionStyle)
    {
        return;
    }
    
    _customSelectionStyle = customSelectionStyle;
    if (_customSelectionStyle == CMBaseCellSelectionStyleNone)
    {
        self.selectedBackgroundView = nil;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else if (_customSelectionStyle == CMBaseCellSelectionStyleSystem)
    {
        self.selectedBackgroundView = nil;
    }else
    {
        self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.bounds];
        self.selectionStyle = UITableViewCellSelectionStyleBlue;
        
        if (_customSelectionStyle == CMBaseCellSelectionStyleWhite)
        {
            self.selectedBackgroundView.backgroundColor = [UIColor whiteColor];
        }else if (_customSelectionStyle == CMBaseCellSelectionStyleClear)
        {
            self.selectedBackgroundView.backgroundColor = [UIColor clearColor];
        }else if (_customSelectionStyle == CMBaseCellSelectionStyle235)
        {
            //            self.selectedBackgroundView.backgroundColor = RGBCOLOR(235, 235, 235);
        }
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGRect frame = self.customSeparatorView.frame;
    frame.size.width = self.frame.size.width;
    frame.origin.y = self.frame.size.height - frame.size.height;
    self.customSeparatorView.frame = frame;
    [self insertSubview:self.customSeparatorView atIndex:0];
}

- (UIView *)customSeparatorView
{
    if (_customSeparatorView != nil)
    {
        return _customSeparatorView;
    }
    
    switch (self.customSeparatorStyle)
    {
        case CMBaseCellSeparatorStyleGray:
            _customSeparatorView = [self normalSeperatorWithColor:_normalSeperatorColor withHeight:1.0f];
            break;
        case CMBaseCellSeparatorStyleHighlightGray:
            _customSeparatorView = [self highlightSeperatorWithColor:_highlightSeperatorColor withHighlightColor:[UIColor whiteColor]];
            break;
            //        case CMBaseCellSeparatorStyleRGB_D9D5D5:
            //            _customSeparatorView = [self normalSeperatorWithColor:RGB_D9D5D5 withHeight:1.0f];
            //            break;
            //        case CMBaseCellSeparatorStyleRGB_DDD8D9:
            //            _customSeparatorView = [self normalSeperatorWithColor:RGB_DDD8D9 withHeight:0.5f];
            //            break;
        case CMBaseCellSeparatorStyleCustomColor:
            _customSeparatorView = [self normalSeperatorWithColor:_customSeparatorColor withHeight:1.0f];
            break;
        default:
            break;
    }
    
    return _customSeparatorView;
}


@end
