//
//  WYLoginViewController.m
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/5/16.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "WYLoginViewController.h"
#import "WYNetWorkTask.h"
#import "WYLoginView.h"
@interface WYLoginViewController ()



@end

@implementation WYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"登陆";
    // Do any additional setup after loading the view from its nib.
}
//@"http://rj.guxuantang.com/app/login/login.html?mobile=15021073237&password=123456&device_type=1&type=json"

- (void)createUI{
    WYLoginView * loginView = [[WYLoginView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:loginView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
