//
//  StatusFrame.m
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/4/11.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "StatusFrame.h"

#import "User.h"

#import "Status.h"

#import "RetweetStatus.h"



@implementation StatusFrame


/** 根据文本内容和字体确定其CGSize
 *  封装了sizeWithAttributes:方法
 *
 *  @param text 传递一个text文本
 *  @param font 传递一个font作为属性字典里值
 *
 *  @return CGSize
 */
-(CGSize)sizeWithText:(NSString *)text font:(UIFont *) font
{
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = font;

    return [text sizeWithAttributes:attributes];
}


/**
 *  根据文本内容和字体确定其CGSize (宽和高)
 *  封装了sizeWithAttributes:方法
 *
 *  @param text 传递一个text文本
 *  @param font 传递一个font作为属性字典里值
 *  @param maxWidth 传递一个最大的宽度值
 *
 */
-(CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxWidth:(CGFloat)maxWidth
{
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = font;
    
    CGSize maxSize = CGSizeMake(maxWidth, MAXFLOAT);
    
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
}





-(void)setStatus:(Status *)status
{
    _status = status;
    
    User *user = status.user;
    
    /* 1.设置原创微博各子控件的frame*/
    //微博头像
    CGFloat iconX = cellInterval;
    CGFloat iconY = cellInterval;
    CGFloat iconW = 50;
    CGFloat iconH = iconW;
    self.iconViewF = CGRectMake(iconX, iconY, iconW, iconH);
    
    //微博昵称
    CGFloat nameX = CGRectGetMaxX(self.iconViewF) + cellInterval;
    CGFloat nameY = iconY;
    CGSize nameSize = [self sizeWithText:user.name font:nameLabelFont];
    self.nameLabelF = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    
    /**vip图标*/
    if(user.isVip) {
        CGFloat vipX = CGRectGetMaxX(self.nameLabelF) + cellInterval;
        CGFloat vipY = nameY;
        CGFloat vipW = 14;
        CGFloat vipH = nameSize.height;
        self.vipViewF = CGRectMake(vipX, vipY, vipW, vipH);
    }
  
    /**发微博时间*/
    CGFloat timeX = nameX;
    CGFloat timeY = CGRectGetMaxY(self.nameLabelF) + cellInterval;
    CGSize timeSize = [self sizeWithText:status.created_at font:timeLabelFont];
    self.timeLabelF = CGRectMake(timeX, timeY, timeSize.width, timeSize.height);
    
    /**来源*/
    CGFloat sourceX = CGRectGetMaxX(self.timeLabelF) + cellInterval;
    CGFloat sourceY = timeY;
    CGSize sourceSize = [self sizeWithText:status.source font:sourceLabelFont];
    self.sourceLabelF = CGRectMake(sourceX, sourceY, sourceSize.width, sourceSize.height);
    
    /**微博正文*/
    CGFloat contentX = iconX;
    CGFloat contentY = MAX(CGRectGetMaxY(self.iconViewF), CGRectGetMaxY(self.nameLabelF)) + cellInterval;
    CGFloat maxWidth = cellW - 2 * cellInterval;
    CGSize contentSize = [self sizeWithText:status.text font:contentLabelFont maxWidth:maxWidth];
    self.contentLabelF = CGRectMake(contentX, contentY, contentSize.width, contentSize.height);
    
    /**微博配图*/
    CGFloat originalH;  //原创微博整体View的高度
    
    if (status.pic_urls.count) {
        CGFloat photoX = contentX;
        CGFloat photoY = CGRectGetMaxY(self.contentLabelF) + cellInterval;
        CGFloat photoW = 100;
        CGFloat photoH = 100;
        self.photoViewF = CGRectMake(photoX, photoY, photoW, photoH);
        
        originalH = CGRectGetMaxY(self.photoViewF) + cellInterval;
    } else
        originalH = CGRectGetMaxY(self.contentLabelF) + cellInterval;
    
    /**原创微博整体View*/
    CGFloat originalX = 0;
    CGFloat originalY = 0;
    CGFloat originalW = cellW;

    self.originalViewF = CGRectMake(originalX, originalY, originalW, originalH);
    
    self.cellHeight = CGRectGetMaxY(self.originalViewF);
    
    
    /* 2.设置转发微博各子控件的frame*/
    RetweetStatus *retweetStatus = status.retweeted_status;
    User *retweetUser = retweetStatus.user;
    
    if (retweetUser.name != NULL) {
        // 转发微博的正文
        CGFloat retweetContentX = cellInterval;
        CGFloat retweetContentY = cellInterval;
        NSString *retweetContent = [NSString stringWithFormat:@"@%@ : %@",retweetUser.name,retweetStatus.text];
        CGSize retweetContentSize = [self sizeWithText:retweetContent font:retweetContentLabelFont maxWidth:maxWidth];
        self.retweetContentLabelF = CGRectMake(retweetContentX, retweetContentY, retweetContentSize.width, retweetContentSize.height);
        
        CGFloat retweetH;  //转发微博整体View的高度
        
        // 转发微博的配图
        if (retweetStatus.pic_urls.count) {
            CGFloat retweetPhotoX = retweetContentX;
            CGFloat retweetPhotoY = CGRectGetMaxY(self.retweetContentLabelF) + cellInterval;
            CGFloat retweetPhotoW = 100;
            CGFloat retweetPhotoH = 100;
            self.retweetPhotoViewF = CGRectMake(retweetPhotoX, retweetPhotoY, retweetPhotoW, retweetPhotoH);
            
            retweetH = CGRectGetMaxY(self.retweetPhotoViewF) + cellInterval;
        } else
            retweetH = CGRectGetMaxY(self.retweetContentLabelF) + cellInterval;
        
        // 转发微博整体View
        CGFloat retweetX = 0;
        CGFloat retweetY = CGRectGetMaxY(self.originalViewF);
        CGFloat retweetW = cellW;
        self.retweetViewF = CGRectMake(retweetX, retweetY, retweetW, retweetH);
        
        self.cellHeight = CGRectGetMaxY(self.retweetViewF);
    } 
}

@end
