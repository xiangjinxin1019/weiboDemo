//
//  DropdownMenu.h
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/3/31.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import <UIKit/UIKit.h>


@class DropdownMenu;

@protocol DropdownMenuDelegate <NSObject>

@optional
-(void) dropDownMenuDidDismiss:(DropdownMenu *)menu;  // 监听是否调用了dismiss方法

@end


@interface DropdownMenu : UIView

@property (nonatomic,strong) UIView *content;

@property (nonatomic,strong) UIViewController *contentController;


@property (nonatomic,weak) id<DropdownMenuDelegate> delegate;

/**
 *  创建下拉菜单
 */
+(instancetype)dropdownMenu;

/**
 *  显示下拉菜单
 */
-(void)showFrom:(UIView *) from;

/**
 *  销毁下拉菜单
 */
-(void)dismiss;

@end
