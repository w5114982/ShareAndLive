//
//  WYNavigationController.m
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/4/17.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "WYNavigationController.h"

@interface WYNavigationController ()

@end

@implementation WYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.translucent = NO;
    //set NavigationBar 背景颜色&title 颜色
    [self.navigationBar setBarTintColor:NAVIGATIONBARCOLOR];
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,nil]];
    // Do any additional setup after loading the view.
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
