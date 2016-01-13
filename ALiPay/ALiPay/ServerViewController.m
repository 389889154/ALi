//
//  ServerViewController.m
//  ALiPay
//
//  Created by wey on 16/1/12.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "ServerViewController.h"
#import "CommonCellModel.h"
#import "ServerTableViewCell.h"
#import "ServerCollectionViewCell.h"
#define kSize self.view.frame.size
@interface ServerViewController () <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) NSMutableArray *headerItems;
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation ServerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupHeaderView];
    [self setTableView];
   
}

- (void)setTableView {
    
    _items = @[].mutableCopy;
    for (int a =0; a<10; a++) {
        CommonCellModel *model = [[CommonCellModel alloc]initWithTitle:@"title" imageName:@"appIcon"targetClass:nil];
        [_items addObject:model];
    }
    [self.tableView registerNib:[UINib nibWithNibName:@"ServerTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 80;
    [self.tableView reloadData];
}

- (void)setupHeaderView{
    _headerItems = @[].mutableCopy;
    for (int a =0; a<12; a++) {
        [_items addObject:@[@"appIcon",[NSString stringWithFormat:@"%d",a]]];
    }
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize = CGSizeMake(kSize.width/3, kSize.width/3);
    layout.sectionInset = UIEdgeInsetsMake(1, 1, 1, 1);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kSize.width, 100)collectionViewLayout:layout];
    [_collectionView registerNib:[UINib nibWithNibName:@"ServerCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor redColor];
    self.tableView.tableHeaderView = _collectionView;
    [self.collectionView reloadData];

}

#pragma  mark --- tableView DataSource 
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _items.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ServerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    CommonCellModel *model = _items[indexPath.row];
    cell.iconView.image = [UIImage imageNamed:model.imageName];
    cell.titleLabel.text = model.title;
    cell.detailTextLabel.text = model.title;
    return cell;
}
#pragma mark ---- collection Datasource

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"%ld",_headerItems.count);
    return _headerItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    ServerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.iconView.image = [UIImage imageNamed:_headerItems[indexPath.row][1]];
    cell.titleLabel.text = _headerItems[indexPath.row][0];
    NSLog(@"%@,",cell.titleLabel.text);
    return cell;
}

@end
