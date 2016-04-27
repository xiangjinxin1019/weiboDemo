//
//  Status.m
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/4/7.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "Status.h"

#import "User.h"

#import "Photo.h"

#import "RetweetStatus.h"

@implementation Status

+(instancetype)statusWithDictionary:(NSDictionary *)dict
{
    
    Status *status = [[Status alloc] init];
    
    status.idstr = dict[@"idstr"];
    status.text = dict[@"text"];
    status.created_at = dict[@"created_at"];
    status.source = dict[@"source"];
    
    // user对象（字典）
    status.user = [User userWithDictionary:dict[@"user"]];
    
    // pic_urls数组
    NSMutableArray *picArray = [NSMutableArray array];
    for (NSDictionary *pic in dict[@"pic_urls"]) {
        
        Photo *photo = [Photo photoWithDictionary:pic];
        [picArray addObject:photo];
    }
    status.pic_urls = picArray;


    status.retweeted_status = [RetweetStatus retweetStatusWithDictionary:dict[@"retweeted_status"]];
    
    return status;
}




@end
