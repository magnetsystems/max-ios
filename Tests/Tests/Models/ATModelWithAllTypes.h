/*
 * Copyright (c) 2015 Magnet Systems, Inc.
 * All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you
 * may not use this file except in compliance with the License. You
 * may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
 * implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

@import MagnetMax;


#import "ATEnumAttribute.h"

@class ATSubModel;

@interface ATModelWithAllTypes : MMModel


@property (nonatomic, assign) int intAttribute;

@property (nonatomic, copy) NSDictionary *mapOfCharactersAttribute;

@property (nonatomic, assign) int integerAttribute;

@property (nonatomic, copy) NSArray *listOfModelsAttribute;

@property (nonatomic, copy) NSDictionary *mapOfBytesAttribute;

@property (nonatomic, copy) NSDictionary *mapOfBooleansAttribute;

@property (nonatomic, copy) NSDictionary *mapOfEnumsAttribute;

@property (nonatomic, assign) float floatAttribute;

@property (nonatomic, assign) double doubleAttribute;

@property (nonatomic, assign) unichar charAttribute;

@property (nonatomic, copy) NSString *stringAttribute;

@property (nonatomic, copy) NSArray *listOfFloatsAttribute;

@property (nonatomic, copy) NSDictionary *mapOfDoublesAttribute;

@property (nonatomic, copy) NSDictionary *mapOfIntegersAttribute;

@property (nonatomic, copy) NSArray *listOfBooleansAttribute;

@property (nonatomic, copy) NSDictionary *mapOfLongsAttribute;

@property (nonatomic, strong) ATSubModel *subModelAttribute;

@property (nonatomic, assign) short shortAttribute;

@property (nonatomic, copy) NSArray *listOfDoublesAttribute;

@property (nonatomic, copy) NSDictionary *mapOfModelsAttribute;

@property (nonatomic, assign) BOOL booleanAttribute;

@property (nonatomic, copy) NSArray *listOfCharactersAttribute;

@property (nonatomic, copy) NSArray *listOfShortsAttribute;

@property (nonatomic, copy) NSArray *listOfIntegersAttribute;

@property (nonatomic, assign) char byteAttribute;

@property (nonatomic, copy) NSArray *listOfBytesAttribute;

@property (nonatomic, copy) NSArray *listOfLongsAttribute;

@property (nonatomic, copy) NSDictionary *mapOfStringsAttribute;

@property (nonatomic, copy) NSDictionary *mapOfShortsAttribute;

@property (nonatomic, assign) long long longAttribute;

@property (nonatomic, assign) ATEnumAttribute  enumAttribute;

@property (nonatomic, copy) NSArray *listOfStringsAttribute;

@property (nonatomic, copy) NSDictionary *mapOfFloatsAttribute;

@property (nonatomic, copy) NSArray *listOfEnumsAttribute;

@end
