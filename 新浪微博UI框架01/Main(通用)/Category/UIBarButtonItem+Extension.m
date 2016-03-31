//
//  UIBarButtonItem+Extension.m
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/3/29.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

/**
 *  UIBarButtonItem上自定义按钮的类方法
 *
 *  @param target           点击按钮在哪个类中寻找监听方法
 *  @param image            按钮的图片
 *  @param imageHighlighted 按钮的高亮图片
 *  @param action           点击按钮监听方法
 *
 *  @return 返回一个包装好的UIBarButtonItem
 */
+(UIBarButtonItem *)itemWithTarget:(id)target image:(NSString *)image imageHighlighted:(NSString *)imageHighlighted action:(SEL)action
{
    UIButton *btn = [[UIButton alloc]init];
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:imageHighlighted] forState:UIControlStateHighlighted];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside]; //此处addTarget：应该通过调用该方法的类传进来
    
    // 设置图片大小
    btn.size = btn.currentBackgroundImage.size;
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];

}

@end