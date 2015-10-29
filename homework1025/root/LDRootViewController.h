//
//  LDRootViewController.h
//  homework1025
//
//  Created by 지누 on 2015. 10. 25..
//  Copyright © 2015년 DarrenLine. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LDUser.h"
#import "LDCreateViewController.h"

@class LDUser;

@interface LDRootViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *arr;
@property (strong, nonatomic) LDUser *userInfo;
@property (strong, nonatomic) UITableView *table;

+(NSArray *) defaultDic;
@end
