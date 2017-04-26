//
//  WYTitleLabel.m
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/4/26.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "WYTitleLabel.h"

@implementation WYTitleLabel
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont systemFontOfSize:12];
        self.scale = 0;
    }
    return self;
}
/**通过Scale的改变调整其他参数*/
- (void)setScale:(CGFloat)scale{
    _scale = scale;
    self.textColor = [UIColor colorWithRed:scale green:0.0 blue:0.0 alpha:1];
    CGFloat minScale = 0.7;
    CGFloat trueScale = minScale + (1-minScale)*scale;
    //按照比例缩放
    self.transform = CGAffineTransformMakeScale(trueScale, trueScale);
    
}
@end
