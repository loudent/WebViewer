//
//  ViewController.m
//  WebViewer
//
//  Created by Troy Louden on 5/18/15.
//  Copyright (c) 2015 autodesk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //set a clear default
    self.URLText.text=@"";
    //get the last saved default
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *serverID = [defaults objectForKey:@"serverid"];
    
    self.URLText.text= serverID;
    self.webView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)LoadURL:(id)sender
{
    //Load The web server
    NSString *url =@"http://";
    url = [url stringByAppendingString:self.URLText.text];
    url = [url stringByAppendingString:@"/mapserver2016/mobileviewer/index.html"];
    NSMutableURLRequest * request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [self.webView loadRequest:request];
}

#pragma - mark UIWebView Delegate Methods
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"Loading URL :%@",request.URL.absoluteString);
    
    //return FALSE; //to stop loading
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //Save the text;
    NSString *serverID = [self.URLText text];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:serverID forKey:@"serverid"];
    [defaults synchronize];
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"Failed to load with error :%@",[error debugDescription]);
    //clear the webview
    [webView stringByEvaluatingJavaScriptFromString:@"document.open();document.close()"];
    UIAlertView *alert =
        [[UIAlertView alloc] initWithTitle:@"Error"
        message:@"Failed to load server"
        delegate:self
        cancelButtonTitle:@"OK"
        otherButtonTitles:nil];
    
    [alert show];

}


@end
