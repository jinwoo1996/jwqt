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
#import "LDTableViewCell.h"

#import <Masonry/Masonry.h>
#import <sqlite3.h>

@interface LDRootViewController ()<LDCreateViewControllerDelegate>

@end
@implementation LDRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"USER INFO";
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonTapped)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    
    self.view.backgroundColor = [UIColor blueColor];
    
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"userInfo.sqlite3"];
    sqlite3 *database;
    if(sqlite3_open([filePath UTF8String], &database) != SQLITE_OK){
        sqlite3_close(database);
        NSLog(@"error");
    }else{
        char *sql = "CREATE TABLE IF NOT EXISTS userInfo(name text, address text, age int, gender text)";
        //char *sql = "drop table userInfo";
        if(sqlite3_exec(database, sql, nil, nil, nil) != SQLITE_OK){
            sqlite3_close(database);
            NSLog(@"create error");
        }
        sqlite3_stmt *selectStatement;
        char *selectSql = "SELECT * FROM userInfo";
        if(sqlite3_prepare_v2(database, selectSql, -1, &selectStatement, NULL) == SQLITE_OK){
            self.arr1 = [[NSMutableArray alloc] init];
            while(sqlite3_step(selectStatement) == SQLITE_ROW){
                NSString *name = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 0)];
                NSString *address = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 1)];
                int age = sqlite3_column_int(selectStatement, 2);
                NSString *gender = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 3)];
                NSNumber *ageNumber = [NSNumber numberWithInt:age];
                NSDictionary *userInfo = @{@"name" : name, @"address" : address, @"age" : ageNumber, @"gender" : gender};
                [self.arr1 addObject:userInfo];
            }
        }
    }
    self.defaultUser = self.arr1;
    self.arr = [[NSMutableArray alloc] init];
    for(NSDictionary *dic in self.defaultUser){
        self.userInfo = [[LDUser alloc] initWithDic:dic];
        [self.arr addObject:self.userInfo];
    }
    
    
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.table.tag = 10;
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.table registerClass:[LDTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.table.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.table];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    _table.frame = self.view.bounds;
}

-(void)addButtonTapped{
    LDCreateViewController *create = [[LDCreateViewController alloc] init];
    create.delegate = self;
    
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
    return self.arr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    LDUser *user = self.arr[indexPath.row];
    UITableViewCell *customCell = [[LDTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell" user:user];
    return customCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (void)createViewControllder:(LDCreateViewController *)viewController didCreateUser:(LDUser *)user{
    NSLog(@"%@", user);
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"userInfo.sqlite3"];
    sqlite3 *database;
    if(sqlite3_open([filePath UTF8String], &database) != SQLITE_OK){
        sqlite3_close(database);
        NSLog(@"error");
    }else{
        sqlite3_stmt *insertStatement;
        char *insertSql = "INSERT INTO userInfo (name, address, age, gender) VALUES (?, ?, ?, ?)";
        if(sqlite3_prepare_v2(database, insertSql, -1, &insertStatement, NULL) == SQLITE_OK){
            sqlite3_bind_text(insertStatement, 1, [user.name UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(insertStatement, 2, [user.address UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_int(insertStatement, 3, (int)user.age);
            NSString *genderString;
            if(user.gender == LDGenderMale){
                genderString = @"male";
            }else{
                genderString = @"female";
            }
            sqlite3_bind_text(insertStatement, 4, [genderString UTF8String], -1, SQLITE_TRANSIENT);
            if(sqlite3_step(insertStatement) != SQLITE_DONE){
                NSLog(@"에러");
            }
            [self.arr addObject:user];
            [self.table reloadData];
        }
    }
}
@end