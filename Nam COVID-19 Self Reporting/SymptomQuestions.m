//
//  SymptomQuestions.m
//  Nam COVID-19 Self Reporting
//
//  Created by Alex Zavatone on 4/16/20.
//  Copyright © 2020 me. All rights reserved.
//

#import "SymptomQuestions.h"

@implementation SymptomQuestions

- (instancetype)init
{
    self.symptomQuestions = [NSArray arrayWithObjects:
                             @"Do you feel like you have a fever?",
                             @"Do you have a runny nose?",
                             @"Are you finding it hard to breathe or have shortness of breath?",
                             @"Do you have a headache?",
                             @"Are you suffering from a persistant cough that won't go away?",
                             @"Do you feel fatigued throughout the day?",
                             @"Do you have a sore throat?",
                             @"Is there any health concern that you wish to tell us about?",
                             nil];
    
    // Define the id# for the questions in case we need to translate the questions into other languages.
    self.symptomQuestionIDs = [NSDictionary dictionaryWithObjectsAndKeys:
                               [NSNumber numberWithInt:0], @"Do you feel like you have a fever?",
                               [NSNumber numberWithInt:1], @"Do you have a runny nose?",
                               [NSNumber numberWithInt:2], @"Are you finding it hard to breathe or have shortness of breath?",
                               [NSNumber numberWithInt:3], @"Do you have a headache?",
                               [NSNumber numberWithInt:4], @"Are you suffering from a persistant cough that won't go away?",
                               [NSNumber numberWithInt:5], @"Do you feel fatigued throughout the day?",
                               [NSNumber numberWithInt:6], @"Do you have a sore throat?",
                               [NSNumber numberWithInt:7], @"Is there any health concern that you wish to tell us about?",
                               nil];
    
    self.symptomAnswerClasses = [NSDictionary dictionaryWithObjectsAndKeys:
                                 @"Do you feel like you have a fever?", @"BOOL",
                                 @"Do you have a runny nose?", @"BOOL",
                                 @"Are you finding it hard to breathe or have shortness of breath?", @"BOOL",
                                 @"Do you have a headache?", @"BOOL",
                                 @"Are you suffering from a persistant cough that won't go away?", @"BOOL",
                                 @"Do you feel fatigued throughout the day?", @"BOOL",
                                 @"Do you have a sore throat?", @"BOOL",
                                 @"Is there any health concern that you wish to tell us about?", @"NSString",
                                 nil];
    
    
    return self;
}

@end
