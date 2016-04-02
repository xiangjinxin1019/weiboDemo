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



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 1.创建窗口
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    // 2.创建窗口的根控制器
    TabbarController *tabBarVC = [[TabbarController alloc]init]; //TabbarController是自定义的UITabbarController，里面有实现创建各个子控制器
    
    // 3.需根据当前版本号进行判断,窗口根控制器显示哪一个控制器
    // 从沙盒中取出的保存的上个版本号
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"CFBundleVersion"];
    
    // 从info.plist中取出当前版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    kLog(@"%@",currentVersion);
    
    // 如果版本号没有更新，那么正常进入tabBarController
    if ( [currentVersion isEqualToString:lastVersion] ) {
        
        self.window.rootViewController = tabBarVC;
    } else { // 否则进入新版本特性的控制器
        
        self.window.rootViewController = [[NewFeaturesViewController alloc] init];
        
        // 将当前版本号存储到沙盒中
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:@"CFBundleVersion"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }

    // 4.创建子控制器（在TabbarController的初始化时）
    
    
    // 5.显示窗口
    [self.window makeKeyAndVisible];
    
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
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
