//
//  LDUser.h
//  homework1025
//
//  Created by 지누 on 2015. 10. 25..
//  Copyright © 2015년 DarrenLine. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LDGender){
    LDGenderMale,
    LDGenderFemale
};

@interface LDUser : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *address;
@property (nonatomic) NSInteger age;
@property (nonatomic) LDGender gender;

-(instancetype)initWithDic:(NSDictionary *)dic;

@end
