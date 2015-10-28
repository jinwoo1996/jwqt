//
//  LDCustomDelegate.h
//  homework1025
//
//  Created by 지누 on 2015. 10. 28..
//  Copyright © 2015년 DarrenLine. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LDCustomDelegate <NSObject>

@required

-(void)ProcessSuccessful:(BOOL)success;

@end

@interface LDCustomDelegate : NSObject{
    id <LDCustomDelegate> delegate;
}

@property(retain) id delegate;
@property(nonatomic) NSInteger i;

-(void)startSomeProcess;
-(void)processComplete;

@end
