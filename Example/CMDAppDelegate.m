//
//  CMDAppDelegate.m
//  Objc-CommonMark-Binding
//
//  Created by Jesús on 14/09/14.
//  Copyright (c) 2014 Jesús. All rights reserved.
//

#import "CMDAppDelegate.h"
#import "ViewController.h"

@implementation CMDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ViewController *vc = [[ViewController alloc] init];
    self.window.rootViewController = vc;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
