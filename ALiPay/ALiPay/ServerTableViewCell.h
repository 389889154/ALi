//
//  ServerTableViewCell.h
//  ALiPay
//
//  Created by wey on 16/1/13.
//  Copyright © 2016年 wey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServerTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end
