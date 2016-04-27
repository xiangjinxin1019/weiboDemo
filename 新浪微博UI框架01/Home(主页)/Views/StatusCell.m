//
//  StatusCell.m
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/4/11.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//
#import "PrefixHeader.pch"

#import "Status.h"
#import "User.h"

#import "StatusCell.h"

#import "StatusFrame.h"

#import "UIImageView+WebCache.h"

#import "Photo.h"

#import "RetweetStatus.h"

@interface StatusCell ()

/*原创微博控件*/
/**原创微博整体View*/
@property (nonatomic,weak) UIView *originalView;
/**微博头像*/
@property (nonatomic,weak) UIImageView *iconView;
/**vip图标*/
@property (nonatomic,weak) UIImageView *vipView;
/**微博配图*/
@property (nonatomic,weak) UIImageView *photoView;
/**微博昵称*/
@property (nonatomic,weak) UILabel *nameLabel;
/**发微博时间*/
@property (nonatomic,weak) UILabel *timeLabel;
/**来源*/
@property (nonatomic,weak) UILabel *sourceLabel;
/**微博正文*/
@property (nonatomic,weak) UILabel *contentLabel;


/*转发微博控件*/
/**转发微博整体View*/
@property (nonatomic,weak) UIView *retweetView;
/**转发微博正文*/
@property (nonatomic,weak) UILabel *retweetContentLabel;
/**转发微博配图*/
@property (nonatomic,weak) UIImageView *retweetPhotoView;

@end



@implementation StatusCell


+(instancetype)initWithTableView:(UITableView *)tableView
{
    
    static NSString *ID = @"statuses";

    StatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[StatusCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    return cell;
    
}


/**
 *  cell的初始化方法
 *  一般添加所有可能显示的子控件，以及子控件的一次性设置
 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] ) {
        
        /**初始化原创微博View*/
        [self initOriginalView];
        
        /**初始化转发微博View*/
        [self initRetweetView];
        
    }
    
    return self;
}

/**
 *  初始化原创微博View
 */
