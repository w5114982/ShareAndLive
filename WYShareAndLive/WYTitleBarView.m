//
//  WYTitleBarView.m
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/4/17.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "WYTitleBarView.h"


@implementation WYTitleBarView

- (instancetype)initWithFrame:(CGRect)frame andTitles:(NSArray *)titles{
   
    if (self  =[super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _currentIndex = 0;
        _titleButtons = [NSMutableArray new];
        
        CGFloat buttonWidth = frame.size.width*2/titles.count;
        CGFloat buttonHeight = frame.size.height;
        
        [titles enumerateObjectsUsingBlock:^(NSString *title, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor = [UIColor whiteColor];
            button.titleLabel.font = [UIFont systemFontOfSize:15];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
         //   [button setTitle:@"1" forState:UIControlStateNormal];
            [button setTitle:title forState:UIControlStateNormal];
            button.frame = CGRectMake(buttonWidth *idx, 0, buttonWidth, buttonHeight);
            button.tag
            = idx;
            [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
            [_titleButtons addObject:button];
            [self addSubview:button];
        }];
        
        // 禁止额外滚动区域
      
        self.directionalLockEnabled =YES;
        self.contentSize = CGSizeMake(frame.size.width *2, 0);
       // self.alwaysBounceHorizontal = YES;
        //self.alwaysBounceVertical = NO;

        //self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        UIButton *firstTitle = _titleButtons[0];
        [firstTitle setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        firstTitle.transform = CGAffineTransformMakeScale(1.3, 1.3);

   
    }
    return self;
}

- (void)onClick:(UIButton *)button{
    if (_currentIndex != button.tag) {
        UIButton *preTitle = _titleButtons[_currentIndex];
        [preTitle setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        preTitle.transform = CGAffineTransformMakeScale(1, 1);

        
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        button.transform = CGAffineTransformMakeScale(1.3, 1.3);
        _currentIndex = button.tag;
        NSLog(@"_currentIndex = %ld",(long)_currentIndex);
       _titleButtonClicked(_currentIndex);
      
    }
    
}


@end
