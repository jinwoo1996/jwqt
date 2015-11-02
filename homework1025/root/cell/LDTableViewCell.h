//
//  LDTableViewCell.h
//  homework1025
//
//  Created by 지누 on 2015. 11. 2..
//  Copyright © 2015년 DarrenLine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LDUser.h"

@class LDUser;
@interface LDTableViewCell : UITableViewCell

@property(strong, nonatomic) UILabel *nameLabel;
@property(strong, nonatomic) UILabel *addressLabel;
@property(strong, nonatomic) UILabel *ageLabel;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier user:(LDUser *)user;

@end
