//
//  WYLoginView.h
//  WYShareAndLive
//
//  Created by MR-BusWang on 2017/6/5.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol WYLoginViewDelegate<NSObject>
- (void)loginButtonClick:(UIButton *)sender;
- (void)forgetButtonClick:(UIButton *)sender;
- (void)registerButtonClick:(UIButton *)sender;
- (void)thirdLoginButtonClick:(UIButton *)sender;
@end




@interface WYLoginView : UIView
@property (nonatomic, strong)UITextField *phoneTF;
@property (nonatomic ,strong)UITextField *passTF;
@property (nonatomic ,weak) id<WYLoginViewDelegate>delegate;
@end
