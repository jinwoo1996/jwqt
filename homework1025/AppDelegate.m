//
//  AppDelegate.m
//  homework1025
//
//  Created by 지누 on 2015. 10. 25..
//  Copyright © 2015년 DarrenLine. All rights reserved.
//

#import "AppDelegate.h"
#import "LDCustomDelegate.h"
#import "LDRootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    LDRootViewController *root = [[LDRootViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:root];
    navi.navigationBar.translucent = NO;
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.rootViewController = navi;
    
    dele = [[LDCustomDelegate alloc]init];
    dele.delegate = self;
    [dele processComplete];
    
    [_window makeKeyAndVisible];
    
    return YES;
}

-(void)ProcessSuccessful:(BOOL)success{
    
}

@end
