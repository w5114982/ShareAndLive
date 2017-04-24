//
//  WYNewsViewController.m
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/4/17.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "WYNewsViewController.h"
#import "WYTitleBarView.h"
#import "WYContentScrollView.h"
#define WYScreenW [UIScreen mainScreen].bounds.size.width
#define WYScreenH [UIScreen mainScreen].bounds.size.height
@interface WYNewsViewController ()

@end

@implementation WYNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    float Y =self.tabBarController.tabBar.frame.size.height+self.tabBarController.tabBar.frame.size.height;
   
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *array = @[@"军事",@"政治",@"生活",@"情感",@"军事",@"政治",@"生活",@"情感",@"军事",@"政治",@"生活",@"情感",@"军事",@"政治",@"生活",@"情感"];
    WYTitleBarView *titleBar = [[WYTitleBarView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 49) andTitles:array];

    [self.view addSubview:titleBar];
    
    WYContentScrollView *contentScrollView = [[WYContentScrollView alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(titleBar.frame), [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height -Y-45-20) andTitles:array] ;
    contentScrollView.pagingEnabled = YES;
    contentScrollView.delegate = self;
    [self.view addSubview:contentScrollView];
    // Do any additional setup after loading the view.
}

//滑动代理
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"content====%f",scrollView.contentOffset.x);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
