//
//  StatusCell.h
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/4/11.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StatusFrame;

@interface StatusCell : UITableViewCell


@property (nonatomic,strong) StatusFrame *statusFrame;


+(instancetype) initWithTableView:(UITableView *)tableView;


@end
