//
//  DropdownButton.m
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/4/6.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "DropdownButton.h"

@implementation DropdownButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
//        self.imageView.contentMode = UIViewContentModeCenter;

//        self.imageView.backgroundColor = [UIColor redColor];
//        self.titleLabel.backgroundColor = [UIColor greenColor];
        
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        self.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        
        [self setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    }
    return self;
}


/**
 *  设置按钮文字的frame
 *
 *  @param contentRect 相当于按钮的bounds
 *
 */
//-(CGRect)titleRectForContentRect:(CGRect)contentRect
//{
//    CGFloat x = 0;
//    CGFloat y = 0;
//    CGFloat width = 150;
//    CGFloat height = contentRect.size.height;
//    
//    return CGRectMake(x, y, width, height);
//}

/**
 *  设置按钮图片的frame
 *
 *  @param contentRect 相当于按钮的bounds
 *
 */
//-(CGRect)imageRectForContentRect:(CGRect)contentRect
//{
//    CGFloat x = 150;
//    CGFloat y = 0;
//    CGFloat width = 15;
//    CGFloat height = contentRect.size.height;
//    
//    return CGRectMake(x, y, width, height);
//}

-(void)layoutSubviews
{
    
    [super layoutSubviews];
    
    // 调整titleLabel的布局
    self.titleLabel.x = self.imageView.x;  // 将原先图标的X给文字的x
    
    // 调整imageView的布局
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);  // 获得文字最大的X给图标X
    
}

/**重写setTitle方法，自适应titleLabel的宽高*/
-(void)setTitle:(NSString *)title forState:(UIControlState)state
{
    
    [super setTitle:title forState:state];
    
    [self sizeToFit];
}

/**重写setImage方法，自适应imageView的宽高*/
-(void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    
    [self sizeToFit];
}

@end
