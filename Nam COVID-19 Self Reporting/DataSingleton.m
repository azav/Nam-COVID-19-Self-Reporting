//
//  DataSingleton.m
//  HW T&L
//
//  Created by Alex Zavatone on 8/10/17.
//  Copyright © 2017 zav. All rights reserved.
//

#import "DataSingleton.h"
#import <UIKit/UIKit.h>

@interface DataSingleton ()

@end

@implementation DataSingleton

+ (instancetype)sharedInstance
{
    //    static DataSingleton *instance;
    static id instance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (id)init
{
    if (self = [super init]) {
        
        [self initData];
    }
    return self;
}

- (void)initData
{
    // load from store and instantiate if load fails
    _users = [NSMutableArray arrayWithObjects: @"",

                         nil];
    

    nil;
}


- (void)createUsers
{
    NSString *uniqueID = [[NSUUID UUID] UUIDString];
    
}



- (void)breakpoint
{
    nil;
}

@end
