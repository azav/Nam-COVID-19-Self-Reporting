//
//  BuildEnvironment.m
//
//  Created by azavatone on 3/25/19.
//  Copyright © 2019 Alex Zavatone. All rights reserved.
//

#import "BuildEnvironment.h"

@interface BuildEnvironment ()
@property (class, nonatomic, strong) NSString *buildConfig;
@end

@implementation BuildEnvironment

static NSString *_buildConfig = nil;

+ (instancetype)sharedInstance
{
    static BuildEnvironment *sharedInstance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        nil;
    }
    return self;
}

+ (void)setBuildConfig:(NSString *)newBuildConfigValue {
    if (newBuildConfigValue != _buildConfig) {
        _buildConfig = [newBuildConfigValue copy];
    }
}

// Getter, but not preferred accessor.
+ (NSString *)buildConfig {
    if (_buildConfig == nil) {
        [BuildEnvironment buildEnvironment];
    }
    
    return _buildConfig;
}

// Preferred accessor.
// AZ - Added error checking and reporting.
+ (NSString *)buildEnvironment
{
    // This relies on a key in the info.plist called @"Build config" that is set to $(CONFIGURATION).
    NSString *buildEnvironmentKey = @"Build config";
    NSString *errorMessage = @"Error: There must be a key in the info.plist called @\"Build config\" that is set to $(CONFIGURATION) for this to work.";
    if (_buildConfig == nil) {
        BOOL buildKeyExists = [self keyExistsInInfoDictionary: buildEnvironmentKey];
        if (buildKeyExists) {
            _buildConfig = [[NSBundle mainBundle] objectForInfoDictionaryKey:buildEnvironmentKey];
        } else {
            _buildConfig = errorMessage;
        }
        
    }
    return self.buildConfig;
}

+ (BOOL)keyExistsInInfoDictionary:(NSString *)objectForInfoDictionaryKey
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSArray *infoDictionaryKeys = [infoDictionary allKeys];
    BOOL keyExistsInDictionary = [infoDictionaryKeys containsObject:objectForInfoDictionaryKey];
    return keyExistsInDictionary;
}

+ (BOOL)isDebug
{
    BOOL myResult = [self.buildConfig isEqualToString:@"Debug"];
    return myResult;
}

+ (BOOL)isNotDebug
{
    BOOL myResult = ![BuildEnvironment isDebug];
    return myResult;
}

+ (BOOL)isRelease
{
    BOOL myResult = [self.buildConfig isEqualToString:@"Release"];
    return myResult;
}

+ (BOOL)isNotRelease
{
    BOOL myResult = ![BuildEnvironment isRelease];
    return myResult;
}

+ (BOOL)isTest
{
    BOOL myResult = [self.buildConfig isEqualToString:@"Test"];
    return myResult;
}

+ (BOOL)isNotTest
{
    BOOL myResult = ![BuildEnvironment isTest];
    return myResult;
}

// AZ These allow a developer to check for a name match on a build config
// and also allow us to check for any build config that may be added in the future.
+ (BOOL)isBuildConfig:(NSString *)buildConfigToCheckFor
{
    BOOL myResult = [[self.buildConfig lowercaseString] isEqualToString:[buildConfigToCheckFor lowercaseString]];
    return myResult;
}

+ (BOOL)isNotBuildConfig:(NSString *)buildConfigToCheckFor
{
    BOOL myResult = ![BuildEnvironment isBuildConfig:buildConfigToCheckFor];
    return myResult;
}

+ (NSString *)displayBuildConfig
{
    NSMutableString *buildConfig = [@"Build Configuration is: " mutableCopy];
    NSString *buildEnv = [self buildConfig];
    [buildConfig appendString:buildEnv];
    return buildConfig;
}
@end
