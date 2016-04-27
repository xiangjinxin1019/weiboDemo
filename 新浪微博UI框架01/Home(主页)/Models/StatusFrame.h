//
//  StatusFrame.h
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/4/11.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import <Foundation/Foundation.h>


#define cellW [UIScreen mainScreen].bounds.size.width
#define cellInterval 10  // 间距
#define nameLabelFont [UIFont systemFontOfSize:15]      // nameLabel的字体大小
#define timeLabelFont [UIFont systemFontOfSize:11]      // timeLabel的字体大小
#define sourceLabelFont timeLabelFont                   // sourceLabel的字体大小
#define contentLabelFont [UIFont systemFontOfSize:15]   // contentLabel的字体大小
#define retweetContentLabelFont [UIFont systemFontOfSize:13]   // contentLabel的字体大小




@class Status;

@interface StatusFrame : NSObject


@property (nonatomic,strong) Status *status;


/*原创微博控件*/
/**原创微博整体View*/
@property (nonatomic,assign) CGRect originalViewF;
/**微博头像*/
@property (nonatomic,assign) CGRect iconViewF;
/**vip图标*/
@property (nonatomic,assign) CGRect vipViewF;
/**微博配图*/
@property (nonatomic,assign) CGRect photoViewF;
/**微博昵称*/
@property (nonatomic,assign) CGRect nameLabelF;
/**发微博时间*/
@property (nonatomic,assign) CGRect timeLabelF;
/**来源*/
@property (nonatomic,assign) CGRect sourceLabelF;
/**微博正文*/
@property (nonatomic,assign) CGRect contentLabelF;



/*转发微博控件*/
/**转发微博整体View*/
@property (nonatomic,assign) CGRect retweetViewF;
/**转发微博正文*/
@property (nonatomic,assign) CGRect retweetContentLabelF;
/**转发微博配图*/
@property (nonatomic,assign) CGRect retweetPhotoViewF;



/**cell高度*/
@property (nonatomic,assign) CGFloat cellHeight;

@end
