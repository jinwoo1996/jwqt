//
//  LDTableViewCell.m
//  homework1025
//
//  Created by 지누 on 2015. 11. 2..
//  Copyright © 2015년 DarrenLine. All rights reserved.
//

#import "LDTableViewCell.h"

@implementation LDTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier user:(LDUser *)user{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.contentView.bounds = CGRectMake(0, 0, self.contentView.bounds.size.width, 500);
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 300, 30)];
        _addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 300, 30)];
        _ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(265, 15, 100, 30)];
        _nameLabel.text = [NSString stringWithFormat:@"이름 : %@", user.name];
        _addressLabel.text = [NSString stringWithFormat:@"주소 : %@", user.address];
        _ageLabel.text = [NSString stringWithFormat:@"%ld살", user.age];
        _ageLabel.textAlignment = NSTextAlignmentRight;
        if(user.gender == LDGenderMale){
            self.contentView.backgroundColor = [UIColor blueColor];
        }else{
            self.contentView.backgroundColor = [UIColor redColor];
        }
        [self.contentView addSubview:_nameLabel];
        [self.contentView addSubview:_addressLabel];
        [self.contentView addSubview:_ageLabel];
    }
    return self;
}

@end
