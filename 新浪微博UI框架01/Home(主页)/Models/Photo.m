//
//  Photo.m
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/4/26.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "Photo.h"

@implementation Photo

+(instancetype)photoWithDictionary:(NSDictionary *)dict
{
    Photo *photo = [[Photo alloc]init];
    
    photo.thumbnail_pic = dict[@"thumbnail_pic"];
    
    return photo;
}

@end
