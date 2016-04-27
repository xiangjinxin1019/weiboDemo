//
//  Photo.h
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/4/26.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

/**缩略图地址*/
@property (nonatomic, copy) NSString *thumbnail_pic;


+(instancetype)photoWithDictionary:(NSDictionary *)dict;

@end
