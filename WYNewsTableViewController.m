//
//  WYNewsTableViewController.m
//  
//
//  Created by MR-BusWang on 17/5/11.
//
//

#import "WYNewsTableViewController.h"
#import "MJRefresh.h"
#import "WYNetWorkTask.h"
#import "WYNewsModel.h"
#import <UIImageView+WebCache.h>

@interface WYNewsTableViewController ()
/**数据数组*/
@property (nonatomic,retain)NSMutableArray *dataModelArr;
/**界面数据计数器*/
@property (nonatomic,assign)NSInteger  count;
/**轮播图*/
@property (nonatomic,retain)UIScrollView *headView;
/**透视图片数组*/
@property (nonatomic,retain)NSArray *headViewImagesArr;



@end

@implementation WYNewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.count = 1;
    self.dataModelArr = [NSMutableArray new];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(reloadDataInfo)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(newDataInfo)];
    [self.tableView.mj_header beginRefreshing];
    
    // Do any additional setup after loading the view.
}

- (void)createHeadView{
    self.headView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, UISCREENWIDTH, 200)];
    WYNewsModel *model = [self.dataModelArr firstObject];
    self.headView.pagingEnabled = YES;
    self.headViewImagesArr = model.ads;
    self.headView.contentSize = CGSizeMake(UISCREENWIDTH*self.headViewImagesArr.count ,0);
    for (int i
         =0 ; i<self.headViewImagesArr.count; i++) {
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(UISCREENWIDTH *i, 0, UISCREENWIDTH, 200)];
        [image sd_setImageWithURL:[NSURL URLWithString:self.headViewImagesArr[i] [@"imgsrc"]] placeholderImage:nil];
        [self.headView addSubview:image];

}
}
/**刷新数据*/

- (void)newDataInfo{
    NSString *head = @"http://c.m.163.com/nc/article";
    NSString *foot = [NSString stringWithFormat:@"/%ld-20.html",20*self.count];
    NSString *temp = [NSString stringWithFormat:@"%@%@%@",head,self.url,foot];

[WYNetWorkTask getWithURL:temp withParameter:nil withHttpHeader:nil withResponseType:ResponseTypeJSON withSuccess:^(id result) {
    result = [result objectForKey:self.key];
    
    if (result ==nil) {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    }
    else{
        for (NSDictionary *dict in result) {
            WYNewsModel *model = [WYNewsModel newsModelWithDic:dict];
            [self.dataModelArr addObject:model];
            
            [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.dataModelArr.count -2 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
        }
        [self.tableView.mj_footer endRefreshing];
    }
    
}   withFail:^(NSError *error) {
    [self.tableView.mj_footer endRefreshing];
}];
    self.count ++;
}
//重新载入数据
- (void)reloadDataInfo{
    [self.dataModelArr removeAllObjects];
    [self.tableView reloadData];
    NSString *head = @"http://c.m.163.com/nc/article/";
    NSString *foot = @"/0-20.html";
    NSString *temp = [NSString stringWithFormat:@"%@%@%@",head,self.url,foot];
[WYNetWorkTask getWithURL:temp withParameter:nil withHttpHeader:nil withResponseType:ResponseTypeJSON withSuccess:^(id result) {
    result = [result objectForKey:self.key];
    
} withFail:^(NSError *error) {
    [self.tableView.mj_header endRefreshing];
}];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataModelArr.count - 1;
}

/*- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WYNewsModel *model = self.dataModelArr[indexPath.row +1];
    
    }

}*/

@end
