//
//  LDCreateViewController.m
//  homework1025
//
//  Created by 지누 on 2015. 10. 25..
//  Copyright © 2015년 DarrenLine. All rights reserved.
//

#import "AppDelegate.h"
#import "LDRootViewController.h"
#import "LDCreateViewController.h"
#import "LDUser.h"

#import <sqlite3.h>

@interface LDCreateViewController ()

@end

@implementation LDCreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:self];
    
    self.view.backgroundColor = [UIColor whiteColor];
    navi.title = @"추가하기";
    
    _name = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 100, 50)];
    _email = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, 100, 50)];
    _age = [[UILabel alloc] initWithFrame:CGRectMake(10, 120, 100, 50)];
    _gender = [[UILabel alloc] initWithFrame:CGRectMake(10, 170, 100, 50)];
    
    UITextField *inputName = [[UITextField alloc] initWithFrame:CGRectMake(110, 30, 100, 30)];
    UITextField *inputEmail = [[UITextField alloc] initWithFrame:CGRectMake(110, 80, 250, 30)];
    UITextField *inputAge = [[UITextField alloc] initWithFrame:CGRectMake(110, 130, 100, 30)];
    inputName.tag = 1;
    inputEmail.tag = 2;
    inputAge.tag = 3;
    
    NSArray *genders = [[NSArray alloc] initWithObjects: @"male",
                        @"female", nil];
    _inputGender = [[UISegmentedControl alloc] initWithItems:genders];
    
    [_inputGender addTarget:self action:@selector(genderTapped) forControlEvents:UIControlEventValueChanged];
    
    
    UIButton *submit = [[UIButton alloc] initWithFrame:CGRectMake(0, 300, 100, 30)];
    UIButton *cancel = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 30)];
    
    submit.backgroundColor = [UIColor blueColor];
    cancel.backgroundColor = [UIColor redColor];
    
    [submit setTitle:@"완료" forState:UIControlStateNormal];
    [cancel setTitle:@"취소" forState:UIControlStateNormal];
    
    [submit addTarget:self action:@selector(submitBtnTapped) forControlEvents:UIControlEventTouchUpInside];
    [cancel addTarget:self action:@selector(cancelBtnTapped) forControlEvents:UIControlEventTouchUpInside];
    
    _inputGender.frame = CGRectMake(110, 180, 100, 30);
    inputName.delegate = self;
    inputEmail.delegate = self;
    inputAge.delegate = self;
    inputName.keyboardType = UIKeyboardTypeDefault;
    inputEmail.keyboardType = UIKeyboardTypeEmailAddress;
    inputAge.keyboardType = UIKeyboardTypeNumberPad;
    inputName.borderStyle = UITextBorderStyleRoundedRect;
    inputEmail.borderStyle = UITextBorderStyleRoundedRect;
    inputAge.borderStyle = UITextBorderStyleRoundedRect;
    _name.text = @"이름 : ";
    _email.text = @"이메일 : ";
    _age.text = @"나이 : ";
    _gender.text = @"성별 : ";
    
    [self.view addSubview:_name];
    [self.view addSubview:_email];
    [self.view addSubview:_age];
    [self.view addSubview:_gender];
    [self.view addSubview:inputName];
    [self.view addSubview:inputEmail];
    [self.view addSubview:inputAge];
    [self.view addSubview:_inputGender];
    [self.view addSubview:submit];
    [self.view addSubview:cancel];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
-(void)genderTapped{
    _genderValue = [_inputGender titleForSegmentAtIndex:[_inputGender selectedSegmentIndex]];
}
-(void)submitBtnTapped{
    [self.view endEditing:YES];
    if([_nameValue isEqualToString:@""] || [_emailValue isEqualToString:@""] || _ageValue.stringValue.length < 1 || [_genderValue isEqualToString:@""]){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Waring!" message:@"빈 칸을 입력해주세요." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
            NSDictionary *d = @{
                                @"name" : _nameValue,
                                @"address" : _emailValue,
                                @"age" : _ageValue,
                                @"gender" : _genderValue
                                };
            LDUser *asd = [[LDUser alloc] initWithDic:d];
            
            if([_delegate respondsToSelector:@selector(createViewControllder:didCreateUser:)]){
                [_delegate createViewControllder:self didCreateUser:asd];
            }
        }];
    }
}
-(void)cancelBtnTapped{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    if(textField.tag == 1){
        _nameValue = textField.text;
    }else if(textField.tag == 2){
        _emailValue = textField.text;
    }else if(textField.tag == 3){
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        _ageValue = [f numberFromString:textField.text];
    }
    return YES;
}

@end