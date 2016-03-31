//
//  UIBarButtonItem+Extension.h
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/3/29.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+(UIBarButtonItem *)itemWithTarget:(id)target image:(NSString *)image imageHighlighted:(NSString *)imageHighlighted action:(SEL)action;

@end