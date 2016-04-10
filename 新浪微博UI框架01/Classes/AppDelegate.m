//
//  AppDelegate.m
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/3/23.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "AppDelegate.h"

#import "TabbarController.h"

#import "NewFeaturesViewController.h"

#import "OAuthController.h"

#import "Account.h"
#import "AccountTool.h"

#import "UIWindow+Extension.h"

#import "SDWebImageManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 1.创建窗口
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];

    // 2.显示窗口
    [self.window makeKeyAndVisible];
    
    // 3. 从沙盒中解档account,若access_token未过期，可成功返回account对象/ 过期，则返回nil
    Account *account = [AccountTool account];

    // 4.判断沙盒中是否有前一次登录时授权的信息
    if (account) { // 即沙盒中已存有account字典
        
        // 5.切换根控制器
        [UIWindow_Extension switchRootViewController];
        
    } else { // 6.如果沙盒中没有account字典，即第一次登录时需要授权
        
        self.window.rootViewController = [[OAuthController alloc]init];
        
    }
    
    return YES;
}


-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    // 当SDWebImage加载网络图片过多，内存警告时
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    
    // 取消下载网络图片的所有操作
    [manager cancelAll];
    
    // 清空缓存
    [manager.imageCache clearMemory];
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

#pragma mark - 当app进入后台时调用:
- (void)applicationDidEnterBackground:(UIApplication *)application {

    // 向操作系统申请后台运行的资格，能维持多久需要看情况
    UIBackgroundTaskIdentifier task = [application beginBackgroundTaskWithExpirationHandler:^{
        
        // 当申请的后台运行时间已到，进入此block
        
        // 赶紧关闭任务
        [application endBackgroundTask:task];
    }];
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
