//
//  AssetheaderView.m
//  ALiPay
//
//  Created by wey on 16/1/13.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "AssetheaderView.h"

@implementation AssetheaderView

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"AssetheaderView" owner:nil options:nil] firstObject];
        self.frame = frame;
    }
    return self;
}



@end
