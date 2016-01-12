//
//  DiscoverViewController.m
//  ALiPay
//
//  Created by wey on 16/1/12.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "DiscoverViewController.h"
#import "DiscoverHeaderView.h"
#import "CommonTableViewCell.h"
#import "PlaceHolderVC.h"
#import "CommonCellModel.h"
@interface DiscoverViewController ()
@property (nonatomic, strong) NSArray *headerDataArr;
@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupHeader];
    self.cellClass = [CommonTableViewCell class];
    self.sectionNumber = self.dataArray.count;
    
      [self setupModel];
    
    NSLog(@"%@",[[UITableViewCell class] description]);
}

// 设置头视图
- (void)setupHeader {
    
    DiscoverBtnModel *item1 = [[DiscoverBtnModel alloc]initWithTitle:@"红 包" imageName:@"adw_icon_apcoupon_normal" targetClass:[PlaceHolderVC class]];
    DiscoverBtnModel *item2 = [[DiscoverBtnModel alloc]initWithTitle:@"电子券" imageName:@"adw_icon_coupon_normal" targetClass:[PlaceHolderVC class]];
    DiscoverBtnModel *item3 = [[DiscoverBtnModel alloc]initWithTitle:@"行程单" imageName:@"adw_icon_travel_normal" targetClass:[PlaceHolderVC class]];
    DiscoverBtnModel *item4 = [[DiscoverBtnModel alloc]initWithTitle:@"会员卡" imageName:@"adw_icon_membercard_normal" targetClass:[PlaceHolderVC class]];
    
    self.headerDataArr = @[item1,item2,item3,item4];
    DiscoverHeaderView *headerView = [[DiscoverHeaderView alloc]init];
    headerView.btnModels = self.headerDataArr;
    
    CGRect temp = headerView.frame;
    temp.size.height = 90.f;
    headerView.frame = temp;
    
    __weak typeof(self) weakSelf = self;
    headerView.clickedBLock = ^(NSInteger index) {
        DiscoverBtnModel *model = weakSelf.headerDataArr[index];
        UIViewController *vc = [[model.targetClass alloc]init];
        vc.title = model.title;
        [weakSelf.navigationController showViewController:vc sender:nil];
    };
    self.tableView.tableHeaderView = headerView;
    
}

//setupModel
- (void) setupModel {

    CommonCellModel *item1 = [[CommonCellModel alloc]initWithTitle:@"淘宝电影" imageName:@"adw_icon_movie_normal" targetClass:[PlaceHolderVC class]];
     CommonCellModel *item2 = [[CommonCellModel alloc]initWithTitle:@"快抢" imageName:@"adw_icon_flashsales_normal" targetClass:[PlaceHolderVC class]];
     CommonCellModel *item3 = [[CommonCellModel alloc]initWithTitle:@"快的打车" imageName:@"adw_icon_taxi_normal" targetClass:[PlaceHolderVC class]];
     CommonCellModel *item4 = [[CommonCellModel alloc]initWithTitle:@"我的朋友" imageName:@"adw_icon_contact_normal" targetClass:[PlaceHolderVC class]];
    
    self.dataArray = @[@[item1,item2,item3],@[item4]];
}

#pragma mark -- tableView DataSource

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

    CommonCellModel *model = self.dataArray[indexPath.section][indexPath.row];
    UIViewController *vc = [[model.targetClass alloc]init];
    vc.title = model.title;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController showViewController:vc sender:nil];
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 20.f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return (section == self.dataArray.count -1) ? 10 : 0;
}





@end
