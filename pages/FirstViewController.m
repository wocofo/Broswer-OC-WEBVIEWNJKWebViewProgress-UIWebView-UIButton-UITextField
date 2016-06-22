//
//  UIWebviewTestVC.m
//  UIWebViewDemo
//
//  Created by Weblogic on 15/11/22.
//  Copyright © 2015年 Weblogic. All rights reserved.
//

#import "FirstViewController.h"
#import "NJKWebViewProgressView.h"
#import "NJKWebViewProgress.h"

@interface FirstViewController ()<UIWebViewDelegate,NJKWebViewProgressDelegate>
{
    UIWebView *_webView;
    NJKWebViewProgressView *_webViewProgressView;
    NJKWebViewProgress *_webViewProgress;
}

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    _webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview: _webView];
    
    _webViewProgress = [[NJKWebViewProgress alloc] init];
    _webView.delegate = _webViewProgress;
    _webViewProgress.webViewProxyDelegate = self;
    _webViewProgress.progressDelegate = self;
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://m.baidu.com"]];
    CGRect navBounds = self.tabBarController.tabBar.bounds;
    //需要正确设置navigation..tabbar....view
    CGRect barFrame = CGRectMake(0,navBounds.size.height - 2,navBounds.size.width,2);
    _webViewProgressView = [[NJKWebViewProgressView alloc] initWithFrame:barFrame];
    _webViewProgressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    [_webViewProgressView setProgress:0 animated:YES];
    
   
    
    [_webView loadRequest:request];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tabBarController.tabBar addSubview:_webViewProgressView];

}

-(void)viewWillDisappear:(BOOL)animated
{
    [_webViewProgressView removeFromSuperview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    [_webViewProgressView setProgress:progress animated:YES];
    self.title = [_webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

- (void) webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidStartLoad");
}
- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidFinishLoad");
}
- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"didFailLoadWithError:%@", error);
}

@end
