//
//  Status.m
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/4/7.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "Status.h"

#import "User.h"

@implementation Status

+(instancetype)statusWithDictionary:(NSDictionary *)dict
{
    
    Status *status = [[Status alloc] init];
    
    status.idstr = dict[@"idstr"];
    status.text = dict[@"text"];
    
    // user对象（字典）
    status.user = [User userWithDictionary:dict[@"user"]];
    
    return status;
}

@end
