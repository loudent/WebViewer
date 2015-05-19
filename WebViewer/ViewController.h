//
//  ViewController.h
//  WebViewer
//
//  Created by Troy Louden on 5/18/15.
//  Copyright (c) 2015 autodesk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UIButton *LoadURL;
@property (weak, nonatomic) IBOutlet UITextField *URLText;

@end

