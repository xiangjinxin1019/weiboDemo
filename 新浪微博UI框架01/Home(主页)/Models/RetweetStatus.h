//
//  RetweetStatus.h
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/4/26.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface RetweetStatus : NSObject


/**微博作者的用户信息字段 详细*/
@property (nonatomic,strong) User *user;

/**字符串型的微博ID*/
@property (nonatomic,copy) NSString *idstr;
/**微博信息内容*/
@property (nonatomic,copy) NSString *text;
/**微博创建时间*/
@property (nonatomic,strong) NSString *created_at;
/**微博来源*/
@property (nonatomic,strong) NSString *source;
/**微博配图数组，里面包含多个字典*/
@property (nonatomic,strong) NSMutableArray *pic_urls;





+(instancetype)retweetStatusWithDictionary:(NSDictionary *)dict;


@end
