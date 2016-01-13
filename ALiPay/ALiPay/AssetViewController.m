//
//  AssetViewController.m
//  ALiPay
//
//  Created by wey on 16/1/12.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "AssetViewController.h"
#import "CommonTableViewCell.h"
#import "CommonCellModel.h"
#import "AssetheaderView.h"
#import "PlaceHolderVC.h"
@interface AssetViewController ()

@end

@implementation AssetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cellClass = [CommonTableViewCell class];
    self.sectionNumber = 3;
    [self setupModel];
    [self setupHeaderView];
}

- (void)setupModel {
    
    /** section 1 */
    CommonCellModel *item1 = [[CommonCellModel alloc]initWithTitle:@"余额宝" imageName:@"20000032Icon" targetClass:[PlaceHolderVC class]];
    CommonCellModel *item2 = [[CommonCellModel alloc]initWithTitle:@"招财宝" imageName:@"20000059Icon" targetClass:[PlaceHolderVC class]];
    CommonCellModel *item3 = [[CommonCellModel alloc]initWithTitle:@"娱乐宝" imageName:@"20000077Icon" targetClass:[PlaceHolderVC class]];
    
      /** section 2 */
    CommonCellModel *item4 = [[CommonCellModel alloc]initWithTitle:@"芝麻信用分" imageName:@"20000118Icon" targetClass:[PlaceHolderVC class]];
    CommonCellModel *item5 = [[CommonCellModel alloc]initWithTitle:@"随身贷" imageName:@"20000180Icon" targetClass:[PlaceHolderVC class]];
    CommonCellModel *item6 = [[CommonCellModel alloc]initWithTitle:@"我的保障" imageName:@"20000110Icon" targetClass:[PlaceHolderVC class]];
    
      /** section 3 */
    CommonCellModel *item7 = [[CommonCellModel alloc]initWithTitle:@"爱心捐赠" imageName:@"09999978Icon" targetClass:[PlaceHolderVC class]];
    
    self.dataArray = @[@[item1,item2,item3],
                       @[item4,item5,item6],
                       @[item7]];
    
    
    
}

- (void)setupHeaderView {
    
    AssetheaderView *headerView = [[AssetheaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100.f)];

    [headerView.assetBtn addTarget:self action:@selector(assetBtnAction:) forControlEvents:UIControlEventTouchUpInside];
     [headerView.cardBtn addTarget:self action:@selector(cardBtnAction:) forControlEvents:UIControlEventTouchUpInside];
#pragma mark --- ???
    UIView *headerView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100.f)];
    [headerView2 addSubview:headerView];
    self.tableView.tableHeaderView = headerView2;
    
}

- (void) assetBtnAction:(UIButton *)sender {
    NSLog(@"didClicked");
}

- (void) cardBtnAction:(UIButton *)sender {
     NSLog(@"didClicked");
}


#pragma mark --- tableView DataSource
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CommonCellModel *model = self.dataArray[indexPath.section][indexPath.row];
    UIViewController *vc = [[model.targetClass alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    vc.title = model.title;
    [self.navigationController showViewController:vc sender:nil];
}



@end
