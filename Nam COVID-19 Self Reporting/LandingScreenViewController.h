//
//  LandingScreenViewController.h
//  Nam COVID-19 Self Reporting
//
//  Created by Alex Zavatone on 4/5/20.
//  Copyright © 2020 me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeneralUtils.h"
#import "BuildEnvironment.h"

NS_ASSUME_NONNULL_BEGIN

@interface LandingScreenViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *versionAndBuild;
@property (nonatomic, strong) IBOutlet UILabel *buildEnvironment;

@end

NS_ASSUME_NONNULL_END
