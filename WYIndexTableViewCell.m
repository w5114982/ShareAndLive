//
//  WYIndexTableViewCell.m
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/5/31.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "WYIndexTableViewCell.h"

@implementation WYIndexTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
        
           }
    return self;

}
- (void)createUI{

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
