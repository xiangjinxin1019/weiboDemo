//
//  Status.h
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/4/7.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;


@interface Status : NSObject

/**字符串型的微博ID*/
@property (nonatomic,copy) NSString *idstr;

/**微博信息内容*/
@property (nonatomic,copy) NSString *text;

/**微博作者的用户信息字段 详细*/
@property (nonatomic,strong) User *user;


+(instancetype)statusWithDictionary:(NSDictionary *)dict;

@end
