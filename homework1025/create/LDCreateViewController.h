//
//  LDCreateViewController.h
//  homework1025
//
//  Created by 지누 on 2015. 10. 25..
//  Copyright © 2015년 DarrenLine. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LDCreateViewController;
@class LDUser;
@protocol LDCreateViewControllerDelegate <NSObject>

- (void)createViewControllder:(LDCreateViewController *)viewController didCreateUser:(LDUser *)user;

@end

@interface LDCreateViewController : UIViewController<UITextFieldDelegate>

@property(weak, nonatomic) id<LDCreateViewControllerDelegate> delegate;

@property(strong, nonatomic) UILabel *name;
@property(strong, nonatomic) UILabel *email;
@property(strong, nonatomic) UILabel *age;
@property(strong, nonatomic) UILabel *gender;
@property(strong, nonatomic) UISegmentedControl *inputGender;
@property(strong, nonatomic) NSString *nameValue;
@property(strong, nonatomic) NSString *emailValue;
@property(strong, nonatomic) NSNumber *ageValue;
@property(strong, nonatomic) NSString *genderValue;

-(instancetype) init;
@end
