//
//  WYButtonsTableViewCell.m
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/5/25.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "WYButtonsTableViewCell.h"

@implementation WYButtonsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
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
            [self addSubview:btn];
            
            
        }
    }
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
