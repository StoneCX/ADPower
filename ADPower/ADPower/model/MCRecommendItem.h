//
//  MCRecommendItem.h
//  ADPower
//
//  Created by chengxc on 2016/11/25.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import <Foundation/Foundation.h>
//ThemeItem
@interface MCRecommendItem : NSObject
//cell 内的数据
@property (nonatomic, strong) NSString *bigImage;
@property (nonatomic, assign) NSInteger totalBounse;
@property (nonatomic, assign) NSInteger highest;
@property (nonatomic, assign) NSInteger period;
@property (nonatomic, strong) NSString *slogan;

@property (nonatomic, strong) NSString *brandImg;
@property (nonatomic, strong) NSString *brandTitle;
@property (nonatomic, assign) BOOL isHot;
@property (nonatomic, assign) NSInteger playCount;
@property (nonatomic, assign) NSInteger commentCount;


@end
