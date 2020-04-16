//
//  SymptomQuestions.h
//  Nam COVID-19 Self Reporting
//
//  Created by Alex Zavatone on 4/16/20.
//  Copyright © 2020 me. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SymptomQuestions : NSObject

@property (nonatomic, strong) NSArray *symptomQuestions;
@property (nonatomic, strong) NSDictionary *symptomQuestionIDs;
@property (nonatomic, strong) NSDictionary *symptomAnswerClasses;
@end

NS_ASSUME_NONNULL_END
