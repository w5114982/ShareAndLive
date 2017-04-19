//
//  WYTitleBarView.h
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/4/17.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYTitleBarView : UIScrollView
//存储按钮的数组
@property (nonatomic ,strong)NSMutableArray *titleButtons;
//记录当前的index
@property (nonatomic,assign)NSInteger currentIndex;
//点击事件的block
@property (nonatomic ,copy) void (^titleButtonClicked)(NSUInteger index);
//构造函数
- (instancetype)initWithFrame:(CGRect)frame andTitles:(NSArray *)titles;
@end
