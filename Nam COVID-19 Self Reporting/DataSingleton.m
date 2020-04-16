//
//  DataSingleton.m
//  HW T&L
//
//  Created by Alex Zavatone on 8/10/17.
//  Copyright © 2017 zav. All rights reserved.
//

#import "DataSingleton.h"
#import "SymptomQuestions.h"
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

- (BOOL)isUserRegistered:(NSString *)patientID
{
    return YES;
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
    NSLog(@"Path for user pList: %@", filePathInDocumentsFolder);
    BOOL fileExistsInDocumentsFolder = [fileManager fileExistsAtPath:filePathInDocumentsFolder];
    
    //
    if (! fileExistsInDocumentsFolder) {
        // This is temporary to make sure that data can be created and persisted.
        NSDictionary *user = [self createUser];
        
        _users = [NSMutableArray arrayWithObject: user];
        NSString *patientID = [user objectForKey:@"patientID"];
        [self completeUserSetupByPatientID:patientID];
        if (_users) {
            // write to documents folder
            BOOL success = [_users writeToFile:filePathInDocumentsFolder atomically:YES];
            // Set file properties if needed.
            if (!success) {
                NSLog(@"Error: data not written to %@.", filePathInDocumentsFolder);
            }
        }
        
        
    }
    
    _users = [[NSArray arrayWithContentsOfFile:filePathInDocumentsFolder] mutableCopy];
    NSString *patientID = @"5FB47DAF-32DE-47C8-B967-01FCAA8F2E47"; // [user objectForKey:@"PatientID"];
    [self completeUserSetupByPatientID:patientID];
    
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
    
    BOOL isActivePatient = NO;
    NSMutableArray *diaryEntries = [NSMutableArray new];
    
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    [userInfo setObject:uniqueID forKey:@"patientID"];
    [userInfo setObject:@"" forKey:@"Facility"];
    [userInfo setObject:@"" forKey:@"First Name"];
    [userInfo setObject:@"" forKey:@"Last Name"];
    [userInfo setObject:@"" forKey:@"Gender" ];
    [userInfo setObject:[NSDictionary new] forKey:@"Email Addresses"];
    [userInfo setObject:[NSDictionary new] forKey:@"Phone Numbers"];
    [userInfo setObject:diaryEntries forKey:@"diaryEntries"];
    [userInfo setObject:[[NSDate date] description] forKey:@"Date Created"];
    [userInfo setObject:[NSNumber numberWithBool:isActivePatient] forKey:@"is Active Patient"]; // Set to NO when patient is released and before patient is set up.
    [userInfo setObject:@"" forKey:@"Date Observation Ended"];
    [userInfo setObject:@"" forKey:@"Patient State when Observation Ended"]; // Recovered, Deceased.
    [userInfo setObject:[NSNumber numberWithBool:NO] forKey:@"Is User Setup Complete"];
    
    return userInfo;
}

- (void)completeUserSetupByPatientID:(NSString *)patientID
{
    NSMutableDictionary *user;
    user = [[self userRecordFromPatientID: patientID] mutableCopy];
    
    [user setObject:[NSNumber numberWithBool:YES] forKey:@"Is User Setup Complete"];
    [user setObject:[NSNumber numberWithBool:YES] forKey:@"is Active Patient"];
    nil;
}

- (NSDictionary *)userRecordFromPatientID:(NSString *)patientID
{
    NSDictionary *user;
    NSPredicate *userSearch = [NSPredicate predicateWithFormat: @"patientID == %@", patientID];
    NSArray *result = [self.users filteredArrayUsingPredicate:userSearch];
    user = [result firstObject];
    return user;
}

- (void)addNameForPatientID:(NSString *)patientID firstName:(NSString *)firstName lastName:(NSString *)lastName gender:(NSString *)gender
{
    NSMutableDictionary *user;
    user = [[self userRecordFromPatientID: patientID] mutableCopy];
    
    [user setObject:@"" forKey:@"First Name"];
    [user setObject:@"" forKey:@"Last Name"];
    [user setObject:@"" forKey:@"Gender" ];
    
    nil;
}

- (void)addFacilityNameForPatientID:(NSString *)patientID facilityName:(NSString *)facilityName
{
    NSMutableDictionary *user;
    user = [[self userRecordFromPatientID: patientID] mutableCopy];
    
    [user setObject:facilityName forKey:facilityName];
    
    nil;
}


- (void)breakpoint
{
    nil;
}

@end
