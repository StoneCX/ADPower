//
//  MCVideoPlayController.m
//  ADPowerpart2
//
//  Created by chengxc on 2017/1/7.
//  Copyright © 2017年 chengxc. All rights reserved.
//

#import "MCVideoPlayController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "MCPlayerViewController.h"

@interface MCVideoPlayController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) AVPlayerViewController *videoPlayer;
@property (weak, nonatomic) IBOutlet UIView *playerView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *chooseView;
//与播放器相关的属性

@end

@implementation MCVideoPlayController



#pragma mark - 控制器视图方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    
    //[self prepareToPlay];
    
    
}

- (void)prepareToPlay{
    MCPlayerViewController *playerViewController = [[MCPlayerViewController alloc] init];
    [self addChildViewController:playerViewController];
    self.playerView = playerViewController.view;
}





#pragma mark - 私有方法
/**
 *  取得本地文件路径
 *
 *  @return 文件路径
 */
-(NSURL *)getFileUrl{
    NSString *urlStr=[[NSBundle mainBundle] pathForResource:@"The New Look of OS X Yosemite.mp4" ofType:nil];
    NSURL *url=[NSURL fileURLWithPath:urlStr];
    return url;
}

/**
 *  取得网络文件路径
 *
 *  @return 文件路径
 */
-(NSURL *)getNetworkUrl{
    NSString *urlStr=@"http://wvideo.spriteapp.cn/video/2016/1221/585a5624068fa_wpd.mp4";
    //urlStr=[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url=[NSURL URLWithString:urlStr];
    return url;
}


- (void)setCollectionViewFlowlayout{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.itemSize = self.collectionView.frame.size;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    [self.collectionView setCollectionViewLayout:flowLayout];
}

- (IBAction)dismissClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //获取页码
    NSInteger pageIndex = scrollView.contentOffset.x / SCREENW;
    UIButton *btn = self.chooseView.subviews[pageIndex];
    btn.selected = YES;
    
}

//segmentControl值改变时调用这里
- (void)segmentChangeValue:(UISegmentedControl *)segmentControl{
    
    self.collectionView.contentOffset = CGPointMake(SCREENW * segmentControl.selectedSegmentIndex, 0);
    
}

- (IBAction)chooseDetailOrReview:(UIButton *)sender {
   int selectedNum =  [sender.currentTitle  isEqual: @"评论"] ? 0 : 1;
   self.collectionView.contentOffset = CGPointMake(SCREENW * selectedNum, 0);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.chooseView.subviews.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *collectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    
    //移除之前子控制器的内容
    [collectionCell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    UITableViewController *tabvc = [[UITableViewController alloc]init];
    tabvc.view.frame = CGRectMake(0, 0, SCREENW, SCREENH);
    
    
    [collectionCell.contentView addSubview:tabvc.view];
    return collectionCell;
}



@end
