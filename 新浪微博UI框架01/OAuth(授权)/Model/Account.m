//
//  Account.m
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/4/5.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "Account.h"

@implementation Account

+(instancetype) accountWithDictionary:(NSDictionary *)dict
{
    Account *account = [[Account alloc] init];
    
    account.access_token = dict[@"access_token"];
    account.expires_in = dict[@"expires_in"];
    account.uid = dict[@"uid"];
    
    // 存入account时的世界
    account.created_time = [NSDate date];
    
    return account;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeObject:self.expires_in forKey:@"expires_in"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.created_time forKey:@"created_time"];
    [aCoder encodeObject:self.name forKey:@"name"];
    
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        
        self.access_token = [aDecoder decodeObjectForKey:@"access_token"];
        self.expires_in = [aDecoder decodeObjectForKey:@"expires_in"];
        self.uid = [aDecoder decodeObjectForKey:@"uid"];
        self.created_time = [aDecoder decodeObjectForKey:@"created_time"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        
    }
    return self;
}

@end
