//
//  LDCustomDelegate.m
//  homework1025
//
//  Created by 지누 on 2015. 10. 28..
//  Copyright © 2015년 DarrenLine. All rights reserved.
//

#import "LDCustomDelegate.h"

@implementation LDCustomDelegate

@synthesize delegate;

-(void)processComplete{
    [[self delegate] ProcessSuccessful:YES];
    NSLog(@"asdf");
}
-(void)startSomeProcess{
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(processComplete) userInfo:nil repeats:YES];
    NSInteger a = 5;
    self.i += a;
}
@end
