//
//  LDDetailViewController.m
//  homework1025
//
//  Created by 지누 on 2015. 10. 25..
//  Copyright © 2015년 DarrenLine. All rights reserved.
//

#import "LDDetailViewController.h"
#import "LDUser.h"

@interface LDDetailViewController ()

@end

@implementation LDDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

-(instancetype)initWithDic:(LDUser *)dic{
    self = [super init];
    if(self){
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
        _addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 50)];
        _ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50)];
        _genderLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 50)];
        
        _nameLabel.text = dic.name;
        _addressLabel.text = dic.address;
        NSInteger ageInteger = dic.age;
        _ageLabel.text = [NSString stringWithFormat:@"%ld", ageInteger];
        LDGender gender = dic.gender;
        
        if(gender == LDGenderMale){
            _genderLabel.text = @"남자";
        }else{
            _genderLabel.text = @"여자";
        }
        
        [self.view addSubview:_nameLabel];
        [self.view addSubview:_addressLabel];
        [self.view addSubview:_ageLabel];
        [self.view addSubview:_genderLabel];
    }
    return self;
}

@end
