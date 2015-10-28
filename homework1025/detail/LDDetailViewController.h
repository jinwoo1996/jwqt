//
//  LDDetailViewController.h
//  homework1025
//
//  Created by 지누 on 2015. 10. 25..
//  Copyright © 2015년 DarrenLine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LDUser.h"

@interface LDDetailViewController : UIViewController

@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *addressLabel;
@property (strong, nonatomic) UILabel *ageLabel;
@property (strong, nonatomic) UILabel *genderLabel;

-(instancetype)initWithDic:(LDUser *)dic;

@end