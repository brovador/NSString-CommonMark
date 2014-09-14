//
//  ViewController.m
//  Objc-CommonMark-Binding
//
//  Created by Jesús on 14/09/14.
//  Copyright (c) 2014 Jesús. All rights reserved.
//

#import "ViewController.h"
#import "NSString+CommonMarkdown.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIWebView *wv = [[UIWebView alloc] initWithFrame:CGRectInset(self.view.bounds, 0, 20)];
    [self.view addSubview:wv];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"CommonMark.md" ofType:nil];
    NSString *sampleDocument = [NSString stringWithContentsOfFile:filePath
                                                         encoding:NSUTF8StringEncoding
                                                            error:nil];
    [wv loadHTMLString:[sampleDocument cmd_htmlRepresentation:nil] baseURL:nil];
}

@end
