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
@property(nonatomic ,strong)WYTitleBarView *titleBar ;
@property(nonatomic,strong) WYContentScrollView *contentScrollView ;
@end

@implementation WYNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    float Y =self.tabBarController.tabBar.frame.size.height+self.tabBarController.tabBar.frame.size.height;
   
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *array = @[@"军事",@"政治",@"生活",@"情感",@"军事",@"政治",@"生活",@"情感",@"军事",@"政治",@"生活",@"情感",@"军事",@"政治",@"生活",@"情感"];
self.titleBar = [[WYTitleBarView alloc] initWithFrame:CGRectMake(0, 0, UISCREENWIDTH, 49) andTitles:array];
   // self.titleBar.delegate = self;
  //  titleBar ^titleButtonClicked{
    //    NSLog(@"%ld",(long)titleBar.tag);
    //};

    [self.view addSubview:self.titleBar];
    
    self.contentScrollView = [[WYContentScrollView alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(self.titleBar.frame), [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height -Y-45-20) andTitles:array] ;
    self.contentScrollView.pagingEnabled = YES;
    self.contentScrollView.delegate = self;
    __weak typeof (self) weakSelf = self;
    [self.titleBar setTitleButtonClicked:^(NSUInteger index) {
        NSLog(@"index   = %lu",(unsigned long)index);
        weakSelf.contentScrollView.contentOffset =CGPointMake(index *UISCREENWIDTH, 0);
    }];
    [self.view addSubview:self.contentScrollView];
    // Do any additional setup after loading the view.
}

//滑动代理
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"content====%f",self.contentScrollView.contentOffset.x);
    self.titleBar.contentOffset = CGPointMake((self.contentScrollView.contentOffset.x)/15, 0);
       //NSLog(@"content====%f",self.titleBar.contentOffset.x);
 
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSLog(@"content====%f",self.contentScrollView.contentOffset.x);
    self.titleBar.currentIndex =(self.contentScrollView.contentOffset.x)/UISCREENWIDTH;
       NSLog(@"  self.titleBar.currentIndex====%ld",  (long)self.titleBar.currentIndex);
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidEndDecelerating");
    NSLog(@"content====%f",self.contentScrollView.contentOffset.x);
    self.titleBar.currentIndex =(self.contentScrollView.contentOffset.x)/UISCREENWIDTH;
    NSLog(@"  self.titleBar.currentIndex====%ld",  (long)self.titleBar.currentIndex);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
