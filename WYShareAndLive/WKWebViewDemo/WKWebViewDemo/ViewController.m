//
//  ViewController.m
//  WKWebViewDemo
//
//  Created by MR-BusWang on 17/5/23.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "ViewController.h"
#import  <WebKit/WebKit.h>
#import "NewViewController.h"
#import "AppDelegate.h"
@interface ViewController ()<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler>
@property (nonatomic ,strong)WKWebView *webView;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
 self.navigationController.navigationBarHidden = YES;
    
 self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;
    

    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:@"/Users/guoqingyu/Desktop/ShareAndLive/WYShareAndLive/WKWebViewDemo/WKWebViewDemo/etzr_resource/index.html"]]];
    [self.view addSubview:self.webView];
    // Do any additional setup after loading the view, typically from a nib.
}




- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSString *currentURL = webView.URL.absoluteString;
    NSLog(@"%@",currentURL);
    
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler;

{
    
   // NSLog(@"URL ==== %@",URL);
    
    decisionHandler(WKNavigationResponsePolicyAllow);
  /*
    NSString *str = [URL scheme];
    if ([str isEqualToString:@"about:blank"]) {
        [self Handle];
          decisionHandler(WKNavigationResponsePolicyCancel);
        return;
    }
  
    
    decisionHandler(WKNavigationResponsePolicyAllow);
    
    */
}


-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    NSURL *URL = navigationAction.request.URL;
    if ([URL.absoluteString isEqual:@"http://www.baidu.com/"]) {
        decisionHandler(WKNavigationActionPolicyCancel);
        
        NSLog(@"1URLACTION %@",URL);
        return;
    }
    else{
        NSLog(@"2URLACTION %@",URL);
        [self handleCustomAction:URL];
        decisionHandler(WKNavigationActionPolicyAllow);
        return;
        
    }
  
   /*
    decisionHandler(WKNavigationActionPolicyCancel);
    return;
    }
    decisionHandler(WKNavigationActionPolicyAllow);
    */
}

- (void)handleCustomAction:(NSURL *)URL
{
    if ([URL.absoluteString isEqualToString:@"about:blank"]) {
          NSLog(@"URL === %@",URL.absoluteString);
     
        NewViewController * newVC  = [[NewViewController alloc]init];
newVC.url = [NSURL URLWithString:@"http://baidu.com"]   ;
      
        [self.navigationController pushViewController:newVC animated:YES];

    }
  
   /*
    if ([URL isEqual:@"about:blank"]) {
        NSLog(@"成功了");

        return ;
        
    }
            AppDelegate *app =     (id)[UIApplication sharedApplication].delegate;
    NewViewController * newVC  = [[NewViewController alloc]init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:newVC];
    app.window.rootViewController = nav;
    
*/
}
-(void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message

{

    NSLog(@"message%@",message);

}


- (void)addScriptHandleWithUserContentController:(WKUserContentController *)userCC{
    
}




/*- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{

}
 */

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
