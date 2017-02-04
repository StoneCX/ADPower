//
//  MCAssetsViewController.m
//  ADPower
//
//  Created by chengxc on 2016/11/12.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import "MCAssetsViewController.h"
#import "XMGLoginRegisterViewController.h"

//typedef <#returnType#>(^<#name#>)(<#arguments#>);

#define max(a,b) a>b?a:b

@interface MCAssetsViewController ()

@property (weak, nonatomic) IBOutlet UIView *underView;
@property (weak, nonatomic) IBOutlet UIButton *merchandiseBtn;
@property (weak, nonatomic) IBOutlet UIButton *collectBtn;
@property (weak, nonatomic) IBOutlet UIButton *settingBtn;
@property (weak, nonatomic) IBOutlet UILabel *totalCount;
@property (weak, nonatomic) IBOutlet UIButton *avatorButton;
@property (weak, nonatomic) IBOutlet UIButton *loginRegisterButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *underViewLeadingConstrait;

@end

@implementation MCAssetsViewController

- (IBAction)loginRegisterButtonClick:(id)sender {
    XMGLoginRegisterViewController *loginRegister = [[XMGLoginRegisterViewController alloc] init];
    [self presentViewController:loginRegister animated:YES completion:^{
        
    }];
    
}

- (IBAction)lrButtonClick:(id)sender{
    [self loginRegisterButtonClick:sender];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
    
    int bigNum = max(5, 20);
    NSLog(@"bigNum = %d",bigNum);
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    
    return 3;
}



//每组有几行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSInteger rows = 0;
    switch (section) {
        case 0:
        case 2:
            rows = 2;
            break;
            
        case 1:
            rows = 3;
            break;
    }

    return rows;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    XMGLoginRegisterViewController *lrvc = [[XMGLoginRegisterViewController alloc] init];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self presentViewController:lrvc animated:YES completion:nil];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
