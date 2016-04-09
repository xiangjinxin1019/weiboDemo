//
//  User.h
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/4/7.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject


/**字符串型的用户UID*/
@property (nonatomic,copy) NSString *idstr;

/**友好显示名称*/
@property (nonatomic,copy) NSString *name;

/**用户头像地址（中图），50×50像素*/
@property (nonatomic,copy) NSString *profile_image_url;


+(instancetype)userWithDictionary:(NSDictionary *)dict;

@end
