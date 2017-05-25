//
//  NewViewController.m
//  WKWebViewDemo
//
//  Created by MR-BusWang on 17/5/23.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "NewViewController.h"
#import <WebKit/WebKit.h>
@interface NewViewController ()
@property(nonatomic ,strong)WKWebView *webView;
@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
    [self.view addSubview:self.webView];

    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{

    self.navigationController.navigationBarHidden = NO;
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
