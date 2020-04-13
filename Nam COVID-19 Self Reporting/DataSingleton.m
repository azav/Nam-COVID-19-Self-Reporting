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
    
    [self loadUsers];
    
    //    _users = [NSMutableArray arrayWithObjects: @"",
    //
    //                         nil];
    
    
    nil;
}



- (void)loadUsers
{
    NSString *fileName = @"PatientData";
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    
    NSString *fileExtension = @"plist";
    NSString *fullFileName = [NSString stringWithFormat:@"%@%@%@", fileName, @".", fileExtension];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePathInDocumentsFolder = [documentsPath stringByAppendingPathComponent:fullFileName];
    BOOL fileExistsInDocumentsFolder = [fileManager fileExistsAtPath:filePathInDocumentsFolder];
    
    if (! fileExistsInDocumentsFolder) {
        NSDictionary *user = [self createUser];
        _users = [NSMutableArray arrayWithObject: user];
        
        if (_users) {
            // write to documents folder
            BOOL success = [_users writeToFile:filePathInDocumentsFolder atomically:YES];
            // Set file properties if needed.
        }
    }
    
    _users = [[NSArray arrayWithContentsOfFile:filePathInDocumentsFolder] mutableCopy];
    
    
    nil;
}

- (void)clearUsers
{
    _users = nil;
    
    NSString *fileName = @"PatientData";
       NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
       
       NSString *fileExtension = @"plist";
       NSString *fullFileName = [NSString stringWithFormat:@"%@%@%@", fileName, @".", fileExtension];
       
       NSFileManager *fileManager = [NSFileManager defaultManager];
       NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
       NSString *filePathInDocumentsFolder = [documentsPath stringByAppendingPathComponent:fullFileName];
    
    BOOL success = [_users writeToFile:filePathInDocumentsFolder atomically:YES];
}

- (NSMutableDictionary *)createUser
{
    NSString *uniqueID = [[NSUUID UUID] UUIDString];
    
    BOOL isActivePatient = YES;
    NSMutableArray *diaryEntries = [NSMutableArray new];
    
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    [userInfo setObject:uniqueID forKey:@"patientID"];
    [userInfo setObject:@"" forKey:@"Facility"];
    [userInfo setObject:@"" forKey:@"First Name"];
    [userInfo setObject:@"" forKey:@"Last Name"];
    [userInfo setObject:[NSDictionary new] forKey:@"Email Addresses"];
    [userInfo setObject:[NSDictionary new] forKey:@"Phone Numbers"];
    [userInfo setObject:diaryEntries forKey:@"diaryEntries"];
    [userInfo setObject:[[NSDate date] description] forKey:@"Date Created"];
    [userInfo setObject:[NSNumber numberWithBool:isActivePatient] forKey:@"is Active Patient"];
    [userInfo setObject:@"" forKey:@"Date Observation Ended"];
    [userInfo setObject:@"" forKey:@"Patient State when Observation Ended"]; // Recovered, Deceased.
    
    return userInfo;
}



- (void)breakpoint
{
    nil;
}

@end
