//
//  RootViewController.m
//  ALiPay
//
//  Created by wey on 16/1/12.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "RootViewController.h"
#import "AssetViewController.h"
#import "HomeViewController.h"
#import "ServerViewController.h"
#import "DiscoverViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addChildViewController:[HomeViewController class] title:@"支付宝" selectImg:@"TabBar_HomeBar_Sel" img:@"TabBar_HomeBar"];
    [self addChildViewController:[ServerViewController class] title:@"服务" selectImg:@"TabBar_PublicService_Sel" img:@"TabBar_PublicService"];
    [self addChildViewController:[DiscoverViewController class] title:@"发现" selectImg:@"TabBar_Discovery_Sel" img:@"TabBar_Discovery"];
    [self addChildViewController:[AssetViewController class] title:@"财富" selectImg:@"TabBar_Assets_Sel" img:@"TabBar_Assets"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addChildViewController:(Class )class title:(NSString *)str selectImg:(NSString *)selectImg img:(NSString *)img {
    
    UIViewController *childController = [[class alloc]init];
    UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:childController];
    // 隐藏 tabbar
    if (childController.childViewControllers.count > 0) {
        childController.hidesBottomBarWhenPushed = YES;
    }
    childController.title = str;
    childController.tabBarItem = [[UITabBarItem alloc]initWithTitle:str image:[UIImage imageNamed:img] selectedImage:[UIImage imageNamed:selectImg]];
    [childController.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10 weight:16]} forState:UIControlStateNormal];
    [self addChildViewController:nvc];
}

@end
