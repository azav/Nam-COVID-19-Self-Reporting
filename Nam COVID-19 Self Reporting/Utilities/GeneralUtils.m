//
//  GeneralUtils.m
//
//  Created by Alex Zavatone on 10/2/17.
//  Copyright © 2017 zav. All rights reserved.
//

#import "GeneralUtils.h"

@implementation GeneralUtils

// This is called upon to display the app version and automatically incrementing build number
// It is expected to be called in an about screen
// For non release builds, it is also called by the first viewController (landing page) after the app launch.
// The purpose of this is to display to people who are not the client that the app Version and build are what they expect

+ (NSString *)versionAndBuild
{
    // Edit these
    NSInteger buildNumberLength = 5;
    NSString *buildNumberPaddingCharacter = @"0";
    NSString *versionAndBuildNumberFormatString = @"Version# %@, Build# %@";
    // end of user defineable data
    
    NSDictionary *appInfoDictionary = [[NSBundle mainBundle] infoDictionary];
    
    // Uncomment out any of the lines below if needed or as needed.
    //NSString *appDisplayName = [appInfoDictionary objectForKey:@"CFBundleDisplayName"];
    //NSString *appDisplayName = [appInfoDictionary objectForKey:@"CFBundleExecutable"];
    NSString *version = [appInfoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSNumber *buildNumber = [NSNumber numberWithInteger:[[appInfoDictionary objectForKey:@"CFBundleVersion"] integerValue]];
    //NSString *buildNumberString = [appInfoDictionary objectForKey:@"CFBundleVersion"];
    
    // Formatting build number using stringWithFormat
    //NSString *paddedBuildNumber = [NSString stringWithFormat:@"%05d", [buildNumber intValue]];
    
    // Formatting build number using NSNumberFormatter
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    formatter.numberStyle = NSNumberFormatterNoStyle;
    [formatter setPaddingPosition:NSNumberFormatterPadBeforePrefix];
    [formatter setPaddingCharacter:buildNumberPaddingCharacter];
    [formatter setMinimumIntegerDigits:buildNumberLength];
    
    NSString *formattedBuildNumber = [formatter stringFromNumber: buildNumber];
    
    NSString *versionAndBuild = [NSString stringWithFormat:versionAndBuildNumberFormatString, version, formattedBuildNumber];
    
   // [[[GeneralUtils class] alloc] numberFormatting];
    return versionAndBuild;
}

// Sample of lead character padding with zereos for a string
// uses three approaches
// NSString stringWithFormat with NSNumber
// NSString stringWithFormat with NSDecimalNumber
// NSNumberFormatter
//
- (void)numberFormatting
{
    NSDictionary *appInfoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *buildNumberString = [appInfoDictionary objectForKey:@"CFBundleVersion"];
    
    // Formatting build number using stringWithFormat
    NSNumber *buildNumber = [NSNumber numberWithInteger:[[appInfoDictionary objectForKey:@"CFBundleVersion"] integerValue]];
    NSString *paddedBuildNumber = [NSString stringWithFormat:@"%05d", [buildNumber intValue]];
    
    // And again
    NSDecimalNumber *buildNumberAsNumber = [NSDecimalNumber decimalNumberWithString:buildNumberString];
    NSString *fmtStr = [NSString stringWithFormat:@"%05.0F", [buildNumberAsNumber doubleValue]];
    
    // Formatting build number using NSNumberFormatter
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    formatter.numberStyle = NSNumberFormatterNoStyle;
    [formatter setPaddingPosition:NSNumberFormatterPadBeforePrefix];
    [formatter setPaddingCharacter:@"0"];
    [formatter setMinimumIntegerDigits:5];
    
    NSString *formattedBuildNumber = [formatter stringFromNumber: buildNumber];
    
  
    
    nil;
}

@end
