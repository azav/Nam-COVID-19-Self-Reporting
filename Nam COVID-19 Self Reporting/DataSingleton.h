//
//  DataSingleton.h
//  Nam COVID-19 Self Reporting
//
//  Created by Alex Zavatone on 8/10/17.
//  Copyright © 2017 zav. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UITableView.h> // https://stackoverflow.com/a/36090550 There is an extension section at the bottom of UITableView.h (Line 383) which adds row and section properties for NSIndexPaths that are used in UITableViews.

@interface DataSingleton : NSObject

@property (nonatomic, strong) NSMutableArray *users;

+ (instancetype)sharedInstance;
- (void)createUsers;


- (void)breakpoint;
@end
