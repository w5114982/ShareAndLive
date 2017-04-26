//
//  WYContainerViewController.m
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/4/25.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "WYContainerViewController.h"
#import "WYSqliteFmdbTool.h"
@interface WYContainerViewController ()<UIScrollViewDelegate>
/*新闻接口的数据*/
@property(nonatomic,retain)NSArray *arrayLists;

@property(nonatomic,retain)UIScrollView *titleView;
@property(nonatomic,retain)UIScrollView *vcView;
@property(nonatomic,assign)BOOL selected;

@end

@implementation WYContainerViewController

/*数组懒加载，加载界面的Channels*/
- (NSArray *)arrayLists{
    if (_arrayLists ==nil) {
        _arrayLists = [WYSqliteFmdbTool selectedChannels];
    }
    return _arrayLists;
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



/**创建ScrollView*/
- (void)createScrollView{
    if (self.vcView == nil) {
        self.vcView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 104, UISCREENWIDTH, UISCREENHEIGHT-144)];
    }
    CGFloat contentX = (self.childViewControllers.count-1)*UISCREENHEIGHT;
    self.vcView.contentSize = CGSizeMake(contentX, 0);
    self.vcView.pagingEnabled =YES;
    self.vcView.delegate = self;
    if (self.vcView.superview ==nil) {
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
