//
//  AccountTool.m
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/4/5.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//  处理account相关的所有业务逻辑

#import "AccountTool.h"
#import "Account.h"

/**沙盒中存储account信息的路径*/
#define kAccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]stringByAppendingPathComponent:@"account.archive"]

@implementation AccountTool

+(void) saveAccount:(Account *)account
{

    
    // 将account对象归档
    [NSKeyedArchiver archiveRootObject:account toFile:kAccountPath];
    

}

+(Account *)account
{
    // 解档得到account对象
    Account *account = [NSKeyedUnarchiver unarchiveObjectWithFile:kAccountPath];
    
    /*验证access_token是否过期*/
    // 获得当前时间
    NSDate *now = [NSDate date];
    
    // 获得access_token的生命周期,加上创建时的时间，得到过期的时间
    NSDate *createdTime = account.created_time;
    long long expiresTime = [account.expires_in longLongValue];
    NSDate *expiredTime = [createdTime dateByAddingTimeInterval:expiresTime];
    
    kLog(@"now:%@----expiredTime:%@",now,expiredTime);
    
    // 比较当前时间和过期时间
    NSComparisonResult result = [expiredTime compare:now];
    if (result != NSOrderedDescending) { // 如果过期时间 <= 当前时间，返回nil
        
        return  nil;
    }
    
    return  account;
}

@end
