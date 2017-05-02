//
//  WYContainerViewController.m
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/4/25.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "WYContainerViewController.h"
#import "WYSqliteFmdbTool.h"
#import "WYTitleLabel.h"
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
    [self createScrollView];
    [self addLabel];
    
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
    
    //添加默认控制器
    UIViewController *firstVC = [self.childViewControllers firstObject];
    firstVC.view.frame  =CGRectMake(0, -64, UISCREENWIDTH, UISCREENHEIGHT-144);
    [self.vcView addSubview:firstVC.view];
}
/**添加标题栏*/
- (void)addLabel{
    for (int i = 0; i<self.arrayLists.count; i++) {
        CGFloat lw = 70;
        CGFloat lh = 40;
        CGFloat ly = 0;
        CGFloat lx = i *lw;
        WYTitleLabel *label = [[WYTitleLabel alloc] init];
        label.text = self.arrayLists[i][@"title"];
        label.frame = CGRectMake(lx, ly, lw, lh);
        label.font = [UIFont systemFontOfSize:22];
        [self.titleView addSubview:label];
        label.tag = 1000+i;
        label.userInteractionEnabled = YES;
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick:)]];
        
    }
}
/**标题点击事件*/
- (void)labelClick:(UITapGestureRecognizer *)tap{
    WYTitleLabel *label = (WYTitleLabel *)tap.view;
    CGFloat offsetx = (label.tag-1000)*self.vcView.frame.size.width;
    CGFloat offsety = self.vcView.contentOffset.y;
    CGPoint offset = CGPointMake(offsetx, offsety);
    [self.vcView setContentOffset:offset animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - scrollView Delegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    //获取索引页
    NSInteger index = scrollView.contentOffset.x/self.vcView.bounds.size.width;
    
    //滚动标题栏
    WYTitleLabel *titleLabel = (WYTitleLabel *)self.titleView.subviews[index];
    CGFloat offsetX = titleLabel.center.x-self.titleView.frame.size.width*0.5;
    CGFloat offsetMax = self.titleView.contentSize.width -self.titleView.frame.size.width;
    if (offsetX<0) {
        offsetX = 0;
    }
    else if(offsetX>offsetMax){
        offsetX = offsetMax;
    }
    CGPoint offset = CGPointMake(offsetX, self.titleView.contentOffset.y);
    [self.titleView setContentOffset:offset animated:YES];
    
    
    
    [self.titleView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx != index) {
            WYTitleLabel *temp = self.titleView.subviews[idx];
            temp.scale = 0;
        }
    }];
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
