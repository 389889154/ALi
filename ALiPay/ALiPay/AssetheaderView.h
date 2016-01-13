//
//  AssetheaderView.h
//  ALiPay
//
//  Created by wey on 16/1/13.
//  Copyright © 2016年 wey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssetheaderView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *usernamelabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *cardNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *assetsLabel;
@property (weak, nonatomic) IBOutlet UIButton *cardBtn;
@property (weak, nonatomic) IBOutlet UIButton *assetBtn;

@end
