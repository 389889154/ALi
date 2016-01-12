//
//  DiscoverHeaderView.m
//  ALiPay
//
//  Created by wey on 16/1/12.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "DiscoverHeaderView.h"
#import "DiscoverBtn.h"
@implementation DiscoverHeaderView

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

// 设置
- (void)setBtnModels:(NSArray *)btnModels {

    _btnModels = btnModels;
    
    [btnModels enumerateObjectsUsingBlock:^(DiscoverBtnModel * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        DiscoverBtn *btn = [[DiscoverBtn alloc]init];
        btn.tag = idx;
        btn.title = obj.title;
        btn.imageName = obj.imageName;
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }];
}

- (void)btnClicked:(DiscoverBtn *)sender{
    
    if (self.clickedBLock) self.clickedBLock(sender.tag);

}

// 布局 更精确
- (void)layoutSubviews {
    [super layoutSubviews];
    if (!self.subviews.count) return;
    CGFloat w = self.frame.size.width/self.subviews.count;
    CGFloat h = self.frame.size.height;
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.frame = CGRectMake(idx * w, 0, w, h);
    }];
    
    
}
@end

@implementation DiscoverBtnModel

- (instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imageName targetClass:(Class)targetClass {
    if (self = [super init]) {
        self.title = title;
        self.imageName = imageName;
        self.targetClass = targetClass;
    }
    return self;
}

@end

