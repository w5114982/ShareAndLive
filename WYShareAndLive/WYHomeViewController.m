//
//  MainViewController.m
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/4/17.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "WYHomeViewController.h"
#import <SDCycleScrollView.h>
@interface WYHomeViewController ()

@end

@implementation WYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"股轩堂";
    self.view.backgroundColor =[UIColor yellowColor];
   
    [self creatBtns];
    [self createTableView];
   // [self createUI];

    
    // Do any additional setup after loading the view.
}

- (void)createTableView{
 self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, UISCREENWIDTH, UISCREENHEIGHT) style:UITableViewStylePlain];
    
    SDCycleScrollView *bannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, UISCREENWIDTH, UISCREENWIDTH*1/3) imageNamesGroup:@[@"banner1.jpeg",@"banner2.jpeg",@"banner3.jpeg",@"banner4.jpeg",@"banner5.jpeg"]];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.tableHeaderView =bannerView;
    

    
}
//创建左右按钮
-(void)creatBtns{
    
    UIImage *image = [UIImage imageNamed:@"left"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:image style:0 target:self action:@selector(getNews)];
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [rightBtn setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    [rightBtn addTarget:self action:@selector(changeChannel:) forControlEvents:UIControlEventTouchUpInside];

    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewStylePlain reuseIdentifier:@"plain"];
    cell.backgroundColor = [UIColor purpleColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
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
