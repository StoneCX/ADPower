//
//  MCCommendCell.h
//  ADPowerpart2
//
//  Created by chengxc on 2017/1/12.
//  Copyright © 2017年 chengxc. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MCCommendCellDelegate <NSObject>

- (void)playCountClick:(UIButton *)button;
- (void)commentClick:(UIButton *)button;
- (void)moreClick:(UIButton *)button;

@end
@interface MCCommendCell : UITableViewCell

@property (nonatomic, weak) id<MCCommendCellDelegate> delegate;

@end
