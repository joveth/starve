//
//  WebController.m
//  IsaacNew
//
//  Created by Shuwei on 15/9/14.
//  Copyright (c) 2015年 jov. All rights reserved.
//

#import "WebController.h"
#import "ShareData.h"
#import "MBProgressHUD.h"

@interface WebController ()<UIWebViewDelegate>

@end

@implementation WebController{
    UIWebView *webview;
    MBProgressHUD *HUD;
    NSURLRequest *req;
    NSString *html;
    NSURL *baseURL ;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];
    HUD.labelText = @"加载中...";
    [HUD show:YES];
    NSString *path = [[NSBundle mainBundle] pathForResource:[ShareData shareInstance].bean.html ofType:@"html"];
    html = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    webview = [[UIWebView alloc] initWithFrame:self.view.frame];
    //self.title=[ShareData shareInstance].title;
    NSURL *url = [NSURL URLWithString:[ShareData shareInstance].urltype];
    req = [NSURLRequest requestWithURL:url];
    webview.delegate=self;
    [self.view addSubview:webview];
    if(![ShareData shareInstance].urltype){
        self.title=[ShareData shareInstance].bean.name;
    }
    self.view.backgroundColor=[UIColor whiteColor];
}
-(void)viewDidAppear:(BOOL)animated{
    if([ShareData shareInstance].urltype){
        [webview loadRequest:req];
    }else{
        [webview loadHTMLString:html baseURL:baseURL];
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [HUD hide:YES];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [HUD hide:YES];
}

@end
