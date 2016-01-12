//
//  DiscoverHeaderView.h
//  ALiPay
//
//  Created by wey on 16/1/12.
//  Copyright © 2016年 wey. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark --- btn

@interface DiscoverBtnModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) Class targetClass;
- (instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imageName targetClass:(Class)targetClass;
@end


@interface DiscoverHeaderView : UIView

@property (nonatomic, strong) NSArray *btnModels;
@property (nonatomic, copy) void(^clickedBLock)(NSInteger index);

@end
