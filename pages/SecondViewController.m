//
//  SecondViewController.m
//  pages
//
//  Created by wocofo on 16/6/21.
//  Copyright © 2016年 wocofo. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
{
    IBOutlet UIButton *myButton;
    IBOutlet UIWebView *webView;
   // IBOutlet UITextField *text;
   IBOutlet UIActivityIndicatorView *activityIndicatorView;
}
@property (weak, nonatomic) IBOutlet UITextField *text;


@end

@implementation SecondViewController
@synthesize text;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.}
    text.text=@"格式https://或者http://的网址";
    webView.scalesPageToFit =YES;
    webView.delegate =self;
    activityIndicatorView = [[UIActivityIndicatorView alloc]
                             initWithFrame : CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)] ;
    [activityIndicatorView setCenter: self.view.center] ;
    [activityIndicatorView setActivityIndicatorViewStyle: UIActivityIndicatorViewStyleWhite] ;
    [self.view addSubview : activityIndicatorView] ;
    [self buttonPress:nil];
  [myButton addTarget:self action:@selector(buttonPress:)  forControlEvents:UIControlEventTouchDown];

}



- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

- (IBAction)loadWebPageWithString:(NSString *)urlString
{

    NSURL *url =[NSURL URLWithString:urlString];
     webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 85, 415, 600)];
    [self.view addSubview:webView];
    [webView scalesPageToFit];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];

    
    
}

- (IBAction)buttonPress:(id) sender
{
    text.tag = 1000;
    UITextField *text=(UITextField *)[self.view viewWithTag:1000] ;
    NSString *str3=text.text;
    [self loadWebPageWithString:str3];
    
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [activityIndicatorView startAnimating] ;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activityIndicatorView stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
 
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
