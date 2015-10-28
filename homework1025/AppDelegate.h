//
//  AppDelegate.h
//  homework1025
//
//  Created by 지누 on 2015. 10. 25..
//  Copyright © 2015년 DarrenLine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LDCustomDelegate.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, LDCustomDelegate>{
    LDCustomDelegate *dele;
}

@property (strong, nonatomic) UIWindow *window;

@end

