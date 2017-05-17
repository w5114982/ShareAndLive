//
//  WYLoginViewController.m
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/5/16.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "WYLoginViewController.h"
#import "WYNetWorkTask.h"
@interface WYLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *passWordTF;

@end

@implementation WYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登陆";
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)clickToLogin:(id)sender {
 //   NSDictionary *params =
    
    
  [WYNetWorkTask getWithURL:WYLOGININTERFACE withParameter:nil withHttpHeader:nil withResponseType:ResponseTypeJSON withSuccess:^(id result) {
      NSLog(@"result == %@",result);
  } withFail:^(NSError *error) {
      NSLog(@"error ==%@",error);
  }];
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
