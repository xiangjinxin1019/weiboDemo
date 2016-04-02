//
//  NewFeaturesViewController.m
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/4/1.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "NewFeaturesViewController.h"

#import "TabbarController.h"

#define kScrollViewPictureCount 4

@interface NewFeaturesViewController () <UIScrollViewDelegate>

@property (nonatomic, weak) UIPageControl *pageControl;


@end

@implementation NewFeaturesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // 创建scrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
    
    
    // 添加图片
    CGFloat width = scrollView.width;
    CGFloat height = scrollView.height;
    for(int i = 0; i < kScrollViewPictureCount; i++)
    {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.width = width;
        imageView.height = height;
        imageView.y = 0;
        imageView.x = i * scrollView.width;
        
        NSString *name = [NSString stringWithFormat:@"new_feature_%d",i + 1];
        imageView.image = [UIImage imageNamed:name];
        
        
        // 如果是最后一张imageView，那么需要在上面添加东西
        if (i == kScrollViewPictureCount - 1) {
            
            [self settingImageView:imageView];
        }
        
        [scrollView addSubview:imageView];
    }
    
    // 设置scrollView属性
    scrollView.contentSize = CGSizeMake(kScrollViewPictureCount * width, 0);
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    
    
    // 设置scrollView代理
    scrollView.delegate = self;
    
    
    // 创建UIPageControl
    UIPageControl *pageCtl = [[UIPageControl alloc] init];
    pageCtl.numberOfPages = kScrollViewPictureCount;
    pageCtl.pageIndicatorTintColor = colorRGB(190, 190, 190);
    pageCtl.currentPageIndicatorTintColor = colorRGB(250, 160, 40);
    pageCtl.backgroundColor = [UIColor redColor];
    pageCtl.centerX = width * 0.5;
    pageCtl.centerY = height - 50;
//    pageCtl.userInteractionEnabled = NO;
    
    [self.view addSubview:pageCtl];
    
    self.pageControl = pageCtl;
}


-(void) settingImageView:(UIImageView *)imageView
{
    
    // 首先开启交互
    imageView.userInteractionEnabled = YES;
    
    // 创建一个“分享”按钮
    UIButton *shareBtn = [[UIButton alloc] init];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    [shareBtn setTitle:@"分享给大家" forState:UIControlStateNormal];
    shareBtn.width = 150;
    shareBtn.height = 40;
    shareBtn.centerX = imageView.width * 0.5;
    shareBtn.centerY = imageView.height * 0.65;
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shareBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    shareBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    
    [imageView addSubview:shareBtn];
    
    [shareBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    // 创建一个"开启微博"按钮
    UIButton *startBtn = [[UIButton alloc] init];
    startBtn.width = 100;
    startBtn.height = 40;
    startBtn.centerX = shareBtn.centerX;
    startBtn.centerY = imageView.height * 0.8;
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    [startBtn setTitle:@"开启微博" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(clickStart) forControlEvents:UIControlEventTouchUpInside];
    
    [imageView addSubview:startBtn];
    
}

-(void)click:(UIButton *)shareBtn
{
    shareBtn.selected = !shareBtn.isSelected;
}

-(void)clickStart
{
    TabbarController *tabBarController = [[TabbarController alloc] init];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = tabBarController;
    
}


#pragma mark - UIScrollView代理
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    double pageCount = scrollView.contentOffset.x / scrollView.width;
    
    self.pageControl.currentPage = (int)(pageCount + 0.5);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
