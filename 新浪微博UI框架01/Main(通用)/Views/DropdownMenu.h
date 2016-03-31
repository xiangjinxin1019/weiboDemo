//
//  DropdownMenu.h
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/3/31.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropdownMenu : UIView

@property (nonatomic,strong) UIView *content;

@property (nonatomic,strong) UIViewController *contentController;


/**
 *  创建下拉菜单
 */
+(instancetype)dropdownMenu;

/**
 *  显示下拉菜单
 */
-(void)showFrom:(UIView *) view;

/**
 *  销毁下拉菜单
 */
-(void)dismiss;

@end
