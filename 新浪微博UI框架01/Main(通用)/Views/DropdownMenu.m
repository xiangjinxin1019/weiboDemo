//
//  DropdownMenu.m
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/3/31.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "DropdownMenu.h"



@interface DropdownMenu ()

@property (nonatomic,weak) UIImageView *downView;



@end

@implementation DropdownMenu


-(instancetype)initWithFrame:(CGRect)frame
{
    
    if (self = [super initWithFrame:frame]) {
        
        // 创建透明色蒙版
        self.backgroundColor = [UIColor clearColor];
        
        // 创建下拉窗口视图
        UIImageView *downView = [[UIImageView alloc] init];
        downView.image = [UIImage imageNamed:@"popover_background"];
        downView.width = 200;
        downView.height = 300;
        downView.userInteractionEnabled = YES;
        [self addSubview:downView];
        
        self.downView = downView;

        
    }
    
    return self;
}


-(void)setContent:(UIView *)content
{
    _content = content;
    
    // 调整content内容
    content.x = 10;
    content.y = 15;
    
    content.width = self.downView.width - 2 * content.x;
    
    // 根据content内容设置downView的高度
    self.downView.height = CGRectGetMaxY(content.frame) + 10;
//    self.downView.width = CGRectGetMidX(content.frame) + 10;
    
    [self.downView addSubview:content];
}


-(void)setContentController:(UIViewController *)contentController
{
    _contentController = contentController;
    
    self.content = contentController.view;
}


+(instancetype)dropdownMenu
{
    return [[DropdownMenu alloc] init];
}


-(void)showFrom:(UIView *)from
{
    
    // 当前视图的最后一个window
    UIWindow *lastWindow = [[UIApplication sharedApplication].windows lastObject];
    
    // 设置self视图的大小
    self.frame = lastWindow.bounds;
    
    // 将视图添加到该window显示
    [lastWindow addSubview:self];
    
    // 默认是以父控件所在坐标系
    // 转换from的参考坐标系为window坐标系，这样可以得到需要的最大的Y
    CGRect newFrame = [from convertRect:from.bounds toView:nil];
    
    self.downView.centerX = CGRectGetMidX(newFrame);
    self.downView.y = CGRectGetMaxY(newFrame);
    
}


-(void)dismiss
{
    
    if ( [self.delegate respondsToSelector:@selector(dropDownMenuDidDismiss:)] ) {
        
        [self.delegate dropDownMenuDidDismiss:self];
    }
    
    [self removeFromSuperview];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}


@end
