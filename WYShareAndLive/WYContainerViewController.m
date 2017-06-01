//
//  WYContainerViewController.m
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/5/31.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "WYContainerViewController.h"
#import "WYNewsTableViewController.h"
#import "WYSqliteFmdbTool.h"
@interface WYContainerViewController ()
//新闻接口数组
@property (nonatomic ,retain)NSArray *arrayLists;

//上方滑动的区域标题

@property (nonatomic , retain)UIScrollView  *titleView;
;

//下方内容区域
@property (nonatomic , retain)UIScrollView * vcView;
@end

@implementation WYContainerViewController

/**数组懒加载，加载界面Channels */
- (NSArray *)arrayLists{
    if (_arrayLists == nil) {
        _arrayLists = [WYSqliteFmdbTool selectedChannels];
    }
    return _arrayLists;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.arrayLists);
    [self createScrollView];

    // Do any additional setup after loading the view.
}

//根据有多少的channel来创建多少个tableView作为子控制器
- (void)addController{
    for (int i ; i<self.arrayLists.count; i++) {
        WYNewsTableViewController *VC = [[WYNewsTableViewController alloc] init];
        VC.url = self.arrayLists[i][@"urlString"];
        VC.key = self.arrayLists[i][@"key"];
        VC.dataTitle = self.arrayLists[i][@"title"];
        [self addChildViewController:VC];
    }
}


//创建上下两个可滑动的区域

- (void)createScrollView{
    if (self.vcView ==nil) {
        self.vcView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 104, UISCREENWIDTH, UISCREENHEIGHT -144)];
        self.vcView.backgroundColor = [UIColor yellowColor];
    }
    
    CGFloat contextX = (self.childViewControllers.count-1) *UISCREENWIDTH;
    self.vcView.contentSize = CGSizeMake(contextX, 0);
    
    if (self.vcView.superview == nil) {
        [self.view addSubview:self.vcView];
    }
    
    
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
