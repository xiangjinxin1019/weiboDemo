//
//  UIWindow+Extension.m
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/4/5.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "UIWindow+Extension.h"

#import "TabbarController.h"
#import "NewFeaturesViewController.h"

@implementation UIWindow_Extension

+(void)switchRootViewController
{
    
    /* 1. 创建窗口的根控制器*/
    //TabbarController是自定义的UITabbarController，里面有实现创建各个子控制器
    TabbarController *tabBarVC = [[TabbarController alloc]init];
    
    /* 2. 需根据当前版本号进行判断,窗口根控制器，显示哪一个控制器*/
    // 从沙盒中取出的保存的上个版本号
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"CFBundleVersion"];
    
    // 从info.plist中取出当前版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    kLog(@"%@",currentVersion);
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    /* 3.如果版本号没有更新，那么正常进入tabBarController*/
    if ( [currentVersion isEqualToString:lastVersion] ) {
        
        window.rootViewController = tabBarVC;
        
    } else { /* 4.否则进入新版本特性的控制器*/
        
        window.rootViewController = [[NewFeaturesViewController alloc] init];
        
        /* 5.将当前版本号存储到沙盒中*/
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:@"CFBundleVersion"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    
}


@end
