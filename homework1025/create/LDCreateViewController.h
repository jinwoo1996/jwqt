//
//  LDCreateViewController.h
//  homework1025
//
//  Created by 지누 on 2015. 10. 25..
//  Copyright © 2015년 DarrenLine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDCreateViewController : UIViewController<UITextFieldDelegate>

@property(strong, nonatomic) UILabel *name;
@property(strong, nonatomic) UILabel *email;
@property(strong, nonatomic) UILabel *age;
@property(strong, nonatomic) UILabel *gender;
@property(strong, nonatomic) UISegmentedControl *inputGender;
@property(strong, nonatomic) NSString *nameValue;
@property(strong, nonatomic) NSString *emailValue;
@property(strong, nonatomic) NSNumber *ageValue;
@property(strong, nonatomic) NSString *genderValue;
@property(strong, nonatomic) NSMutableArray *user;
@property(strong, nonatomic) UITableView *table;

-(instancetype) initWithUser:(NSMutableArray *)a :(UITableView *)b;
@end
