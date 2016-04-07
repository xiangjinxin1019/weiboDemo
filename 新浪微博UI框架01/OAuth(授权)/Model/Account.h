//
//  Account.h
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/4/5.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject <NSCoding>

/**用户授权的唯一票据，用于调用微博的开放接口，同时也是第三方应用验证微博用户登录的唯一票据*/
@property (nonatomic,copy) NSString *access_token;

/**	access_token的生命周期，单位是秒数*/
@property (nonatomic,copy) NSNumber *expires_in;

/**授权用户的UID*/
@property (nonatomic,copy) NSString *uid;

/**存入account时的时间*/
@property (nonatomic,strong) NSDate *created_time;

/**用户昵称*/
@property (nonatomic,copy) NSString *name;

+(instancetype) accountWithDictionary:(NSDictionary *)dict;

@end
