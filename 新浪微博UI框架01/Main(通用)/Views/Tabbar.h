//
//  Tabbar.h
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/3/31.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Tabbar;

@protocol TabbarDelegate <UITabBarDelegate>

@optional
-(void)tabBarDidClickPlusBtn:(Tabbar *)tabbar;

@end


@interface Tabbar : UITabBar

@property (nonatomic,weak) id<TabbarDelegate> _delegate;

@end
