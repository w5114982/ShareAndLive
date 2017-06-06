//
//  WYLoginView.m
//  WYShareAndLive
//
//  Created by MR-BusWang on 2017/6/5.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "WYLoginView.h"
#import <MASConstraint.h>
@interface WYLoginView()<UITextFieldDelegate>
@property (nonatomic ,strong)UIButton *loginBtn;
@property (nonatomic , strong)UIButton *forgetBtn;
@property (nonatomic ,strong)UIButton *registBtn;
@end
@implementation WYLoginView



- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupChildViews];
     
    }
    return self;
}
//点击取消编辑
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self endEditing:YES];
}
- (void)setupChildViews{
    
    UIView *phoneSuperView = [[UIView alloc] init];
    phoneSuperView.backgroundColor = [UIColor greenColor];
    [self addSubview:phoneSuperView];
    [phoneSuperView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(15);
        make.left.equalTo(self).with.offset(10);
        make.right.equalTo(self).with.offset(-10);
        make.height.equalTo(@46);
    }];
    
    UILabel *phoneLabel = [[UILabel alloc] init];
    phoneLabel.text = @"手机号";
    phoneLabel.textColor = [UIColor blackColor];
    phoneLabel.font = [UIFont systemFontOfSize:16];
    [phoneSuperView addSubview:phoneLabel];
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneSuperView).with.offset(13);
        make.centerY.equalTo(phoneSuperView);
    }];
    
    [phoneSuperView addSubview:self.phoneTF];
    [self.phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.right.and.bottom.equalTo(phoneSuperView);
        make.left.equalTo(phoneLabel.mas_right).with.offset(10);
    }];
    
    
    //密码
    UIView *passSuperView = [[UIView alloc] init];
    passSuperView.backgroundColor = [UIColor greenColor];
    [self addSubview:passSuperView];
    [passSuperView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneSuperView.mas_bottom).with.offset(8);
        make.left.equalTo(self).with.offset(10);
        make.right.equalTo(self).with.offset(-10);
        make.height.equalTo(@46);
    }];
    
    UILabel *passLabel = [[UILabel alloc] init];
    passLabel.text = @"密码";
    passLabel.textColor = [UIColor blackColor];
    passLabel.font = [UIFont systemFontOfSize:16];
    [passSuperView addSubview:passLabel];
    [passLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(passSuperView).with.offset(13);
        make.centerY.equalTo(passSuperView);
    }];
    
    [passSuperView addSubview:self.passTF];
    [self.passTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.right.and.bottom.equalTo(passSuperView);
        make.left.equalTo(passLabel.mas_right).with.offset(25);
    }];
    //登陆按钮
    [self addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passSuperView.mas_bottom).with.offset(18);
        make.left.equalTo(self).with.offset(10);
        make.right.equalTo(self).with.offset(-10);
        make.height.equalTo(@46);
    }];
    
    
    
    //注册按钮
    [self addSubview:self.registBtn];
    [self.registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginBtn.mas_bottom).with.offset(16);
        make.right.equalTo(self).with.offset(-10);
    }];

    UIView *verLine = [[UIView alloc] init];
    [self addSubview:verLine];
    verLine.backgroundColor = [UIColor blueColor];
    [verLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.registBtn.mas_left).with.offset(-9);
        make.centerY.equalTo(self.registBtn);
        make.height.equalTo(@12);
        make.width.equalTo(@1);
    }];
    
    
    [self addSubview:self.forgetBtn];
    [self.forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(verLine);
        make.right.equalTo(verLine.mas_left).offset(-9);
    }];
  
    
    
    
    
}




#pragma mark - getter
- (UITextField *)phoneTF{
    if (!_phoneTF) {
        _phoneTF = [[UITextField alloc] init];
        _phoneTF.placeholder = @"请输入手机号";
        _phoneTF.font = [UIFont systemFontOfSize:14];
        _phoneTF.keyboardType = UIKeyboardTypeNumberPad;
        _phoneTF.delegate = self;
    }
    return _phoneTF;
}


- (UITextField *)passTF{
    if (!_passTF) {
        _passTF = [[UITextField alloc] init];
        _passTF.placeholder =@"请输入密码";
        _passTF.font = [UIFont systemFontOfSize:14];
        _passTF.delegate = self;
        _passTF.enablesReturnKeyAutomatically = YES;
        _passTF.secureTextEntry = YES;
    }
    return _passTF;
}

- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc] init];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setBackgroundColor:[UIColor blueColor]];
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _loginBtn.layer.cornerRadius = 5;
        _loginBtn.layer.masksToBounds =YES;
        [_loginBtn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

- (UIButton *)registBtn{
    if (!_registBtn) {
        _registBtn = [[UIButton alloc] init];
        [_registBtn setTitle:@"注册新用户" forState:UIControlStateNormal];
        [_registBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _registBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_registBtn addTarget:self action:@selector(registAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registBtn;
}

- (UIButton *)forgetBtn{
    if (!_forgetBtn) {
        _forgetBtn = [[UIButton alloc] init];
        [_forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgetBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _forgetBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_forgetBtn addTarget:self action:@selector(forgetAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetBtn;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
#pragma mark - buttob action
- (void)loginAction:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(loginButtonClick:)]) {
        [self.delegate loginButtonClick:sender];
    }
}

- (void)registAction:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(registerButtonClick:)]) {
        [self.delegate registerButtonClick:sender];
    }
}

- (void)forgetAction:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(forgetButtonClick:)]) {
        [self.delegate forgetButtonClick:sender];
    }
}

@end
