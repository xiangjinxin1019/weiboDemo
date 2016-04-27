//
//  User.m
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/4/7.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "User.h"

@implementation User


//-(void)setMbrank:(int)mbrank
//{
//    _mbrank = mbrank;
//    
////    self.vip = mbrank > 2;
//}

-(BOOL)isVip
{
    return (self.mbrank.integerValue > 2);

}

+(instancetype)userWithDictionary:(NSDictionary *)dict
{
    
    User *user = [[User alloc]init];
    
    user.idstr = dict[@"idstr"];
    user.name = dict[@"name"];
    user.profile_image_url = dict[@"profile_image_url"];
    user.mbrank = dict[@"mbrank"];
    user.mbtype = dict[@"mbtype"];
    
    
    return user;
}




@end
