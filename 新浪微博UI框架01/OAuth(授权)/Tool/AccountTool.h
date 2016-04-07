//
//  AccountTool.h
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/4/5.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Account;

@interface AccountTool : NSObject

/**请求成功后将返回的,包含access_token等信息的字典存储到沙盒中*/
+(void) saveAccount:(Account *)account;


/**返回account对象，其中判断access_token是否过期,过期返回nil*/
+(Account *)account;

@end
