//
//  RetweetStatus.m
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/4/26.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "RetweetStatus.h"

#import "Photo.h"

#import "User.h"

@implementation RetweetStatus

+(instancetype)retweetStatusWithDictionary:(NSDictionary *)dict
{
    RetweetStatus *retweetStatus = [[RetweetStatus alloc]init];
    
    retweetStatus.idstr = dict[@"idstr"];
    retweetStatus.text = dict[@"text"];
    retweetStatus.created_at = dict[@"created_at"];
    retweetStatus.source = dict[@"source"];
    
    // user对象（字典）
    retweetStatus.user = [User userWithDictionary:dict[@"user"]];
    
    // pic_urls数组
    NSMutableArray *picArray = [NSMutableArray array];
    for (NSDictionary *pic in dict[@"pic_urls"]) {
        
        Photo *photo = [Photo photoWithDictionary:pic];
        [picArray addObject:photo];
    }
    retweetStatus.pic_urls = picArray;
    
    return retweetStatus;

}

@end
