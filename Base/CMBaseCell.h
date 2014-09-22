//
//  CMBaseCell.h
//  cdleishisdk
//
//  Created by mrdai on 13-10-16.
//  Copyright (c) 2013年 cdleichi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    CMBaseCellSelectionStyleNone=0,
    CMBaseCellSelectionStyleSystem,
    CMBaseCellSelectionStyleWhite,
    CMBaseCellSelectionStyleClear,
    CMBaseCellSelectionStyle235,
}CMBaseCellSelectionStyle;

typedef enum
{
    CMBaseCellSeparatorStyleNone=0,
    CMBaseCellSeparatorStyleGray,
    CMBaseCellSeparatorStyleHighlightGray,
    CMBaseCellSeparatorStyleRGB_D9D5D5,
    CMBaseCellSeparatorStyleRGB_DDD8D9,
    CMBaseCellSeparatorStyleCustomColor,
}CMBaseCellSeparatorStyle;

typedef enum
{
    CMBaseCellPositionTop,
    CMBaseCellPositionMiddle,
    CMBaseCellPositionBottom,
    CMBaseCellPositionTopBottom
}CMBaseCellPosition;


@interface CMBaseCell : UITableViewCell

@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, assign) CMBaseCellSelectionStyle customSelectionStyle;
@property (nonatomic, assign) CMBaseCellSeparatorStyle customSeparatorStyle;
@property (nonatomic, strong) UIColor *normalSeperatorColor;
@property (nonatomic, strong) UIColor *highlightSeperatorColor;

/**
 * when CMBaseCellSeparatorStyle is CMBaseCellSeparatorStyleCustomColor
 * customSeparatorColor can work
 */
@property (nonatomic, strong) UIColor *customSeparatorColor;

@property (nonatomic, strong, readonly) UIView *customSeparatorView;

+ (UINib *)nib;

+ (id)cellForTableView:(UITableView *)tableView withStyle:(UITableViewCellStyle)style;
+ (id)cellForTableView:(UITableView *)tableView fromNib:(UINib *)nib;
+ (id)cellForTableView:(UITableView *)tableView fromNib:(UINib *)nib withCellIdentifier:(NSString *)cellIdentifier;

+ (NSString *)cellIdentifier;

+ (CGFloat)cellHeight;
+ (CGFloat)cellHeightForContent:(id)content;

- (void)setContent:(id)content withIndexPath:(NSIndexPath *)indexPath;
- (void)setContent:(id)content withIndexPath:(NSIndexPath *)indexPath withTable:(UITableView *)tableView;
/**
 *  tableView复用回调
 */
- (void)reset;

@end
