//
//  LDRootViewController.m
//  homework1025
//
//  Created by 지누 on 2015. 10. 25..
//  Copyright © 2015년 DarrenLine. All rights reserved.
//

#import "LDRootViewController.h"
#import "LDUser.h"
#import "LDDetailViewController.h"
#import "LDCreateViewController.h"

#import <Masonry/Masonry.h>

@interface LDRootViewController ()

@end
@implementation LDRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"USER INFO";
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonTapped)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    
    self.view.backgroundColor = [UIColor blueColor];
    
    NSArray *defaultUser = [self.class defaultDic];
    self.arr = [[NSMutableArray alloc] init];
    for(NSDictionary *dic in defaultUser){
        self.userInfo = [[LDUser alloc] initWithDic:dic];
        [self.arr addObject:self.userInfo];
    }
    
    
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.table.tag = 10;
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.table.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.table];
}
-(void)addButtonTapped{
    LDCreateViewController *create = [[LDCreateViewController alloc] initWithUser:_arr :_table];
    
    [self presentViewController:create animated:YES completion:nil];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LDUser *user = _arr[indexPath.row];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:user.name message:[NSString stringWithFormat:@"%@의 정보를 확인하시겠습니까?", user.name] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *yes = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        LDDetailViewController *detail = [[LDDetailViewController alloc] initWithDic:user];
        [self.navigationController pushViewController:detail animated:YES];
    }];
    UIAlertAction *no = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:yes];
    [alert addAction:no];
    [self presentViewController:alert animated:YES completion:nil];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%ld개", self.arr.count);
    return self.arr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@".");
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    LDUser *userName = self.arr[indexPath.row];
    cell.textLabel.text = userName.name;
    return cell;
}

+(NSArray *) defaultDic{
    return @[
             @{
                 @"name" : @"디누",
                 @"age" : @5,
                 @"address" : @"집",
                 @"gender" : @"male"
                 },
             @{
                 @"name" : @"뗜듕",
                 @"age" : @100,
                 @"address" : @"연신내",
                 @"gender" : @"female"
                 },
             @{
                 @"name" : @"쨩미니",
                 @"age" : @79,
                 @"address" : @"영등포",
                 @"gender" : @"female"
                 }
             ];
}
@end