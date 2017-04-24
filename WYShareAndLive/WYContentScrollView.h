//
//  WYContentScrollView.h
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/4/18.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYContentScrollView : UIScrollView
- (instancetype)initWithFrame:(CGRect)frame andTitles:(NSArray *)titles;
- (void)contentScrollViewChangeWithBtnTag:(int )Tag;
@end
