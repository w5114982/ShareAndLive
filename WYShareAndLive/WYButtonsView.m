//
//  WYButtonsView.m
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/6/1.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "WYButtonsView.h"

@implementation WYButtonsView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    CGFloat btnWeight = self.frame.size.width/4;
    CGFloat btnHeight = self.frame.size.height/2;
    for (int i = 0; i<4; i++) {
        for (int j =0; j<2; j++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(i *btnWeight, j*btnHeight, btnWeight, btnHeight);
            [btn setTitle:@"按钮" forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor blueColor]];
            [self addSubview:btn];
            
            
            
        }
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
