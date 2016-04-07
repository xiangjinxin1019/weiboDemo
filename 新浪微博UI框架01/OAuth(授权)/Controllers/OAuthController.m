//
//  OAuthController.m
//  新浪微博UI框架01
//
//  Created by labixiaoxin1019 on 16/4/3.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "OAuthController.h"

#import "AFNetworking.h"

#import "TabbarController.h"
#import "NewFeaturesViewController.h"

#import "Account.h"
#import "AccountTool.h"

#import "UIWindow+Extension.h"

@interface OAuthController () <UIWebViewDelegate>

@end

@implementation OAuthController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // 1.创建一个webview
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.bounds;
    webView.delegate = self;
    
    [self.view addSubview:webView];
    
    // 2.加载
    /**
     *  请求地址：https://api.weibo.com/2/oauth2/authorize
     *  请求参数: client_id （App Key：1263425441）
     *          redirect_uri（回调地址）
     */
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/2/oauth2/authorize?client_id=1263425441&redirect_uri=http://weibo.com/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
}

#pragma mark - webView的代理方法
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    kLog(@"webViewDidStartLoad");
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    kLog(@"webViewDidFinishLoad");
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
//    kLog(@"shouldStartLoadWithRequest: %@", request.URL.absoluteString);
    
    // 1.获得URL
    NSString *url = request.URL.absoluteString;
    
    // 2.找到code的位置
    NSRange range = [url rangeOfString:@"code="];
    if (range.length != 0) {
        
        int locIndex = range.location + range.length;
        
        // 3.截取“code=”后的字符串
        NSString *code = [url substringFromIndex:locIndex];
        kLog(@"%@",code);
        
        // 4.通过code换取access_token
        [self getAccessTokenWithCode:code];
    }
    
    
    return YES;
}

-(void)getAccessTokenWithCode:(NSString *)code
{
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    /**
     *  url:https://api.weibo.com/oauth2/access_token
     *  请求方式：POST
     *  请求参数：1）client_id 申请应用时分配的AppKey
     *          2）client_secret	 申请应用时分配的AppSecret。
     *          3）grant_type	请求的类型，填写authorization_code
     *
     */
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"client_id"] = @"1263425441";
    parameters[@"client_secret"] = @"c7a9e3866c076f0a12ed0c3b1bc9e6d5";
    parameters[@"grant_type"] = @"authorization_code";
    parameters[@"code"] = code;
    parameters[@"redirect_uri"] = @"http://weibo.com/";
    
    
    [manager POST:@"https://api.weibo.com/oauth2/access_token" parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        kLog(@"请求成功");
        kLog(@"%@",responseObject);
        
        /* 1. 将请求成功后将返回的,包含access_token等信息的字典 ———> 模型对象account*/
        Account *account = [Account accountWithDictionary:responseObject];
        
        /* 2. 将模型对象存入沙盒中*/
        [AccountTool saveAccount:account];
        
        /* 3. 切换根控制器*/
        [UIWindow_Extension switchRootViewController];

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        kLog(@"请求失败");
        kLog(@"%@",error);
    }];
    
}
                               


@end
