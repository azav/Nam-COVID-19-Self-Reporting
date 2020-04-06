//
//  LandingScreenViewController.m
//  Nam COVID-19 Self Reporting
//
//  Created by Alex Zavatone on 4/5/20.
//  Copyright © 2020 me. All rights reserved.
//

#import "LandingScreenViewController.h"

@interface LandingScreenViewController ()

@end

@implementation LandingScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initVersionAndBuildAndEnvironment];
}

- (void)initVersionAndBuildAndEnvironment
{
    self.versionAndBuild.text = [GeneralUtils versionAndBuild];
    self.versionAndBuild.textColor = [UIColor colorWithRed:.67 green:.67 blue:.67 alpha:1.0];
    [self.versionAndBuild setHidden:NO];
    
    // Hide the build info if the app is for release
    
    self.buildEnvironment.text = [BuildEnvironment buildEnvironment];
    
    if ([BuildEnvironment isDebug]) {
        nil;
    } else {
        self.versionAndBuild.textColor = [UIColor clearColor];
        [self.versionAndBuild setHidden:YES];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
