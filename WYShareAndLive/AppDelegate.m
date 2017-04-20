//
//  AppDelegate.m
//  WYShareAndLive
//
//  Created by MR-BusWang on 17/4/13.
//  Copyright © 2017年 乾坤翰林. All rights reserved.
//

#import "AppDelegate.h"
#import "WYHomeViewController.h"
#import "WYLiveViewController.h"
#import "WYVideoViewController.h"
#import "WYNewsViewController.h"
#import "WYMineViewController.h"
#import "WYNavigationController.h"
#import <UMSocialCore/UMSocialCore.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //初始化视窗
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //设置根视图界面（主页）
    WYHomeViewController * homeVC  = [[WYHomeViewController alloc] init];
//创建直播界面
    WYLiveViewController *liveVC = [[WYLiveViewController alloc] init];
    
    //创建视频播放界面
    WYVideoViewController * videoVC = [[WYVideoViewController alloc] init];
    
    //创建头条界面
    WYNewsViewController *newsVC  =[[WYNewsViewController alloc] init];
    //创建我的页面
    WYMineViewController *mineVC = [[WYMineViewController alloc] init];
       //设置导航栏(1)
    WYNavigationController *homeNavVC = [[WYNavigationController alloc] init];
    //设置导航栏（2）
    WYNavigationController *liveNavVC = [[WYNavigationController alloc] init];
    //设置导航栏(3)
    WYNavigationController *videoNavVC = [[WYNavigationController alloc] init];
    //设置导航栏（4）
    WYNavigationController *newsNavVC = [[WYNavigationController alloc] init];

    //设置导航栏(5)
    WYNavigationController *mineNavVC = [[WYNavigationController alloc] init];

    //分别设置5个导航栏的栈顶VC
    [homeNavVC pushViewController:homeVC animated:YES];
    [liveNavVC pushViewController: liveVC animated:YES];
    [videoNavVC pushViewController:videoVC animated:YES];
    [newsNavVC  pushViewController:newsVC animated:YES];
    [mineNavVC pushViewController:mineVC animated:YES];
    
    

    
    
    //创建tabBar控制器
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];

    homeNavVC.title = @"主页";
    liveNavVC.title = @"直播";
    videoNavVC.title = @"视频";
    newsNavVC.title = @"头条新闻";
    mineNavVC.title = @"我的";
    [tabBarVC addChildViewController:homeNavVC];
     [tabBarVC addChildViewController:liveNavVC];
     [tabBarVC addChildViewController:videoNavVC];
     [tabBarVC addChildViewController:newsNavVC];
     [tabBarVC addChildViewController:mineNavVC];
    
    //设置视窗的根视图为导航控制器
    self.window.rootViewController =tabBarVC;
      //视窗设置为主视窗并且使可见
    [self.window makeKeyAndVisible];
    
    
    
    //友盟社交
    [[UMSocialManager defaultManager] openLog:YES];
    
    /* 设置友盟appKey   */
    [[UMSocialManager defaultManager] setUmSocialAppkey:@"58f868947f2c741b4b0015e2"];
    
    [self configUSharePlatforms];
    
    [self confitUShareSettings];
    
    
    // Override point for customization after application launch.
    return YES;
}

- (void)confitUShareSettings
{
    /*
     * 打开图片水印
     */
    //[UMSocialGlobal shareInstance].isUsingWaterMark = YES;
    
    /*
     * 关闭强制验证https，可允许http图片分享，但需要在info.plist设置安全域名
     <key>NSAppTransportSecurity</key>
     <dict>
     <key>NSAllowsArbitraryLoads</key>
     <true/>
     </dict>
     */
    //[UMSocialGlobal shareInstance].isUsingHttpsWhenShareContent = NO;
    
}
- (void)configUSharePlatforms
{
    /* 设置微信的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wxdc1e388c3822c80b" appSecret:@"3baf1193c85774b3fd9d18447d76cab0" redirectURL:@"http://mobile.umeng.com/social"];
    /*
     * 移除相应平台的分享，如微信收藏
     */
    //[[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];
    
    /* 设置分享到QQ互联的appID
     * U-Share SDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
     */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"1105821097"/*设置QQ平台的appID*/  appSecret:nil redirectURL:@"http://mobile.umeng.com/social"];
    
    /* 设置新浪的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:@"3921700954"  appSecret:@"04b48b094faeb16683c32669824ebdad" redirectURL:@"https://sns.whalecloud.com/sina2/callback"];

}

// 支持所有iOS系统
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
  
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
