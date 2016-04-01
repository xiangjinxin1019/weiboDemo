//
//  Tabbar.m
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/3/31.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "Tabbar.h"


@interface Tabbar ()

@property (nonatomic,weak) UIButton *plusBtn;

@end

@implementation Tabbar

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // 创建tabbar底部“加号”按钮
        UIButton *plusBtn = [[UIButton alloc] init];
        
        // 设置按钮图片
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        // 设置按钮大小
        plusBtn.size = plusBtn.currentBackgroundImage.size;
        
        [self addSubview:plusBtn];
        
        
        [plusBtn addTarget:self action:@selector(plusBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        
        self.plusBtn = plusBtn;  // 强引用
        
        
    }
    
    return self;
}

-(void)plusBtnClicked
{
    
    if ( [self.delegate respondsToSelector:@selector(tabBarDidClickPlusBtn:)] ) {
        
        [self._delegate tabBarDidClickPlusBtn:self];
    }
    
}

-(void)layoutSubviews
{
    
    [super layoutSubviews];
    
    // 设置“加号”按钮的位置
    self.plusBtn.centerX = self.size.width * 0.5;
    self.plusBtn.centerY = self.size.height * 0.5;
    
    // 调整原先在tabbar上系统自带按钮的位置
    CGFloat tabbarBtnW = self.width / 5;
    CGFloat tabbarBtnIndex = 0;
    
    // 遍历subviews中所有view
    for (UIView *childView in self.subviews) {
        
        Class class = NSClassFromString(@"UITabBarButton");
        if ( [childView isKindOfClass:class] ) {
            
            // 设置宽度
            childView.width = tabbarBtnW;
            
            // 设置位置
            childView.x = tabbarBtnIndex * tabbarBtnW;
            
            tabbarBtnIndex++;
            
            if (tabbarBtnIndex == 2) {
                tabbarBtnIndex++;
            }
            
            
        }
    }
    
}

@end
