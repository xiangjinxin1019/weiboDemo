//
//  SearchBar.m
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/3/30.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "SearchBar.h"

@implementation SearchBar

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.background = [UIImage imageNamed:@"searchbar_textfield_background"]; //框背景图已在Xcode中Assets设置拉伸
        self.font = [UIFont systemFontOfSize:14];
        self.clearButtonMode = UITextFieldViewModeAlways;
        self.placeholder = @"请输入搜索内容";
        
        /*定义搜索条中的放大镜图标*/
        UIImageView *searchIcon = [[UIImageView alloc]init];
        searchIcon.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        searchIcon.width = 30;
        searchIcon.height = 30;
        searchIcon.contentMode = UIViewContentModeCenter;
        self.leftView = searchIcon;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    
    return self;
    
}

+(instancetype)searchBar
{
    return [[self alloc]init];
}

@end
