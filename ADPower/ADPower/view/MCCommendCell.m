//
//  MCCommendCell.m
//  ADPowerpart2
//
//  Created by chengxc on 2017/1/12.
//  Copyright © 2017年 chengxc. All rights reserved.
//

#import "MCCommendCell.h"

@interface MCCommendCell ()
@property (weak, nonatomic) IBOutlet UIView *brandView;



@end
@implementation MCCommendCell
- (IBAction)playCountClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(playCountClick:)]) {
        [self.delegate playCountClick:sender];
    }
}
- (IBAction)commentClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(commentClick:)]) {
        [self.delegate commentClick:sender];
    }
}
- (IBAction)moreClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(moreClick:)]) {
        [self.delegate moreClick:sender];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
