//
//  LoadMoreFooterView.m
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/4/10.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "LoadMoreFooterView.h"

@implementation LoadMoreFooterView

+(instancetype)footerView
{
    return [ [[NSBundle mainBundle] loadNibNamed:@"LoadMoreFooterView" owner:nil options:nil] firstObject];
}

@end
