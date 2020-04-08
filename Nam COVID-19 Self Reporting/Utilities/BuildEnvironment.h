//
//  BuildEnvironment.h
//
//  Created by azavatone on 3/25/19.
//  Copyright © 2019 Alex Zavatone. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BuildEnvironment : NSObject

/* Usage
    BOOL isBuildEnvironment;
    isBuildEnvironment = [BuildEnvironment isDebug];
    isBuildEnvironment = [BuildEnvironment isNotDebug];
    isBuildEnvironment = [BuildEnvironment isRelease];
    isBuildEnvironment = [BuildEnvironment isNotRelease];
    isBuildEnvironment = [BuildEnvironment isTest];
    isBuildEnvironment = [BuildEnvironment isNotTest];
    isBuildEnvironment = [BuildEnvironment isBuildConfig:@"Debug"];
    isBuildEnvironment = [BuildEnvironment isBuildConfig:@"debug"];
    isBuildEnvironment = [BuildEnvironment isBuildConfig:@"DEBUG"];
    isBuildEnvironment = [BuildEnvironment isBuildConfig:@"Release"];
    isBuildEnvironment = [BuildEnvironment isBuildConfig:@"Puppies"];
 
    NSString *buildEnvironment;
    buildEnvironment = (@"Build environment: %@", [BuildEnvironment buildEnvironment]);
*/

+ (instancetype)sharedInstance;
+ (NSString *)buildEnvironment;
+ (BOOL)keyExistsInInfoDictionary:(NSString *)objectForInfoDictionaryKey;
+ (BOOL)isDebug;
+ (BOOL)isNotDebug;
+ (BOOL)isRelease;
+ (BOOL)isNotRelease;
+ (BOOL)isTest;
+ (BOOL)isNotTest;
+ (BOOL)isBuildConfig:(NSString *)buildConfigToCheckFor;
+ (BOOL)isNotBuildConfig:(NSString *)buildConfigToCheckFor;

+ (NSString *)displayBuildConfig;
@end

NS_ASSUME_NONNULL_END
