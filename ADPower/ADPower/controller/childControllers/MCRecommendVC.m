//
//  MCRecommendVC.m
//  ADPower
//
//  Created by chengxc on 2016/10/31.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import "MCRecommendVC.h"
#import "MCRecommendCell.h"
#import <AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import "MCThemeItem.h"
#import "MCThemeViewModel.h"
#import "AFHTTPSessionManager+Manager.h"
#import "MCVideoPlayController.h"
#import <MJRefresh.h>
#import <SVProgressHUD.h>
#import "MCCommendCell.h"

@interface MCRecommendVC () <MCCommendCellDelegate>

//save all viewModel
@property (nonatomic, strong) NSMutableArray *themeViewModels;

@property (nonatomic, strong) AFHTTPSessionManager *manager;
@property (nonatomic, weak) UIView *header;
@property (nonatomic, weak) UILabel *headerLabel;
@property (nonatomic, assign, getter=isHeaderRefreshing) BOOL headerRefreshing;

@property (nonatomic, weak) UIView *footer;
@property (nonatomic, weak) UILabel *footerLabel;
@property (nonatomic, assign, getter=isFooterRefreshing) BOOL footerRefreshing;

@end

static NSString *cellID = @"cellid";

#define REQ @"/api/get_ads"
@implementation MCRecommendVC

- (AFHTTPSessionManager *)manager{
    if (!_manager) {
        _manager = [AFHTTPSessionManager mc_manager];
    }
    return _manager;
}

- (NSMutableArray *)themeViewModels{
    if (!_themeViewModels) {
        _themeViewModels = [NSMutableArray array];
    }
    return _themeViewModels;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.tableView.contentInset = UIEdgeInsetsMake(50, 0, -49, 0);
    
    
    [self setupRefresh];
    [self loadNewTopics];
    [self loadNewData];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MCCommendCell" bundle:nil] forCellReuseIdentifier:@"commendCell"];
    
}





- (void)loadNewData{
    // 1.创建请求会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager mc_manager];
    
    // 2.拼接请求参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"page"] = @1;
    //parameters[@"sort"] = @"s";

    

    
    
    NSString *requestPath = [NSString stringWithFormat:@"%@%@",MCbaseURL,REQ];
        // 3.发送请求
    [manager GET:requestPath parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
        // 请求数据成功
        
        // 字典数组转模型数组
        NSArray *themes = [MCThemeItem mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
        
        // 模型转视图模型
        for (MCThemeItem *item in themes) {
            MCThemeViewModel *vm = [[MCThemeViewModel alloc] init];
            // 计算cell子控件frame和cellH
            vm.item = item;
            [self.themeViewModels addObject:vm];
        }
        
        // 刷新表格
        [self.tableView reloadData];
        
        //        // 解析数据
        [responseObject writeToFile:@"/Users/chengxc/Desktop/cheng123.plist" atomically:YES];
        //NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];

}


- (void)setupHeaderView{
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
    //return self.themeViewModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MCCommendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commendCell"];
    cell.delegate = self;
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //UIApplication *app = [UIApplication sharedApplication];
//    MCPlayViewController *playvc = [[MCPlayViewController alloc] init];
//    NSString *urlString = @"http://wvideo.spriteapp.cn/video/2016/1219/ebd4cca4-c5e8-11e6-a907-d4ae5296039d_wpd.mp4";
//    playvc.videoURL = urlString;
//    [self.navigationController pushViewController:playvc animated:YES];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MCVideoPlayController" bundle:nil];
    
    MCVideoPlayController *playController = [storyboard instantiateInitialViewController];
    [self presentViewController:playController animated:YES completion:nil];
}

- (void)loadNewTopics{
    
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    
    NSMutableDictionary *paremeters = [[NSMutableDictionary alloc] init];
    
    
    [self.manager GET:MCbaseURL parameters:paremeters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
}

- (void)setupRefresh{

    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    header.automaticallyChangeAlpha = YES;
    self.tableView.mj_header = header;
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    footer.automaticallyHidden = YES;
    self.tableView.mj_footer = footer;
}

//上拉加载更多数据
- (void)loadMoreData{
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    [self.manager GET:MCbaseURL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}


#pragma mark: - MCCommendCellDelegate
- (void)playCountClick:(UIButton *)button{
    
}
- (void)commentClick:(UIButton *)button{
    
}
- (void)moreClick:(UIButton *)button{
    
}

@end















