//
//  LDUser.m
//  homework1025
//
//  Created by 지누 on 2015. 10. 25..
//  Copyright © 2015년 DarrenLine. All rights reserved.
//

#import "LDUser.h"

@implementation LDUser

-(instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if(self){
        _name = dic[@"name"];
        _address = dic[@"address"];
        NSNumber *ageNumber = dic[@"age"];
        _age = ageNumber.integerValue;
        NSString *genderString = dic[@"gender"];
        if([genderString isEqualToString:@"female"]){
            _gender = LDGenderFemale;
        }
        
    }
    return self;
}

@end
