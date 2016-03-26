//
//  TabbarController.m
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/3/25.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "TabbarController.h"

#import "HomeViewController.h"
#import "MessageViewController.h"
#import "DiscoverViewController.h"
#import "ProfileViewController.h"

@interface TabbarController ()

@end

@implementation TabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    [self addChildVc:homeVC WithTitle:@"主页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    // 消息
    MessageViewController *messageVC = [[MessageViewController alloc]init];
    [self addChildVc:messageVC WithTitle:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    // 发现
    DiscoverViewController *discoverVC = [[DiscoverViewController alloc]init];
    [self addChildVc:discoverVC WithTitle:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    // 我
    ProfileViewController *profileVC = [[ProfileViewController alloc]init];
    [self addChildVc:profileVC WithTitle:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    
    
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
    
    [self addChildViewController:childVC];
    
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