-(void)initOriginalView
{
    // 添加原创微博整体View
    UIView *originalView = [[UIView alloc] init];
    [self.contentView addSubview:originalView];
    self.originalView = originalView;
    
    // 向整体View中添加子控件
    /**头像*/
    UIImageView *iconView = [[UIImageView alloc] init];
    [self.originalView addSubview:iconView];
    self.iconView = iconView;
    
    /**vip图标*/
    UIImageView *vipView = [[UIImageView alloc] init];
    [self.originalView addSubview:vipView];
    self.vipView = vipView;
    
    /**微博配图*/
    UIImageView *photoView = [[UIImageView alloc] init];
    [self.originalView addSubview:photoView];
    self.photoView = photoView;
    
    /**微博昵称*/
    UILabel *nameLabel = [[UILabel alloc] init];
    [self.originalView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    /**发微博时间*/
    UILabel *timeLabel = [[UILabel alloc] init];
    [self.originalView addSubview:timeLabel];
    self.timeLabel = timeLabel;
    
    /**来源*/
    UILabel *sourceLabel = [[UILabel alloc] init];
    [self.originalView addSubview:sourceLabel];
    self.sourceLabel = sourceLabel;
    
    /**微博正文*/
    UILabel *contentLabel = [[UILabel alloc] init];
    [self.originalView addSubview:contentLabel];
    self.contentLabel = contentLabel;
}

/**
 *  初始化转发微博View
 */
-(void)initRetweetView
{
    // 添加转发微博整体View
    UIView *retweetView= [[UIView alloc] init];
    [self.contentView addSubview:retweetView];
    self.retweetView = retweetView;

    /**微博正文*/
    UILabel *retweetContentLabel = [[UILabel alloc] init];
    [self.retweetView addSubview:retweetContentLabel];
    self.retweetContentLabel = retweetContentLabel;
    
    /**微博配图*/
    UIImageView *retweetPhotoView = [[UIImageView alloc] init];
    [self.retweetView addSubview:retweetPhotoView];
    self.retweetPhotoView = retweetPhotoView;
    
}


/**初始化statusFrame*/
-(void)setStatusFrame:(StatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    Status *status = statusFrame.status;
    
    User *user = status.user;
    
/** 1.添加原创微博整体View*/
//    self.originalView.backgroundColor = [UIColor grayColor];
    self.originalView.frame = statusFrame.originalViewF;
    
    // 设置里面子控件的frame
    /**头像*/
    self.iconView.frame = statusFrame.iconViewF;
    NSURL *iconUrl = [NSURL URLWithString:user.profile_image_url];
    [self.iconView sd_setImageWithURL:iconUrl placeholderImage:[UIImage imageNamed:@"avatar_default_small"]];
    
    /**vip图标*/
    self.vipView.contentMode = UIViewContentModeCenter;
    if (user.isVip) {
        self.vipView.hidden = NO;
        NSString *vipImageName = [NSString stringWithFormat:@"common_icon_membership_level%@",user.mbrank];
        self.vipView.image = [UIImage imageNamed:vipImageName];
        self.vipView.frame = statusFrame.vipViewF;
        self.nameLabel.textColor = [UIColor orangeColor];
    } else {
        self.vipView.hidden = YES;
        
    }
    
    /**微博配图*/
    if (status.pic_urls.count) {
        self.photoView.frame = statusFrame.photoViewF;

        Photo *photo = [status.pic_urls firstObject];
        NSURL *photoUrl = [NSURL URLWithString:photo.thumbnail_pic];
        [self.photoView sd_setImageWithURL:photoUrl placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
        
        self.photoView.hidden = NO;
    } else {
        self.photoView.hidden = YES;
    }
    
    /**微博昵称*/
    self.nameLabel.frame = statusFrame.nameLabelF;
    self.nameLabel.font = [UIFont systemFontOfSize:15];
    self.nameLabel.numberOfLines = 0;
    self.nameLabel.text = user.name;
    
    /**发微博时间*/
    self.timeLabel.text = status.created_at;
    self.timeLabel.font = [UIFont systemFontOfSize:11];
    self.timeLabel.frame = statusFrame.timeLabelF;
    
    /**来源*/
    self.sourceLabel.text = status.source;
    self.sourceLabel.font = [UIFont systemFontOfSize:11];
    self.sourceLabel.frame = statusFrame.sourceLabelF;
    
    /**微博正文*/
    self.contentLabel.font = [UIFont systemFontOfSize:15];
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.frame = statusFrame.contentLabelF;
    self.contentLabel.text = status.text;

    
/** 2.添加转发微博整体View*/
    
    if (status.retweeted_status) {
            self.retweetView.hidden = NO;
            
            self.retweetView.frame = statusFrame.retweetViewF;
//            self.retweetView.backgroundColor = [UIColor lightGrayColor];
        
            // 设置转发微博各子控件的frame
            /**转发微博正文*/
            self.retweetContentLabel.frame = statusFrame.retweetContentLabelF;
            self.retweetContentLabel.font = [UIFont systemFontOfSize:13];
            self.retweetContentLabel.numberOfLines = 0;
            NSString *retweetContent = [NSString stringWithFormat:@"@%@ : %@",status.retweeted_status.user.name,status.retweeted_status.text];
            self.retweetContentLabel.text = retweetContent;

            
            /**转发微博配图*/
            if (status.retweeted_status.pic_urls) { // 如果转发微博中有配图
                self.retweetPhotoView.frame = statusFrame.retweetPhotoViewF;
                self.retweetPhotoView.hidden = NO;
                Photo *retweetPhoto = [status.retweeted_status.pic_urls firstObject];
                NSURL *retweetPhotoUrl = [NSURL URLWithString:retweetPhoto.thumbnail_pic];
                [self.retweetPhotoView sd_setImageWithURL:retweetPhotoUrl placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
            } else
                self.retweetPhotoView.hidden = YES;
        } else
            self.retweetView.hidden = YES;
    }



@end
