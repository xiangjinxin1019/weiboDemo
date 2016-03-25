//
//  AppDelegate.m
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/3/23.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "AppDelegate.h"

#import "HomeViewController.h"
#import "MessageViewController.h"
#import "DiscoverViewController.h"
#import "ProfileViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 1.创建窗口
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    // 2.创建窗口的根控制器
    UITabBarController *tabBarVC = [[UITabBarController alloc]init];
    self.window.rootViewController = tabBarVC;
    
    // 3.创建子控制器
        // 主页
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    [self addChildVc:homeVC WithTitle:@"主页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    MessageViewController *messageVC = [[MessageViewController alloc]init];
    [self addChildVc:messageVC WithTitle:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
//    
//    MessageViewController *messageVC2 = [[MessageViewController alloc]init];
//    [self addChildVc:messageVC2 WithTitle:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    DiscoverViewController *discoverVC = [[DiscoverViewController alloc]init];
    [self addChildVc:discoverVC WithTitle:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    
    ProfileViewController *profileVC = [[ProfileViewController alloc]init];
    [self addChildVc:profileVC WithTitle:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    
    
    tabBarVC.viewControllers = @[homeVC, messageVC, discoverVC, profileVC];
    
    // 4.显示窗口
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(void)addChildVc:(UIViewController *)childVC WithTitle:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 子控制器的tabBarItem属性字典(选择时/未选中时)
    NSMutableDictionary *AttrDict = [NSMutableDictionary dictionary];
    AttrDict[NSForegroundColorAttributeName] = colorRGB(123, 123, 123);
    
    NSMutableDictionary *selectedAttrDict = [NSMutableDictionary dictionary];
    selectedAttrDict[NSForegroundColorAttributeName] = colorRGB(253, 128, 28);
    
    // 设置子控制器的文字、图片、选中图片
    childVC.view.backgroundColor = randomColor;
    [childVC.tabBarItem setTitleTextAttributes:AttrDict forState:UIControlStateNormal];
    [childVC.tabBarItem setTitleTextAttributes:selectedAttrDict forState:UIControlStateSelected];
    childVC.tabBarItem.title = title;
    childVC.tabBarItem.image = [UIImage imageNamed:image];
    childVC.tabBarItem.image = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];  // 按设置UIImage的渲染模式：原始方式

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
