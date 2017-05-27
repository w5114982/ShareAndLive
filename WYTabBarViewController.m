//
//  WYTabBarViewController.m
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/4/24.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "WYTabBarViewController.h"
#import "WYHomeViewController.h"
#import "WYLiveViewController.h"
#import "WYVideoViewController.h"
#import "WYNewsViewController.h"
#import "WYMineViewController.h"
#import "WYNavigationController.h"
@interface WYTabBarViewController ()

@end

@implementation WYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    
    // Do any additional setup after loading the view.
}
- (void)setup{
    //设置根视图界面（主页）
    WYHomeViewController * homeVC  = [[WYHomeViewController alloc] init];
    //创建直播界面
    WYLiveViewController *liveVC = [[WYLiveViewController alloc] init];
    
    //创建视频播放界面
    WYVideoViewController * videoVC = [[WYVideoViewController alloc] init];
    
    //创建头条界面
    WYNewsViewController *newsVC  =[[WYNewsViewController alloc] init];
    //创建我的页面
    WYMineViewController *mineVC = [[WYMineViewController alloc] init];
    //设置导航栏(1)
    WYNavigationController *homeNavVC = [[WYNavigationController alloc] init];
    //设置导航栏（2）
    WYNavigationController *liveNavVC = [[WYNavigationController alloc] init];
    //设置导航栏(3)
    WYNavigationController *videoNavVC = [[WYNavigationController alloc] init];
    //设置导航栏（4）
    WYNavigationController *newsNavVC = [[WYNavigationController alloc] init];
    
    //设置导航栏(5)
    WYNavigationController *mineNavVC = [[WYNavigationController alloc] init];
    
    //分别设置5个导航栏的栈顶VC
    [homeNavVC pushViewController:homeVC animated:YES];
    [liveNavVC pushViewController: liveVC animated:YES];
    [videoNavVC pushViewController:videoVC animated:YES];
    [newsNavVC  pushViewController:newsVC animated:YES];
    [mineNavVC pushViewController:mineVC animated:YES];
    
    
    
    
    
    //创建tabBar控制器
    
    homeNavVC.title = @"主页";
    liveNavVC.title = @"直播";
    videoNavVC.title = @"视频";
    newsNavVC.title = @"头条";
    mineNavVC.title = @"我的";

       [self addChildViewController:homeNavVC];
       [self addChildViewController:liveNavVC];
       [self addChildViewController:videoNavVC];
       [self addChildViewController:newsNavVC];
       [self addChildViewController:mineNavVC];
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
