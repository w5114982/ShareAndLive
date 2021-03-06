//
//  WYContentScrollView.m
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/4/18.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "WYContentScrollView.h"

@implementation WYContentScrollView
- (instancetype)initWithFrame:(CGRect)frame andTitles:(NSArray *)titles{
    if (self = [super initWithFrame:frame]) {
        self.contentSize = CGSizeMake(frame.size.width *titles.count, 0);self.backgroundColor = [UIColor yellowColor];
        self.showsHorizontalScrollIndicator = NO;
    }
    return self;
}
- (void)contentScrollViewChangeWithBtnTag:(int )Tag{
    self.contentOffset =  CGPointMake(Tag *UISCREENWIDTH, 0);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
