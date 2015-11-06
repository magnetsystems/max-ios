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

#import "ATPrimitiveTypeService.h"
#import "ATModelWithAllTypes.h"

@implementation ATPrimitiveTypeService

+ (NSDictionary *)metaData {
    static NSDictionary *__metaData = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSMutableDictionary *serviceMetaData = [NSMutableDictionary dictionary];


        // schema for service method returnMapOfIntegers:success:failure:
        MMServiceMethod *returnMapOfIntegersSuccessFailure = [[MMServiceMethod alloc] init];
        returnMapOfIntegersSuccessFailure.path = @"primitive-type-service/returnMapOfIntegers";
        returnMapOfIntegersSuccessFailure.requestMethod = MMRequestMethodPOST;

        NSMutableArray *returnMapOfIntegersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnMapOfIntegersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnMapOfIntegersSuccessFailureParam0.name = @"body";
        returnMapOfIntegersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnMapOfIntegersSuccessFailureParam0.type = MMServiceIOTypeDictionary;
        returnMapOfIntegersSuccessFailureParam0.componentType = MMServiceIOTypeInteger;
        returnMapOfIntegersSuccessFailureParam0.isOptional = NO;
        [returnMapOfIntegersSuccessFailureParams addObject:returnMapOfIntegersSuccessFailureParam0];

        returnMapOfIntegersSuccessFailure.parameters = returnMapOfIntegersSuccessFailureParams;
        returnMapOfIntegersSuccessFailure.returnType = MMServiceIOTypeDictionary;
        returnMapOfIntegersSuccessFailure.returnComponentType = MMServiceIOTypeInteger;
        serviceMetaData[NSStringFromSelector(@selector(returnMapOfIntegers:success:failure:))] = returnMapOfIntegersSuccessFailure;

        // schema for service method returnMapOfCharacters:success:failure:
        MMServiceMethod *returnMapOfCharactersSuccessFailure = [[MMServiceMethod alloc] init];
        returnMapOfCharactersSuccessFailure.path = @"primitive-type-service/returnMapOfCharacters";
        returnMapOfCharactersSuccessFailure.requestMethod = MMRequestMethodPOST;

        NSMutableArray *returnMapOfCharactersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnMapOfCharactersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnMapOfCharactersSuccessFailureParam0.name = @"body";
        returnMapOfCharactersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnMapOfCharactersSuccessFailureParam0.type = MMServiceIOTypeDictionary;
        returnMapOfCharactersSuccessFailureParam0.componentType = MMServiceIOTypeUnichar;
        returnMapOfCharactersSuccessFailureParam0.isOptional = NO;
        [returnMapOfCharactersSuccessFailureParams addObject:returnMapOfCharactersSuccessFailureParam0];

        returnMapOfCharactersSuccessFailure.parameters = returnMapOfCharactersSuccessFailureParams;
        returnMapOfCharactersSuccessFailure.returnType = MMServiceIOTypeDictionary;
        returnMapOfCharactersSuccessFailure.returnComponentType = MMServiceIOTypeUnichar;
        serviceMetaData[NSStringFromSelector(@selector(returnMapOfCharacters:success:failure:))] = returnMapOfCharactersSuccessFailure;

        // schema for service method returnListOfBooleans:success:failure:
        MMServiceMethod *returnListOfBooleansSuccessFailure = [[MMServiceMethod alloc] init];
        returnListOfBooleansSuccessFailure.path = @"primitive-type-service/returnListOfBooleans";
        returnListOfBooleansSuccessFailure.requestMethod = MMRequestMethodPOST;

        NSMutableArray *returnListOfBooleansSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnListOfBooleansSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnListOfBooleansSuccessFailureParam0.name = @"body";
        returnListOfBooleansSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnListOfBooleansSuccessFailureParam0.type = MMServiceIOTypeArray;
        returnListOfBooleansSuccessFailureParam0.componentType = MMServiceIOTypeBoolean;
        returnListOfBooleansSuccessFailureParam0.isOptional = NO;
        [returnListOfBooleansSuccessFailureParams addObject:returnListOfBooleansSuccessFailureParam0];

        returnListOfBooleansSuccessFailure.parameters = returnListOfBooleansSuccessFailureParams;
        returnListOfBooleansSuccessFailure.returnType = MMServiceIOTypeArray;
        returnListOfBooleansSuccessFailure.returnComponentType = MMServiceIOTypeBoolean;
        serviceMetaData[NSStringFromSelector(@selector(returnListOfBooleans:success:failure:))] = returnListOfBooleansSuccessFailure;

        // schema for service method returnShortWithFormParameters:success:failure:
        MMServiceMethod *returnShortWithFormParametersSuccessFailure = [[MMServiceMethod alloc] init];
        returnShortWithFormParametersSuccessFailure.clazz = [self class];
        returnShortWithFormParametersSuccessFailure.selector = @selector(returnShortWithFormParameters:success:failure:);
        returnShortWithFormParametersSuccessFailure.path = @"primitive-type-service/returnShort";
        returnShortWithFormParametersSuccessFailure.requestMethod = MMRequestMethodPOST;
        returnShortWithFormParametersSuccessFailure.consumes = [NSSet setWithObjects:@"application/x-www-form-urlencoded", nil];

        NSMutableArray *returnShortWithFormParametersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnShortWithFormParametersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnShortWithFormParametersSuccessFailureParam0.name = @"input";
        returnShortWithFormParametersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeForm;
        returnShortWithFormParametersSuccessFailureParam0.type = MMServiceIOTypeShort;
        returnShortWithFormParametersSuccessFailureParam0.isOptional = NO;
        [returnShortWithFormParametersSuccessFailureParams addObject:returnShortWithFormParametersSuccessFailureParam0];

        returnShortWithFormParametersSuccessFailure.parameters = returnShortWithFormParametersSuccessFailureParams;
        returnShortWithFormParametersSuccessFailure.returnType = MMServiceIOTypeShort;
        serviceMetaData[NSStringFromSelector(returnShortWithFormParametersSuccessFailure.selector)] = returnShortWithFormParametersSuccessFailure;

        // schema for service method returnShortWithBodyParameters:success:failure:
        MMServiceMethod *returnShortWithBodyParametersSuccessFailure = [[MMServiceMethod alloc] init];
        returnShortWithBodyParametersSuccessFailure.path = @"primitive-type-service/returnShort";
        returnShortWithBodyParametersSuccessFailure.requestMethod = MMRequestMethodPUT;

        NSMutableArray *returnShortWithBodyParametersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnShortWithBodyParametersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnShortWithBodyParametersSuccessFailureParam0.name = @"body";
        returnShortWithBodyParametersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnShortWithBodyParametersSuccessFailureParam0.type = MMServiceIOTypeShort;
        returnShortWithBodyParametersSuccessFailureParam0.isOptional = NO;
        [returnShortWithBodyParametersSuccessFailureParams addObject:returnShortWithBodyParametersSuccessFailureParam0];

        returnShortWithBodyParametersSuccessFailure.parameters = returnShortWithBodyParametersSuccessFailureParams;
        returnShortWithBodyParametersSuccessFailure.returnType = MMServiceIOTypeShort;
        serviceMetaData[NSStringFromSelector(@selector(returnShortWithBodyParameters:success:failure:))] = returnShortWithBodyParametersSuccessFailure;

        // schema for service method returnShort:success:failure:
        MMServiceMethod *returnShortSuccessFailure = [[MMServiceMethod alloc] init];
        returnShortSuccessFailure.clazz = [self class];
        returnShortSuccessFailure.selector = @selector(returnShort:success:failure:);
        returnShortSuccessFailure.path = @"primitive-type-service/returnShort";
        returnShortSuccessFailure.requestMethod = MMRequestMethodGET;

        NSMutableArray *returnShortSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnShortSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnShortSuccessFailureParam0.name = @"input";
        returnShortSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeQuery;
        returnShortSuccessFailureParam0.type = MMServiceIOTypeShort;
        returnShortSuccessFailureParam0.isOptional = NO;
        [returnShortSuccessFailureParams addObject:returnShortSuccessFailureParam0];

        returnShortSuccessFailure.parameters = returnShortSuccessFailureParams;
        returnShortSuccessFailure.returnType = MMServiceIOTypeShort;
        serviceMetaData[NSStringFromSelector(@selector(returnShort:success:failure:))] = returnShortSuccessFailure;

        // schema for service method returnListOfBytes:success:failure:
        MMServiceMethod *returnListOfBytesSuccessFailure = [[MMServiceMethod alloc] init];
        returnListOfBytesSuccessFailure.path = @"primitive-type-service/returnListOfBytes";
        returnListOfBytesSuccessFailure.requestMethod = MMRequestMethodPOST;

        NSMutableArray *returnListOfBytesSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnListOfBytesSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnListOfBytesSuccessFailureParam0.name = @"body";
        returnListOfBytesSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnListOfBytesSuccessFailureParam0.type = MMServiceIOTypeArray;
        returnListOfBytesSuccessFailureParam0.componentType = MMServiceIOTypeChar;
        returnListOfBytesSuccessFailureParam0.isOptional = NO;
        [returnListOfBytesSuccessFailureParams addObject:returnListOfBytesSuccessFailureParam0];

        returnListOfBytesSuccessFailure.parameters = returnListOfBytesSuccessFailureParams;
        returnListOfBytesSuccessFailure.returnType = MMServiceIOTypeArray;
        returnListOfBytesSuccessFailure.returnComponentType = MMServiceIOTypeChar;
        serviceMetaData[NSStringFromSelector(@selector(returnListOfBytes:success:failure:))] = returnListOfBytesSuccessFailure;

        // schema for service method returnListOfLongs:success:failure:
        MMServiceMethod *returnListOfLongsSuccessFailure = [[MMServiceMethod alloc] init];
        returnListOfLongsSuccessFailure.path = @"primitive-type-service/returnListOfLongs";
        returnListOfLongsSuccessFailure.requestMethod = MMRequestMethodPOST;

        NSMutableArray *returnListOfLongsSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnListOfLongsSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnListOfLongsSuccessFailureParam0.name = @"body";
        returnListOfLongsSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnListOfLongsSuccessFailureParam0.type = MMServiceIOTypeArray;
        returnListOfLongsSuccessFailureParam0.componentType = MMServiceIOTypeLongLong;
        returnListOfLongsSuccessFailureParam0.isOptional = NO;
        [returnListOfLongsSuccessFailureParams addObject:returnListOfLongsSuccessFailureParam0];

        returnListOfLongsSuccessFailure.parameters = returnListOfLongsSuccessFailureParams;
        returnListOfLongsSuccessFailure.returnType = MMServiceIOTypeArray;
        returnListOfLongsSuccessFailure.returnComponentType = MMServiceIOTypeLongLong;
        serviceMetaData[NSStringFromSelector(@selector(returnListOfLongs:success:failure:))] = returnListOfLongsSuccessFailure;

        // schema for service method returnStringWithFormParameters:success:failure:
        MMServiceMethod *returnStringWithFormParametersSuccessFailure = [[MMServiceMethod alloc] init];
        returnStringWithFormParametersSuccessFailure.path = @"primitive-type-service/returnString";
        returnStringWithFormParametersSuccessFailure.requestMethod = MMRequestMethodPOST;
        returnStringWithFormParametersSuccessFailure.consumes = [NSSet setWithObjects:@"application/x-www-form-urlencoded", nil];

        NSMutableArray *returnStringWithFormParametersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnStringWithFormParametersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnStringWithFormParametersSuccessFailureParam0.name = @"input";
        returnStringWithFormParametersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeForm;
        returnStringWithFormParametersSuccessFailureParam0.type = MMServiceIOTypeString;
        returnStringWithFormParametersSuccessFailureParam0.isOptional = NO;
        [returnStringWithFormParametersSuccessFailureParams addObject:returnStringWithFormParametersSuccessFailureParam0];

        returnStringWithFormParametersSuccessFailure.parameters = returnStringWithFormParametersSuccessFailureParams;
        returnStringWithFormParametersSuccessFailure.returnType = MMServiceIOTypeString;
        serviceMetaData[NSStringFromSelector(@selector(returnStringWithFormParameters:success:failure:))] = returnStringWithFormParametersSuccessFailure;

        // schema for service method returnStringWithBodyParameters:success:failure:
        MMServiceMethod *returnStringWithBodyParametersSuccessFailure = [[MMServiceMethod alloc] init];
        returnStringWithBodyParametersSuccessFailure.path = @"primitive-type-service/returnString";
        returnStringWithBodyParametersSuccessFailure.requestMethod = MMRequestMethodPUT;

        NSMutableArray *returnStringWithBodyParametersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnStringWithBodyParametersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnStringWithBodyParametersSuccessFailureParam0.name = @"body";
        returnStringWithBodyParametersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnStringWithBodyParametersSuccessFailureParam0.type = MMServiceIOTypeString;
        returnStringWithBodyParametersSuccessFailureParam0.isOptional = NO;
        [returnStringWithBodyParametersSuccessFailureParams addObject:returnStringWithBodyParametersSuccessFailureParam0];

        returnStringWithBodyParametersSuccessFailure.parameters = returnStringWithBodyParametersSuccessFailureParams;
        returnStringWithBodyParametersSuccessFailure.returnType = MMServiceIOTypeString;
        serviceMetaData[NSStringFromSelector(@selector(returnStringWithBodyParameters:success:failure:))] = returnStringWithBodyParametersSuccessFailure;

        // schema for service method returnString:success:failure:
        MMServiceMethod *returnStringSuccessFailure = [[MMServiceMethod alloc] init];
        returnStringSuccessFailure.path = @"primitive-type-service/returnString";
        returnStringSuccessFailure.requestMethod = MMRequestMethodGET;

        NSMutableArray *returnStringSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnStringSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnStringSuccessFailureParam0.name = @"input";
        returnStringSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeQuery;
        returnStringSuccessFailureParam0.type = MMServiceIOTypeString;
        returnStringSuccessFailureParam0.isOptional = NO;
        [returnStringSuccessFailureParams addObject:returnStringSuccessFailureParam0];

        returnStringSuccessFailure.parameters = returnStringSuccessFailureParams;
        returnStringSuccessFailure.returnType = MMServiceIOTypeString;
        serviceMetaData[NSStringFromSelector(@selector(returnString:success:failure:))] = returnStringSuccessFailure;

        // schema for service method returnMapOfBooleans:success:failure:
        MMServiceMethod *returnMapOfBooleansSuccessFailure = [[MMServiceMethod alloc] init];
        returnMapOfBooleansSuccessFailure.path = @"primitive-type-service/returnMapOfBooleans";
        returnMapOfBooleansSuccessFailure.requestMethod = MMRequestMethodPOST;

        NSMutableArray *returnMapOfBooleansSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnMapOfBooleansSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnMapOfBooleansSuccessFailureParam0.name = @"body";
        returnMapOfBooleansSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnMapOfBooleansSuccessFailureParam0.type = MMServiceIOTypeDictionary;
        returnMapOfBooleansSuccessFailureParam0.componentType = MMServiceIOTypeBoolean;
        returnMapOfBooleansSuccessFailureParam0.isOptional = NO;
        [returnMapOfBooleansSuccessFailureParams addObject:returnMapOfBooleansSuccessFailureParam0];

        returnMapOfBooleansSuccessFailure.parameters = returnMapOfBooleansSuccessFailureParams;
        returnMapOfBooleansSuccessFailure.returnType = MMServiceIOTypeDictionary;
        returnMapOfBooleansSuccessFailure.returnComponentType = MMServiceIOTypeBoolean;
        serviceMetaData[NSStringFromSelector(@selector(returnMapOfBooleans:success:failure:))] = returnMapOfBooleansSuccessFailure;

        // schema for service method returnListOfEnums:success:failure:
        MMServiceMethod *returnListOfEnumsSuccessFailure = [[MMServiceMethod alloc] init];
        returnListOfEnumsSuccessFailure.path = @"primitive-type-service/returnListOfEnums";
        returnListOfEnumsSuccessFailure.requestMethod = MMRequestMethodPOST;

        NSMutableArray *returnListOfEnumsSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnListOfEnumsSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnListOfEnumsSuccessFailureParam0.name = @"body";
        returnListOfEnumsSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnListOfEnumsSuccessFailureParam0.type = MMServiceIOTypeArray;
        returnListOfEnumsSuccessFailureParam0.componentType = MMServiceIOTypeEnum;
        returnListOfEnumsSuccessFailureParam0.typeClass = ATEnumAttributeContainer.class;
        returnListOfEnumsSuccessFailureParam0.isOptional = NO;
        [returnListOfEnumsSuccessFailureParams addObject:returnListOfEnumsSuccessFailureParam0];

        returnListOfEnumsSuccessFailure.parameters = returnListOfEnumsSuccessFailureParams;
        returnListOfEnumsSuccessFailure.returnType = MMServiceIOTypeArray;
        returnListOfEnumsSuccessFailure.returnComponentType = MMServiceIOTypeEnum;
        returnListOfEnumsSuccessFailure.returnTypeClass = ATEnumAttributeContainer.class;
        serviceMetaData[NSStringFromSelector(@selector(returnListOfEnums:success:failure:))] = returnListOfEnumsSuccessFailure;

        // schema for service method returnEnumWithFormParameters:success:failure:
        MMServiceMethod *returnEnumWithFormParametersSuccessFailure = [[MMServiceMethod alloc] init];
        returnEnumWithFormParametersSuccessFailure.path = @"primitive-type-service/returnEnum";
        returnEnumWithFormParametersSuccessFailure.requestMethod = MMRequestMethodPOST;
        returnEnumWithFormParametersSuccessFailure.consumes = [NSSet setWithObjects:@"application/x-www-form-urlencoded", nil];

        NSMutableArray *returnEnumWithFormParametersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnEnumWithFormParametersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnEnumWithFormParametersSuccessFailureParam0.name = @"input";
        returnEnumWithFormParametersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeForm;
        returnEnumWithFormParametersSuccessFailureParam0.type = MMServiceIOTypeEnum;
        returnEnumWithFormParametersSuccessFailureParam0.typeClass = ATEnumAttributeContainer.class;
        returnEnumWithFormParametersSuccessFailureParam0.isOptional = NO;
        [returnEnumWithFormParametersSuccessFailureParams addObject:returnEnumWithFormParametersSuccessFailureParam0];

        returnEnumWithFormParametersSuccessFailure.parameters = returnEnumWithFormParametersSuccessFailureParams;
        returnEnumWithFormParametersSuccessFailure.returnType = MMServiceIOTypeEnum;
        returnEnumWithFormParametersSuccessFailure.returnTypeClass = ATEnumAttributeContainer.class;
        serviceMetaData[NSStringFromSelector(@selector(returnEnumWithFormParameters:success:failure:))] = returnEnumWithFormParametersSuccessFailure;

        // schema for service method returnEnumWithBodyParameters:success:failure:
        MMServiceMethod *returnEnumWithBodyParametersSuccessFailure = [[MMServiceMethod alloc] init];
        returnEnumWithBodyParametersSuccessFailure.path = @"primitive-type-service/returnEnum";
        returnEnumWithBodyParametersSuccessFailure.requestMethod = MMRequestMethodPUT;

        NSMutableArray *returnEnumWithBodyParametersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnEnumWithBodyParametersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnEnumWithBodyParametersSuccessFailureParam0.name = @"body";
        returnEnumWithBodyParametersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnEnumWithBodyParametersSuccessFailureParam0.type = MMServiceIOTypeEnum;
        returnEnumWithBodyParametersSuccessFailureParam0.typeClass = ATEnumAttributeContainer.class;
        returnEnumWithBodyParametersSuccessFailureParam0.isOptional = NO;
        [returnEnumWithBodyParametersSuccessFailureParams addObject:returnEnumWithBodyParametersSuccessFailureParam0];

        returnEnumWithBodyParametersSuccessFailure.parameters = returnEnumWithBodyParametersSuccessFailureParams;
        returnEnumWithBodyParametersSuccessFailure.returnType = MMServiceIOTypeEnum;
        returnEnumWithBodyParametersSuccessFailure.returnTypeClass = ATEnumAttributeContainer.class;
        serviceMetaData[NSStringFromSelector(@selector(returnEnumWithBodyParameters:success:failure:))] = returnEnumWithBodyParametersSuccessFailure;

        // schema for service method returnEnum:success:failure:
        MMServiceMethod *returnEnumSuccessFailure = [[MMServiceMethod alloc] init];
        returnEnumSuccessFailure.path = @"primitive-type-service/returnEnum";
        returnEnumSuccessFailure.requestMethod = MMRequestMethodGET;

        NSMutableArray *returnEnumSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnEnumSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnEnumSuccessFailureParam0.name = @"input";
        returnEnumSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeQuery;
        returnEnumSuccessFailureParam0.type = MMServiceIOTypeEnum;
        returnEnumSuccessFailureParam0.typeClass = ATEnumAttributeContainer.class;
        returnEnumSuccessFailureParam0.isOptional = NO;
        [returnEnumSuccessFailureParams addObject:returnEnumSuccessFailureParam0];

        returnEnumSuccessFailure.parameters = returnEnumSuccessFailureParams;
        returnEnumSuccessFailure.returnType = MMServiceIOTypeEnum;
        returnEnumSuccessFailure.returnTypeClass = ATEnumAttributeContainer.class;
        serviceMetaData[NSStringFromSelector(@selector(returnEnum:success:failure:))] = returnEnumSuccessFailure;

        // schema for service method returnMapOfDoubles:success:failure:
        MMServiceMethod *returnMapOfDoublesSuccessFailure = [[MMServiceMethod alloc] init];
        returnMapOfDoublesSuccessFailure.path = @"primitive-type-service/returnMapOfDoubles";
        returnMapOfDoublesSuccessFailure.requestMethod = MMRequestMethodPOST;

        NSMutableArray *returnMapOfDoublesSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnMapOfDoublesSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnMapOfDoublesSuccessFailureParam0.name = @"body";
        returnMapOfDoublesSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnMapOfDoublesSuccessFailureParam0.type = MMServiceIOTypeDictionary;
        returnMapOfDoublesSuccessFailureParam0.componentType = MMServiceIOTypeDouble;
        returnMapOfDoublesSuccessFailureParam0.isOptional = NO;
        [returnMapOfDoublesSuccessFailureParams addObject:returnMapOfDoublesSuccessFailureParam0];

        returnMapOfDoublesSuccessFailure.parameters = returnMapOfDoublesSuccessFailureParams;
        returnMapOfDoublesSuccessFailure.returnType = MMServiceIOTypeDictionary;
        returnMapOfDoublesSuccessFailure.returnComponentType = MMServiceIOTypeDouble;
        serviceMetaData[NSStringFromSelector(@selector(returnMapOfDoubles:success:failure:))] = returnMapOfDoublesSuccessFailure;

        // schema for service method returnMapOfModels:success:failure:
        MMServiceMethod *returnMapOfModelsSuccessFailure = [[MMServiceMethod alloc] init];
        returnMapOfModelsSuccessFailure.path = @"primitive-type-service/returnMapOfModels";
        returnMapOfModelsSuccessFailure.requestMethod = MMRequestMethodPOST;

        NSMutableArray *returnMapOfModelsSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnMapOfModelsSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnMapOfModelsSuccessFailureParam0.name = @"body";
        returnMapOfModelsSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnMapOfModelsSuccessFailureParam0.type = MMServiceIOTypeDictionary;
        returnMapOfModelsSuccessFailureParam0.componentType = MMServiceIOTypeMagnetNode;
        returnMapOfModelsSuccessFailureParam0.typeClass = ATModelWithAllTypes.class;
        returnMapOfModelsSuccessFailureParam0.isOptional = NO;
        [returnMapOfModelsSuccessFailureParams addObject:returnMapOfModelsSuccessFailureParam0];

        returnMapOfModelsSuccessFailure.parameters = returnMapOfModelsSuccessFailureParams;
        returnMapOfModelsSuccessFailure.returnType = MMServiceIOTypeDictionary;
        returnMapOfModelsSuccessFailure.returnComponentType = MMServiceIOTypeMagnetNode;
        returnMapOfModelsSuccessFailure.returnTypeClass = ATModelWithAllTypes.class;
        serviceMetaData[NSStringFromSelector(@selector(returnMapOfModels:success:failure:))] = returnMapOfModelsSuccessFailure;

        // schema for service method returnListOfFloats:success:failure:
        MMServiceMethod *returnListOfFloatsSuccessFailure = [[MMServiceMethod alloc] init];
        returnListOfFloatsSuccessFailure.path = @"primitive-type-service/returnListOfFloats";
        returnListOfFloatsSuccessFailure.requestMethod = MMRequestMethodPOST;

        NSMutableArray *returnListOfFloatsSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnListOfFloatsSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnListOfFloatsSuccessFailureParam0.name = @"body";
        returnListOfFloatsSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnListOfFloatsSuccessFailureParam0.type = MMServiceIOTypeArray;
        returnListOfFloatsSuccessFailureParam0.componentType = MMServiceIOTypeFloat;
        returnListOfFloatsSuccessFailureParam0.isOptional = NO;
        [returnListOfFloatsSuccessFailureParams addObject:returnListOfFloatsSuccessFailureParam0];

        returnListOfFloatsSuccessFailure.parameters = returnListOfFloatsSuccessFailureParams;
        returnListOfFloatsSuccessFailure.returnType = MMServiceIOTypeArray;
        returnListOfFloatsSuccessFailure.returnComponentType = MMServiceIOTypeFloat;
        serviceMetaData[NSStringFromSelector(@selector(returnListOfFloats:success:failure:))] = returnListOfFloatsSuccessFailure;

        // schema for service method returnListOfModels:success:failure:
        MMServiceMethod *returnListOfModelsSuccessFailure = [[MMServiceMethod alloc] init];
        returnListOfModelsSuccessFailure.path = @"primitive-type-service/returnListOfModels";
        returnListOfModelsSuccessFailure.requestMethod = MMRequestMethodPOST;

        NSMutableArray *returnListOfModelsSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnListOfModelsSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnListOfModelsSuccessFailureParam0.name = @"body";
        returnListOfModelsSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnListOfModelsSuccessFailureParam0.type = MMServiceIOTypeArray;
        returnListOfModelsSuccessFailureParam0.componentType = MMServiceIOTypeMagnetNode;
        returnListOfModelsSuccessFailureParam0.typeClass = ATModelWithAllTypes.class;
        returnListOfModelsSuccessFailureParam0.isOptional = NO;
        [returnListOfModelsSuccessFailureParams addObject:returnListOfModelsSuccessFailureParam0];

        returnListOfModelsSuccessFailure.parameters = returnListOfModelsSuccessFailureParams;
        returnListOfModelsSuccessFailure.returnType = MMServiceIOTypeArray;
        returnListOfModelsSuccessFailure.returnComponentType = MMServiceIOTypeMagnetNode;
        returnListOfModelsSuccessFailure.returnTypeClass = ATModelWithAllTypes.class;
        serviceMetaData[NSStringFromSelector(@selector(returnListOfModels:success:failure:))] = returnListOfModelsSuccessFailure;

        // schema for service method returnDateWithFormParameters:success:failure:
        MMServiceMethod *returnDateWithFormParametersSuccessFailure = [[MMServiceMethod alloc] init];
        returnDateWithFormParametersSuccessFailure.path = @"primitive-type-service/returnDate";
        returnDateWithFormParametersSuccessFailure.requestMethod = MMRequestMethodPOST;
        returnDateWithFormParametersSuccessFailure.consumes = [NSSet setWithObjects:@"application/x-www-form-urlencoded", nil];

        NSMutableArray *returnDateWithFormParametersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnDateWithFormParametersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnDateWithFormParametersSuccessFailureParam0.name = @"input";
        returnDateWithFormParametersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeForm;
        returnDateWithFormParametersSuccessFailureParam0.type = MMServiceIOTypeDate;
        returnDateWithFormParametersSuccessFailureParam0.isOptional = NO;
        [returnDateWithFormParametersSuccessFailureParams addObject:returnDateWithFormParametersSuccessFailureParam0];

        returnDateWithFormParametersSuccessFailure.parameters = returnDateWithFormParametersSuccessFailureParams;
        returnDateWithFormParametersSuccessFailure.returnType = MMServiceIOTypeDate;
        serviceMetaData[NSStringFromSelector(@selector(returnDateWithFormParameters:success:failure:))] = returnDateWithFormParametersSuccessFailure;

        // schema for service method returnDateWithBodyParameters:success:failure:
        MMServiceMethod *returnDateWithBodyParametersSuccessFailure = [[MMServiceMethod alloc] init];
        returnDateWithBodyParametersSuccessFailure.path = @"primitive-type-service/returnDate";
        returnDateWithBodyParametersSuccessFailure.requestMethod = MMRequestMethodPUT;

        NSMutableArray *returnDateWithBodyParametersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnDateWithBodyParametersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnDateWithBodyParametersSuccessFailureParam0.name = @"body";
        returnDateWithBodyParametersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnDateWithBodyParametersSuccessFailureParam0.type = MMServiceIOTypeDate;
        returnDateWithBodyParametersSuccessFailureParam0.isOptional = NO;
        [returnDateWithBodyParametersSuccessFailureParams addObject:returnDateWithBodyParametersSuccessFailureParam0];

        returnDateWithBodyParametersSuccessFailure.parameters = returnDateWithBodyParametersSuccessFailureParams;
        returnDateWithBodyParametersSuccessFailure.returnType = MMServiceIOTypeDate;
        serviceMetaData[NSStringFromSelector(@selector(returnDateWithBodyParameters:success:failure:))] = returnDateWithBodyParametersSuccessFailure;

        // schema for service method returnDate:success:failure:
        MMServiceMethod *returnDateSuccessFailure = [[MMServiceMethod alloc] init];
        returnDateSuccessFailure.path = @"primitive-type-service/returnDate";
        returnDateSuccessFailure.requestMethod = MMRequestMethodGET;

        NSMutableArray *returnDateSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnDateSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnDateSuccessFailureParam0.name = @"input";
        returnDateSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeQuery;
        returnDateSuccessFailureParam0.type = MMServiceIOTypeDate;
        returnDateSuccessFailureParam0.isOptional = NO;
        [returnDateSuccessFailureParams addObject:returnDateSuccessFailureParam0];

        returnDateSuccessFailure.parameters = returnDateSuccessFailureParams;
        returnDateSuccessFailure.returnType = MMServiceIOTypeDate;
        serviceMetaData[NSStringFromSelector(@selector(returnDate:success:failure:))] = returnDateSuccessFailure;

        // schema for service method returnMapOfStrings:success:failure:
        MMServiceMethod *returnMapOfStringsSuccessFailure = [[MMServiceMethod alloc] init];
        returnMapOfStringsSuccessFailure.path = @"primitive-type-service/returnMapOfStrings";
        returnMapOfStringsSuccessFailure.requestMethod = MMRequestMethodPOST;

        NSMutableArray *returnMapOfStringsSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnMapOfStringsSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnMapOfStringsSuccessFailureParam0.name = @"body";
        returnMapOfStringsSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnMapOfStringsSuccessFailureParam0.type = MMServiceIOTypeDictionary;
        returnMapOfStringsSuccessFailureParam0.componentType = MMServiceIOTypeString;
        returnMapOfStringsSuccessFailureParam0.isOptional = NO;
        [returnMapOfStringsSuccessFailureParams addObject:returnMapOfStringsSuccessFailureParam0];

        returnMapOfStringsSuccessFailure.parameters = returnMapOfStringsSuccessFailureParams;
        returnMapOfStringsSuccessFailure.returnType = MMServiceIOTypeDictionary;
        returnMapOfStringsSuccessFailure.returnComponentType = MMServiceIOTypeString;
        serviceMetaData[NSStringFromSelector(@selector(returnMapOfStrings:success:failure:))] = returnMapOfStringsSuccessFailure;

        // schema for service method returnModelWithAllTypes:success:failure:
        MMServiceMethod *returnModelWithAllTypesSuccessFailure = [[MMServiceMethod alloc] init];
        returnModelWithAllTypesSuccessFailure.path = @"primitive-type-service/returnModelWithAllTypes";
        returnModelWithAllTypesSuccessFailure.requestMethod = MMRequestMethodPOST;

        NSMutableArray *returnModelWithAllTypesSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnModelWithAllTypesSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnModelWithAllTypesSuccessFailureParam0.name = @"body";
        returnModelWithAllTypesSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnModelWithAllTypesSuccessFailureParam0.type = MMServiceIOTypeMagnetNode;
        returnModelWithAllTypesSuccessFailureParam0.typeClass = ATModelWithAllTypes.class;
        returnModelWithAllTypesSuccessFailureParam0.isOptional = NO;
        [returnModelWithAllTypesSuccessFailureParams addObject:returnModelWithAllTypesSuccessFailureParam0];

        returnModelWithAllTypesSuccessFailure.parameters = returnModelWithAllTypesSuccessFailureParams;
        returnModelWithAllTypesSuccessFailure.returnType = MMServiceIOTypeMagnetNode;
        returnModelWithAllTypesSuccessFailure.returnTypeClass = ATModelWithAllTypes.class;
        serviceMetaData[NSStringFromSelector(@selector(returnModelWithAllTypes:success:failure:))] = returnModelWithAllTypesSuccessFailure;

        // schema for service method returnCharWithFormParameters:success:failure:
        MMServiceMethod *returnCharWithFormParametersSuccessFailure = [[MMServiceMethod alloc] init];
        returnCharWithFormParametersSuccessFailure.path = @"primitive-type-service/returnChar";
        returnCharWithFormParametersSuccessFailure.requestMethod = MMRequestMethodPOST;
        returnCharWithFormParametersSuccessFailure.consumes = [NSSet setWithObjects:@"application/x-www-form-urlencoded", nil];

        NSMutableArray *returnCharWithFormParametersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnCharWithFormParametersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnCharWithFormParametersSuccessFailureParam0.name = @"input";
        returnCharWithFormParametersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeForm;
        returnCharWithFormParametersSuccessFailureParam0.type = MMServiceIOTypeUnichar;
        returnCharWithFormParametersSuccessFailureParam0.isOptional = NO;
        [returnCharWithFormParametersSuccessFailureParams addObject:returnCharWithFormParametersSuccessFailureParam0];

        returnCharWithFormParametersSuccessFailure.parameters = returnCharWithFormParametersSuccessFailureParams;
        returnCharWithFormParametersSuccessFailure.returnType = MMServiceIOTypeUnichar;
        serviceMetaData[NSStringFromSelector(@selector(returnCharWithFormParameters:success:failure:))] = returnCharWithFormParametersSuccessFailure;

        // schema for service method returnCharWithBodyParameters:success:failure:
        MMServiceMethod *returnCharWithBodyParametersSuccessFailure = [[MMServiceMethod alloc] init];
        returnCharWithBodyParametersSuccessFailure.path = @"primitive-type-service/returnChar";
        returnCharWithBodyParametersSuccessFailure.requestMethod = MMRequestMethodPUT;

        NSMutableArray *returnCharWithBodyParametersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnCharWithBodyParametersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnCharWithBodyParametersSuccessFailureParam0.name = @"body";
        returnCharWithBodyParametersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnCharWithBodyParametersSuccessFailureParam0.type = MMServiceIOTypeUnichar;
        returnCharWithBodyParametersSuccessFailureParam0.isOptional = NO;
        [returnCharWithBodyParametersSuccessFailureParams addObject:returnCharWithBodyParametersSuccessFailureParam0];

        returnCharWithBodyParametersSuccessFailure.parameters = returnCharWithBodyParametersSuccessFailureParams;
        returnCharWithBodyParametersSuccessFailure.returnType = MMServiceIOTypeUnichar;
        serviceMetaData[NSStringFromSelector(@selector(returnCharWithBodyParameters:success:failure:))] = returnCharWithBodyParametersSuccessFailure;

        // schema for service method returnChar:success:failure:
        MMServiceMethod *returnCharSuccessFailure = [[MMServiceMethod alloc] init];
        returnCharSuccessFailure.path = @"primitive-type-service/returnChar";
        returnCharSuccessFailure.requestMethod = MMRequestMethodGET;

        NSMutableArray *returnCharSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnCharSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnCharSuccessFailureParam0.name = @"input";
        returnCharSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeQuery;
        returnCharSuccessFailureParam0.type = MMServiceIOTypeUnichar;
        returnCharSuccessFailureParam0.isOptional = NO;
        [returnCharSuccessFailureParams addObject:returnCharSuccessFailureParam0];

        returnCharSuccessFailure.parameters = returnCharSuccessFailureParams;
        returnCharSuccessFailure.returnType = MMServiceIOTypeUnichar;
        serviceMetaData[NSStringFromSelector(@selector(returnChar:success:failure:))] = returnCharSuccessFailure;

        // schema for service method returnMapOfBytes:success:failure:
        MMServiceMethod *returnMapOfBytesSuccessFailure = [[MMServiceMethod alloc] init];
        returnMapOfBytesSuccessFailure.path = @"primitive-type-service/returnMapOfBytes";
        returnMapOfBytesSuccessFailure.requestMethod = MMRequestMethodPOST;

        NSMutableArray *returnMapOfBytesSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnMapOfBytesSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnMapOfBytesSuccessFailureParam0.name = @"body";
        returnMapOfBytesSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnMapOfBytesSuccessFailureParam0.type = MMServiceIOTypeDictionary;
        returnMapOfBytesSuccessFailureParam0.componentType = MMServiceIOTypeChar;
        returnMapOfBytesSuccessFailureParam0.isOptional = NO;
        [returnMapOfBytesSuccessFailureParams addObject:returnMapOfBytesSuccessFailureParam0];

        returnMapOfBytesSuccessFailure.parameters = returnMapOfBytesSuccessFailureParams;
        returnMapOfBytesSuccessFailure.returnType = MMServiceIOTypeDictionary;
        returnMapOfBytesSuccessFailure.returnComponentType = MMServiceIOTypeChar;
        serviceMetaData[NSStringFromSelector(@selector(returnMapOfBytes:success:failure:))] = returnMapOfBytesSuccessFailure;

        // schema for service method returnMapOfLongs:success:failure:
        MMServiceMethod *returnMapOfLongsSuccessFailure = [[MMServiceMethod alloc] init];
        returnMapOfLongsSuccessFailure.path = @"primitive-type-service/returnMapOfLongs";
        returnMapOfLongsSuccessFailure.requestMethod = MMRequestMethodPOST;

        NSMutableArray *returnMapOfLongsSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnMapOfLongsSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnMapOfLongsSuccessFailureParam0.name = @"body";
        returnMapOfLongsSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnMapOfLongsSuccessFailureParam0.type = MMServiceIOTypeDictionary;
        returnMapOfLongsSuccessFailureParam0.componentType = MMServiceIOTypeLongLong;
        returnMapOfLongsSuccessFailureParam0.isOptional = NO;
        [returnMapOfLongsSuccessFailureParams addObject:returnMapOfLongsSuccessFailureParam0];

        returnMapOfLongsSuccessFailure.parameters = returnMapOfLongsSuccessFailureParams;
        returnMapOfLongsSuccessFailure.returnType = MMServiceIOTypeDictionary;
        returnMapOfLongsSuccessFailure.returnComponentType = MMServiceIOTypeLongLong;
        serviceMetaData[NSStringFromSelector(@selector(returnMapOfLongs:success:failure:))] = returnMapOfLongsSuccessFailure;

        // schema for service method returnListOfCharacters:success:failure:
        MMServiceMethod *returnListOfCharactersSuccessFailure = [[MMServiceMethod alloc] init];
        returnListOfCharactersSuccessFailure.path = @"primitive-type-service/returnListOfCharacters";
        returnListOfCharactersSuccessFailure.requestMethod = MMRequestMethodPOST;

        NSMutableArray *returnListOfCharactersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnListOfCharactersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnListOfCharactersSuccessFailureParam0.name = @"body";
        returnListOfCharactersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnListOfCharactersSuccessFailureParam0.type = MMServiceIOTypeArray;
        returnListOfCharactersSuccessFailureParam0.componentType = MMServiceIOTypeUnichar;
        returnListOfCharactersSuccessFailureParam0.isOptional = NO;
        [returnListOfCharactersSuccessFailureParams addObject:returnListOfCharactersSuccessFailureParam0];

        returnListOfCharactersSuccessFailure.parameters = returnListOfCharactersSuccessFailureParams;
        returnListOfCharactersSuccessFailure.returnType = MMServiceIOTypeArray;
        returnListOfCharactersSuccessFailure.returnComponentType = MMServiceIOTypeUnichar;
        serviceMetaData[NSStringFromSelector(@selector(returnListOfCharacters:success:failure:))] = returnListOfCharactersSuccessFailure;

        // schema for service method returnDoubleWithFormParameters:success:failure:
        MMServiceMethod *returnDoubleWithFormParametersSuccessFailure = [[MMServiceMethod alloc] init];
        returnDoubleWithFormParametersSuccessFailure.path = @"primitive-type-service/returnDouble";
        returnDoubleWithFormParametersSuccessFailure.requestMethod = MMRequestMethodPOST;
        returnDoubleWithFormParametersSuccessFailure.consumes = [NSSet setWithObjects:@"application/x-www-form-urlencoded", nil];

        NSMutableArray *returnDoubleWithFormParametersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnDoubleWithFormParametersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnDoubleWithFormParametersSuccessFailureParam0.name = @"input";
        returnDoubleWithFormParametersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeForm;
        returnDoubleWithFormParametersSuccessFailureParam0.type = MMServiceIOTypeDouble;
        returnDoubleWithFormParametersSuccessFailureParam0.isOptional = NO;
        [returnDoubleWithFormParametersSuccessFailureParams addObject:returnDoubleWithFormParametersSuccessFailureParam0];

        returnDoubleWithFormParametersSuccessFailure.parameters = returnDoubleWithFormParametersSuccessFailureParams;
        returnDoubleWithFormParametersSuccessFailure.returnType = MMServiceIOTypeDouble;
        serviceMetaData[NSStringFromSelector(@selector(returnDoubleWithFormParameters:success:failure:))] = returnDoubleWithFormParametersSuccessFailure;

        // schema for service method returnDoubleWithBodyParameters:success:failure:
        MMServiceMethod *returnDoubleWithBodyParametersSuccessFailure = [[MMServiceMethod alloc] init];
        returnDoubleWithBodyParametersSuccessFailure.path = @"primitive-type-service/returnDouble";
        returnDoubleWithBodyParametersSuccessFailure.requestMethod = MMRequestMethodPUT;

        NSMutableArray *returnDoubleWithBodyParametersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnDoubleWithBodyParametersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnDoubleWithBodyParametersSuccessFailureParam0.name = @"body";
        returnDoubleWithBodyParametersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnDoubleWithBodyParametersSuccessFailureParam0.type = MMServiceIOTypeDouble;
        returnDoubleWithBodyParametersSuccessFailureParam0.isOptional = NO;
        [returnDoubleWithBodyParametersSuccessFailureParams addObject:returnDoubleWithBodyParametersSuccessFailureParam0];

        returnDoubleWithBodyParametersSuccessFailure.parameters = returnDoubleWithBodyParametersSuccessFailureParams;
        returnDoubleWithBodyParametersSuccessFailure.returnType = MMServiceIOTypeDouble;
        serviceMetaData[NSStringFromSelector(@selector(returnDoubleWithBodyParameters:success:failure:))] = returnDoubleWithBodyParametersSuccessFailure;

        // schema for service method returnDouble:success:failure:
        MMServiceMethod *returnDoubleSuccessFailure = [[MMServiceMethod alloc] init];
        returnDoubleSuccessFailure.path = @"primitive-type-service/returnDouble";
        returnDoubleSuccessFailure.requestMethod = MMRequestMethodGET;

        NSMutableArray *returnDoubleSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnDoubleSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnDoubleSuccessFailureParam0.name = @"input";
        returnDoubleSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeQuery;
        returnDoubleSuccessFailureParam0.type = MMServiceIOTypeDouble;
        returnDoubleSuccessFailureParam0.isOptional = NO;
        [returnDoubleSuccessFailureParams addObject:returnDoubleSuccessFailureParam0];

        returnDoubleSuccessFailure.parameters = returnDoubleSuccessFailureParams;
        returnDoubleSuccessFailure.returnType = MMServiceIOTypeDouble;
        serviceMetaData[NSStringFromSelector(@selector(returnDouble:success:failure:))] = returnDoubleSuccessFailure;

        // schema for service method returnIntWithFormParameters:success:failure:
        MMServiceMethod *returnIntWithFormParametersSuccessFailure = [[MMServiceMethod alloc] init];
        returnIntWithFormParametersSuccessFailure.path = @"primitive-type-service/returnInt";
        returnIntWithFormParametersSuccessFailure.requestMethod = MMRequestMethodPOST;
        returnIntWithFormParametersSuccessFailure.consumes = [NSSet setWithObjects:@"application/x-www-form-urlencoded", nil];

        NSMutableArray *returnIntWithFormParametersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnIntWithFormParametersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnIntWithFormParametersSuccessFailureParam0.name = @"input";
        returnIntWithFormParametersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeForm;
        returnIntWithFormParametersSuccessFailureParam0.type = MMServiceIOTypeInteger;
        returnIntWithFormParametersSuccessFailureParam0.isOptional = NO;
        [returnIntWithFormParametersSuccessFailureParams addObject:returnIntWithFormParametersSuccessFailureParam0];

        returnIntWithFormParametersSuccessFailure.parameters = returnIntWithFormParametersSuccessFailureParams;
        returnIntWithFormParametersSuccessFailure.returnType = MMServiceIOTypeInteger;
        serviceMetaData[NSStringFromSelector(@selector(returnIntWithFormParameters:success:failure:))] = returnIntWithFormParametersSuccessFailure;

        // schema for service method returnIntWithBodyParameters:success:failure:
        MMServiceMethod *returnIntWithBodyParametersSuccessFailure = [[MMServiceMethod alloc] init];
        returnIntWithBodyParametersSuccessFailure.path = @"primitive-type-service/returnInt";
        returnIntWithBodyParametersSuccessFailure.requestMethod = MMRequestMethodPUT;

        NSMutableArray *returnIntWithBodyParametersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnIntWithBodyParametersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnIntWithBodyParametersSuccessFailureParam0.name = @"body";
        returnIntWithBodyParametersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnIntWithBodyParametersSuccessFailureParam0.type = MMServiceIOTypeInteger;
        returnIntWithBodyParametersSuccessFailureParam0.isOptional = NO;
        [returnIntWithBodyParametersSuccessFailureParams addObject:returnIntWithBodyParametersSuccessFailureParam0];

        returnIntWithBodyParametersSuccessFailure.parameters = returnIntWithBodyParametersSuccessFailureParams;
        returnIntWithBodyParametersSuccessFailure.returnType = MMServiceIOTypeInteger;
        serviceMetaData[NSStringFromSelector(@selector(returnIntWithBodyParameters:success:failure:))] = returnIntWithBodyParametersSuccessFailure;

        // schema for service method returnInt:success:failure:
        MMServiceMethod *returnIntSuccessFailure = [[MMServiceMethod alloc] init];
        returnIntSuccessFailure.path = @"primitive-type-service/returnInt";
        returnIntSuccessFailure.requestMethod = MMRequestMethodGET;

        NSMutableArray *returnIntSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnIntSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnIntSuccessFailureParam0.name = @"input";
        returnIntSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeQuery;
        returnIntSuccessFailureParam0.type = MMServiceIOTypeInteger;
        returnIntSuccessFailureParam0.isOptional = NO;
        [returnIntSuccessFailureParams addObject:returnIntSuccessFailureParam0];

        returnIntSuccessFailure.parameters = returnIntSuccessFailureParams;
        returnIntSuccessFailure.returnType = MMServiceIOTypeInteger;
        serviceMetaData[NSStringFromSelector(@selector(returnInt:success:failure:))] = returnIntSuccessFailure;

        // schema for service method returnMapOfShorts:success:failure:
        MMServiceMethod *returnMapOfShortsSuccessFailure = [[MMServiceMethod alloc] init];
        returnMapOfShortsSuccessFailure.path = @"primitive-type-service/returnMapOfShorts";
        returnMapOfShortsSuccessFailure.requestMethod = MMRequestMethodPOST;

        NSMutableArray *returnMapOfShortsSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnMapOfShortsSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnMapOfShortsSuccessFailureParam0.name = @"body";
        returnMapOfShortsSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnMapOfShortsSuccessFailureParam0.type = MMServiceIOTypeDictionary;
        returnMapOfShortsSuccessFailureParam0.componentType = MMServiceIOTypeShort;
        returnMapOfShortsSuccessFailureParam0.isOptional = NO;
        [returnMapOfShortsSuccessFailureParams addObject:returnMapOfShortsSuccessFailureParam0];

        returnMapOfShortsSuccessFailure.parameters = returnMapOfShortsSuccessFailureParams;
        returnMapOfShortsSuccessFailure.returnType = MMServiceIOTypeDictionary;
        returnMapOfShortsSuccessFailure.returnComponentType = MMServiceIOTypeShort;
        serviceMetaData[NSStringFromSelector(@selector(returnMapOfShorts:success:failure:))] = returnMapOfShortsSuccessFailure;

        // schema for service method returnListOfIntegers:success:failure:
        MMServiceMethod *returnListOfIntegersSuccessFailure = [[MMServiceMethod alloc] init];
        returnListOfIntegersSuccessFailure.path = @"primitive-type-service/returnListOfIntegers";
        returnListOfIntegersSuccessFailure.requestMethod = MMRequestMethodPOST;

        NSMutableArray *returnListOfIntegersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnListOfIntegersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnListOfIntegersSuccessFailureParam0.name = @"body";
        returnListOfIntegersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnListOfIntegersSuccessFailureParam0.type = MMServiceIOTypeArray;
        returnListOfIntegersSuccessFailureParam0.componentType = MMServiceIOTypeInteger;
        returnListOfIntegersSuccessFailureParam0.isOptional = NO;
        [returnListOfIntegersSuccessFailureParams addObject:returnListOfIntegersSuccessFailureParam0];

        returnListOfIntegersSuccessFailure.parameters = returnListOfIntegersSuccessFailureParams;
        returnListOfIntegersSuccessFailure.returnType = MMServiceIOTypeArray;
        returnListOfIntegersSuccessFailure.returnComponentType = MMServiceIOTypeInteger;
        serviceMetaData[NSStringFromSelector(@selector(returnListOfIntegers:success:failure:))] = returnListOfIntegersSuccessFailure;

        // schema for service method returnByteWithFormParameters:success:failure:
        MMServiceMethod *returnByteWithFormParametersSuccessFailure = [[MMServiceMethod alloc] init];
        returnByteWithFormParametersSuccessFailure.path = @"primitive-type-service/returnByte";
        returnByteWithFormParametersSuccessFailure.requestMethod = MMRequestMethodPOST;
        returnByteWithFormParametersSuccessFailure.consumes = [NSSet setWithObjects:@"application/x-www-form-urlencoded", nil];

        NSMutableArray *returnByteWithFormParametersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnByteWithFormParametersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnByteWithFormParametersSuccessFailureParam0.name = @"input";
        returnByteWithFormParametersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeForm;
        returnByteWithFormParametersSuccessFailureParam0.type = MMServiceIOTypeChar;
        returnByteWithFormParametersSuccessFailureParam0.isOptional = NO;
        [returnByteWithFormParametersSuccessFailureParams addObject:returnByteWithFormParametersSuccessFailureParam0];

        returnByteWithFormParametersSuccessFailure.parameters = returnByteWithFormParametersSuccessFailureParams;
        returnByteWithFormParametersSuccessFailure.returnType = MMServiceIOTypeChar;
        serviceMetaData[NSStringFromSelector(@selector(returnByteWithFormParameters:success:failure:))] = returnByteWithFormParametersSuccessFailure;

        // schema for service method returnByteWithBodyParameters:success:failure:
        MMServiceMethod *returnByteWithBodyParametersSuccessFailure = [[MMServiceMethod alloc] init];
        returnByteWithBodyParametersSuccessFailure.path = @"primitive-type-service/returnByte";
        returnByteWithBodyParametersSuccessFailure.requestMethod = MMRequestMethodPUT;

        NSMutableArray *returnByteWithBodyParametersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnByteWithBodyParametersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnByteWithBodyParametersSuccessFailureParam0.name = @"body";
        returnByteWithBodyParametersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnByteWithBodyParametersSuccessFailureParam0.type = MMServiceIOTypeChar;
        returnByteWithBodyParametersSuccessFailureParam0.isOptional = NO;
        [returnByteWithBodyParametersSuccessFailureParams addObject:returnByteWithBodyParametersSuccessFailureParam0];

        returnByteWithBodyParametersSuccessFailure.parameters = returnByteWithBodyParametersSuccessFailureParams;
        returnByteWithBodyParametersSuccessFailure.returnType = MMServiceIOTypeChar;
        serviceMetaData[NSStringFromSelector(@selector(returnByteWithBodyParameters:success:failure:))] = returnByteWithBodyParametersSuccessFailure;

        // schema for service method returnByte:success:failure:
        MMServiceMethod *returnByteSuccessFailure = [[MMServiceMethod alloc] init];
        returnByteSuccessFailure.path = @"primitive-type-service/returnByte";
        returnByteSuccessFailure.requestMethod = MMRequestMethodGET;

        NSMutableArray *returnByteSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnByteSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnByteSuccessFailureParam0.name = @"input";
        returnByteSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeQuery;
        returnByteSuccessFailureParam0.type = MMServiceIOTypeChar;
        returnByteSuccessFailureParam0.isOptional = NO;
        [returnByteSuccessFailureParams addObject:returnByteSuccessFailureParam0];

        returnByteSuccessFailure.parameters = returnByteSuccessFailureParams;
        returnByteSuccessFailure.returnType = MMServiceIOTypeChar;
        serviceMetaData[NSStringFromSelector(@selector(returnByte:success:failure:))] = returnByteSuccessFailure;

        // schema for service method returnListOfDoubles:success:failure:
        MMServiceMethod *returnListOfDoublesSuccessFailure = [[MMServiceMethod alloc] init];
        returnListOfDoublesSuccessFailure.path = @"primitive-type-service/returnListOfDoubles";
        returnListOfDoublesSuccessFailure.requestMethod = MMRequestMethodPOST;

        NSMutableArray *returnListOfDoublesSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnListOfDoublesSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnListOfDoublesSuccessFailureParam0.name = @"body";
        returnListOfDoublesSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnListOfDoublesSuccessFailureParam0.type = MMServiceIOTypeArray;
        returnListOfDoublesSuccessFailureParam0.componentType = MMServiceIOTypeDouble;
        returnListOfDoublesSuccessFailureParam0.isOptional = NO;
        [returnListOfDoublesSuccessFailureParams addObject:returnListOfDoublesSuccessFailureParam0];

        returnListOfDoublesSuccessFailure.parameters = returnListOfDoublesSuccessFailureParams;
        returnListOfDoublesSuccessFailure.returnType = MMServiceIOTypeArray;
        returnListOfDoublesSuccessFailure.returnComponentType = MMServiceIOTypeDouble;
        serviceMetaData[NSStringFromSelector(@selector(returnListOfDoubles:success:failure:))] = returnListOfDoublesSuccessFailure;

        // schema for service method returnVoidWithSuccess:failure:
        MMServiceMethod *returnVoidWithSuccessFailure = [[MMServiceMethod alloc] init];
        returnVoidWithSuccessFailure.path = @"primitive-type-service/returnVoid";
        returnVoidWithSuccessFailure.requestMethod = MMRequestMethodGET;

        NSMutableArray *returnVoidWithSuccessFailureParams = [NSMutableArray array];
        returnVoidWithSuccessFailure.parameters = returnVoidWithSuccessFailureParams;
        returnVoidWithSuccessFailure.returnType = MMServiceIOTypeVoid;
        serviceMetaData[NSStringFromSelector(@selector(returnVoidWithSuccess:failure:))] = returnVoidWithSuccessFailure;

        // schema for service method returnBooleanWithFormParameters:success:failure:
        MMServiceMethod *returnBooleanWithFormParametersSuccessFailure = [[MMServiceMethod alloc] init];
        returnBooleanWithFormParametersSuccessFailure.path = @"primitive-type-service/returnBoolean";
        returnBooleanWithFormParametersSuccessFailure.requestMethod = MMRequestMethodPOST;
        returnBooleanWithFormParametersSuccessFailure.consumes = [NSSet setWithObjects:@"application/x-www-form-urlencoded", nil];

        NSMutableArray *returnBooleanWithFormParametersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnBooleanWithFormParametersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnBooleanWithFormParametersSuccessFailureParam0.name = @"input";
        returnBooleanWithFormParametersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeForm;
        returnBooleanWithFormParametersSuccessFailureParam0.type = MMServiceIOTypeBoolean;
        returnBooleanWithFormParametersSuccessFailureParam0.isOptional = NO;
        [returnBooleanWithFormParametersSuccessFailureParams addObject:returnBooleanWithFormParametersSuccessFailureParam0];

        returnBooleanWithFormParametersSuccessFailure.parameters = returnBooleanWithFormParametersSuccessFailureParams;
        returnBooleanWithFormParametersSuccessFailure.returnType = MMServiceIOTypeBoolean;
        serviceMetaData[NSStringFromSelector(@selector(returnBooleanWithFormParameters:success:failure:))] = returnBooleanWithFormParametersSuccessFailure;

        // schema for service method returnBooleanWithBodyParameters:success:failure:
        MMServiceMethod *returnBooleanWithBodyParametersSuccessFailure = [[MMServiceMethod alloc] init];
        returnBooleanWithBodyParametersSuccessFailure.path = @"primitive-type-service/returnBoolean";
        returnBooleanWithBodyParametersSuccessFailure.requestMethod = MMRequestMethodPUT;

        NSMutableArray *returnBooleanWithBodyParametersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnBooleanWithBodyParametersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnBooleanWithBodyParametersSuccessFailureParam0.name = @"body";
        returnBooleanWithBodyParametersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnBooleanWithBodyParametersSuccessFailureParam0.type = MMServiceIOTypeBoolean;
        returnBooleanWithBodyParametersSuccessFailureParam0.isOptional = NO;
        [returnBooleanWithBodyParametersSuccessFailureParams addObject:returnBooleanWithBodyParametersSuccessFailureParam0];

        returnBooleanWithBodyParametersSuccessFailure.parameters = returnBooleanWithBodyParametersSuccessFailureParams;
        returnBooleanWithBodyParametersSuccessFailure.returnType = MMServiceIOTypeBoolean;
        serviceMetaData[NSStringFromSelector(@selector(returnBooleanWithBodyParameters:success:failure:))] = returnBooleanWithBodyParametersSuccessFailure;

        // schema for service method returnBoolean:success:failure:
        MMServiceMethod *returnBooleanSuccessFailure = [[MMServiceMethod alloc] init];
        returnBooleanSuccessFailure.path = @"primitive-type-service/returnBoolean";
        returnBooleanSuccessFailure.requestMethod = MMRequestMethodGET;

        NSMutableArray *returnBooleanSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnBooleanSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnBooleanSuccessFailureParam0.name = @"input";
        returnBooleanSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeQuery;
        returnBooleanSuccessFailureParam0.type = MMServiceIOTypeBoolean;
        returnBooleanSuccessFailureParam0.isOptional = NO;
        [returnBooleanSuccessFailureParams addObject:returnBooleanSuccessFailureParam0];

        returnBooleanSuccessFailure.parameters = returnBooleanSuccessFailureParams;
        returnBooleanSuccessFailure.returnType = MMServiceIOTypeBoolean;
        serviceMetaData[NSStringFromSelector(@selector(returnBoolean:success:failure:))] = returnBooleanSuccessFailure;

        // schema for service method returnMapOfEnums:success:failure:
        MMServiceMethod *returnMapOfEnumsSuccessFailure = [[MMServiceMethod alloc] init];
        returnMapOfEnumsSuccessFailure.path = @"primitive-type-service/returnMapOfEnums";
        returnMapOfEnumsSuccessFailure.requestMethod = MMRequestMethodPOST;

        NSMutableArray *returnMapOfEnumsSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnMapOfEnumsSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnMapOfEnumsSuccessFailureParam0.name = @"body";
        returnMapOfEnumsSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnMapOfEnumsSuccessFailureParam0.type = MMServiceIOTypeDictionary;
        returnMapOfEnumsSuccessFailureParam0.componentType = MMServiceIOTypeEnum;
        returnMapOfEnumsSuccessFailureParam0.typeClass = ATEnumAttributeContainer.class;
        returnMapOfEnumsSuccessFailureParam0.isOptional = NO;
        [returnMapOfEnumsSuccessFailureParams addObject:returnMapOfEnumsSuccessFailureParam0];

        returnMapOfEnumsSuccessFailure.parameters = returnMapOfEnumsSuccessFailureParams;
        returnMapOfEnumsSuccessFailure.returnType = MMServiceIOTypeDictionary;
        returnMapOfEnumsSuccessFailure.returnComponentType = MMServiceIOTypeEnum;
        returnMapOfEnumsSuccessFailure.returnTypeClass = ATEnumAttributeContainer.class;
        serviceMetaData[NSStringFromSelector(@selector(returnMapOfEnums:success:failure:))] = returnMapOfEnumsSuccessFailure;

        // schema for service method returnFloatWithFormParameters:success:failure:
        MMServiceMethod *returnFloatWithFormParametersSuccessFailure = [[MMServiceMethod alloc] init];
        returnFloatWithFormParametersSuccessFailure.path = @"primitive-type-service/returnFloat";
        returnFloatWithFormParametersSuccessFailure.requestMethod = MMRequestMethodPOST;
        returnFloatWithFormParametersSuccessFailure.consumes = [NSSet setWithObjects:@"application/x-www-form-urlencoded", nil];

        NSMutableArray *returnFloatWithFormParametersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnFloatWithFormParametersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnFloatWithFormParametersSuccessFailureParam0.name = @"input";
        returnFloatWithFormParametersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeForm;
        returnFloatWithFormParametersSuccessFailureParam0.type = MMServiceIOTypeFloat;
        returnFloatWithFormParametersSuccessFailureParam0.isOptional = NO;
        [returnFloatWithFormParametersSuccessFailureParams addObject:returnFloatWithFormParametersSuccessFailureParam0];

        returnFloatWithFormParametersSuccessFailure.parameters = returnFloatWithFormParametersSuccessFailureParams;
        returnFloatWithFormParametersSuccessFailure.returnType = MMServiceIOTypeFloat;
        serviceMetaData[NSStringFromSelector(@selector(returnFloatWithFormParameters:success:failure:))] = returnFloatWithFormParametersSuccessFailure;

        // schema for service method returnFloatWithBodyParameters:success:failure:
        MMServiceMethod *returnFloatWithBodyParametersSuccessFailure = [[MMServiceMethod alloc] init];
        returnFloatWithBodyParametersSuccessFailure.path = @"primitive-type-service/returnFloat";
        returnFloatWithBodyParametersSuccessFailure.requestMethod = MMRequestMethodPUT;

        NSMutableArray *returnFloatWithBodyParametersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnFloatWithBodyParametersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnFloatWithBodyParametersSuccessFailureParam0.name = @"body";
        returnFloatWithBodyParametersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnFloatWithBodyParametersSuccessFailureParam0.type = MMServiceIOTypeFloat;
        returnFloatWithBodyParametersSuccessFailureParam0.isOptional = NO;
        [returnFloatWithBodyParametersSuccessFailureParams addObject:returnFloatWithBodyParametersSuccessFailureParam0];

        returnFloatWithBodyParametersSuccessFailure.parameters = returnFloatWithBodyParametersSuccessFailureParams;
        returnFloatWithBodyParametersSuccessFailure.returnType = MMServiceIOTypeFloat;
        serviceMetaData[NSStringFromSelector(@selector(returnFloatWithBodyParameters:success:failure:))] = returnFloatWithBodyParametersSuccessFailure;

        // schema for service method returnFloat:success:failure:
        MMServiceMethod *returnFloatSuccessFailure = [[MMServiceMethod alloc] init];
        returnFloatSuccessFailure.path = @"primitive-type-service/returnFloat";
        returnFloatSuccessFailure.requestMethod = MMRequestMethodGET;

        NSMutableArray *returnFloatSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnFloatSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnFloatSuccessFailureParam0.name = @"input";
        returnFloatSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeQuery;
        returnFloatSuccessFailureParam0.type = MMServiceIOTypeFloat;
        returnFloatSuccessFailureParam0.isOptional = NO;
        [returnFloatSuccessFailureParams addObject:returnFloatSuccessFailureParam0];

        returnFloatSuccessFailure.parameters = returnFloatSuccessFailureParams;
        returnFloatSuccessFailure.returnType = MMServiceIOTypeFloat;
        serviceMetaData[NSStringFromSelector(@selector(returnFloat:success:failure:))] = returnFloatSuccessFailure;

        // schema for service method returnMapOfFloats:success:failure:
        MMServiceMethod *returnMapOfFloatsSuccessFailure = [[MMServiceMethod alloc] init];
        returnMapOfFloatsSuccessFailure.path = @"primitive-type-service/returnMapOfFloats";
        returnMapOfFloatsSuccessFailure.requestMethod = MMRequestMethodPOST;

        NSMutableArray *returnMapOfFloatsSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnMapOfFloatsSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnMapOfFloatsSuccessFailureParam0.name = @"body";
        returnMapOfFloatsSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnMapOfFloatsSuccessFailureParam0.type = MMServiceIOTypeDictionary;
        returnMapOfFloatsSuccessFailureParam0.componentType = MMServiceIOTypeFloat;
        returnMapOfFloatsSuccessFailureParam0.isOptional = NO;
        [returnMapOfFloatsSuccessFailureParams addObject:returnMapOfFloatsSuccessFailureParam0];

        returnMapOfFloatsSuccessFailure.parameters = returnMapOfFloatsSuccessFailureParams;
        returnMapOfFloatsSuccessFailure.returnType = MMServiceIOTypeDictionary;
        returnMapOfFloatsSuccessFailure.returnComponentType = MMServiceIOTypeFloat;
        serviceMetaData[NSStringFromSelector(@selector(returnMapOfFloats:success:failure:))] = returnMapOfFloatsSuccessFailure;

        // schema for service method returnListOfStrings:success:failure:
        MMServiceMethod *returnListOfStringsSuccessFailure = [[MMServiceMethod alloc] init];
        returnListOfStringsSuccessFailure.path = @"primitive-type-service/returnListOfStrings";
        returnListOfStringsSuccessFailure.requestMethod = MMRequestMethodPOST;

        NSMutableArray *returnListOfStringsSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnListOfStringsSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnListOfStringsSuccessFailureParam0.name = @"body";
        returnListOfStringsSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnListOfStringsSuccessFailureParam0.type = MMServiceIOTypeArray;
        returnListOfStringsSuccessFailureParam0.componentType = MMServiceIOTypeString;
        returnListOfStringsSuccessFailureParam0.isOptional = NO;
        [returnListOfStringsSuccessFailureParams addObject:returnListOfStringsSuccessFailureParam0];

        returnListOfStringsSuccessFailure.parameters = returnListOfStringsSuccessFailureParams;
        returnListOfStringsSuccessFailure.returnType = MMServiceIOTypeArray;
        returnListOfStringsSuccessFailure.returnComponentType = MMServiceIOTypeString;
        serviceMetaData[NSStringFromSelector(@selector(returnListOfStrings:success:failure:))] = returnListOfStringsSuccessFailure;
        
        // schema for service method returnListOfStringsGET:success:failure:
        MMServiceMethod *returnListOfStringsGETSuccessFailure = [[MMServiceMethod alloc] init];
        returnListOfStringsGETSuccessFailure.path = @"primitive-type-service/returnListOfStringsGET";
        returnListOfStringsGETSuccessFailure.requestMethod = MMRequestMethodGET;
        
        NSMutableArray *returnListOfStringsGETSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnListOfStringsGETSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnListOfStringsGETSuccessFailureParam0.name = @"input";
        returnListOfStringsGETSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeQuery;
        returnListOfStringsGETSuccessFailureParam0.type = MMServiceIOTypeArray;
        returnListOfStringsGETSuccessFailureParam0.componentType = MMServiceIOTypeString;
        returnListOfStringsGETSuccessFailureParam0.isOptional = NO;
        [returnListOfStringsGETSuccessFailureParams addObject:returnListOfStringsGETSuccessFailureParam0];
        
        returnListOfStringsGETSuccessFailure.parameters = returnListOfStringsGETSuccessFailureParams;
        returnListOfStringsGETSuccessFailure.returnType = MMServiceIOTypeArray;
        returnListOfStringsGETSuccessFailure.returnComponentType = MMServiceIOTypeString;
        serviceMetaData[NSStringFromSelector(@selector(returnListOfStringsGET:success:failure:))] = returnListOfStringsGETSuccessFailure;

        // schema for service method returnListOfShorts:success:failure:
        MMServiceMethod *returnListOfShortsSuccessFailure = [[MMServiceMethod alloc] init];
        returnListOfShortsSuccessFailure.path = @"primitive-type-service/returnListOfShorts";
        returnListOfShortsSuccessFailure.requestMethod = MMRequestMethodPOST;

        NSMutableArray *returnListOfShortsSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnListOfShortsSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnListOfShortsSuccessFailureParam0.name = @"body";
        returnListOfShortsSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnListOfShortsSuccessFailureParam0.type = MMServiceIOTypeArray;
        returnListOfShortsSuccessFailureParam0.componentType = MMServiceIOTypeShort;
        returnListOfShortsSuccessFailureParam0.isOptional = NO;
        [returnListOfShortsSuccessFailureParams addObject:returnListOfShortsSuccessFailureParam0];

        returnListOfShortsSuccessFailure.parameters = returnListOfShortsSuccessFailureParams;
        returnListOfShortsSuccessFailure.returnType = MMServiceIOTypeArray;
        returnListOfShortsSuccessFailure.returnComponentType = MMServiceIOTypeShort;
        serviceMetaData[NSStringFromSelector(@selector(returnListOfShorts:success:failure:))] = returnListOfShortsSuccessFailure;

        // schema for service method returnLongWithFormParameters:success:failure:
        MMServiceMethod *returnLongWithFormParametersSuccessFailure = [[MMServiceMethod alloc] init];
        returnLongWithFormParametersSuccessFailure.path = @"primitive-type-service/returnLong";
        returnLongWithFormParametersSuccessFailure.requestMethod = MMRequestMethodPOST;
        returnLongWithFormParametersSuccessFailure.consumes = [NSSet setWithObjects:@"application/x-www-form-urlencoded", nil];

        NSMutableArray *returnLongWithFormParametersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnLongWithFormParametersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnLongWithFormParametersSuccessFailureParam0.name = @"input";
        returnLongWithFormParametersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeForm;
        returnLongWithFormParametersSuccessFailureParam0.type = MMServiceIOTypeLongLong;
        returnLongWithFormParametersSuccessFailureParam0.isOptional = NO;
        [returnLongWithFormParametersSuccessFailureParams addObject:returnLongWithFormParametersSuccessFailureParam0];

        returnLongWithFormParametersSuccessFailure.parameters = returnLongWithFormParametersSuccessFailureParams;
        returnLongWithFormParametersSuccessFailure.returnType = MMServiceIOTypeLongLong;
        serviceMetaData[NSStringFromSelector(@selector(returnLongWithFormParameters:success:failure:))] = returnLongWithFormParametersSuccessFailure;

        // schema for service method returnLongWithBodyParameters:success:failure:
        MMServiceMethod *returnLongWithBodyParametersSuccessFailure = [[MMServiceMethod alloc] init];
        returnLongWithBodyParametersSuccessFailure.path = @"primitive-type-service/returnLong";
        returnLongWithBodyParametersSuccessFailure.requestMethod = MMRequestMethodPUT;

        NSMutableArray *returnLongWithBodyParametersSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnLongWithBodyParametersSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnLongWithBodyParametersSuccessFailureParam0.name = @"body";
        returnLongWithBodyParametersSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        returnLongWithBodyParametersSuccessFailureParam0.type = MMServiceIOTypeLongLong;
        returnLongWithBodyParametersSuccessFailureParam0.isOptional = NO;
        [returnLongWithBodyParametersSuccessFailureParams addObject:returnLongWithBodyParametersSuccessFailureParam0];

        returnLongWithBodyParametersSuccessFailure.parameters = returnLongWithBodyParametersSuccessFailureParams;
        returnLongWithBodyParametersSuccessFailure.returnType = MMServiceIOTypeLongLong;
        serviceMetaData[NSStringFromSelector(@selector(returnLongWithBodyParameters:success:failure:))] = returnLongWithBodyParametersSuccessFailure;

        // schema for service method returnLong:success:failure:
        MMServiceMethod *returnLongSuccessFailure = [[MMServiceMethod alloc] init];
        returnLongSuccessFailure.path = @"primitive-type-service/returnLong";
        returnLongSuccessFailure.requestMethod = MMRequestMethodGET;

        NSMutableArray *returnLongSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *returnLongSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        returnLongSuccessFailureParam0.name = @"input";
        returnLongSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeQuery;
        returnLongSuccessFailureParam0.type = MMServiceIOTypeLongLong;
        returnLongSuccessFailureParam0.isOptional = NO;
        [returnLongSuccessFailureParams addObject:returnLongSuccessFailureParam0];

        returnLongSuccessFailure.parameters = returnLongSuccessFailureParams;
        returnLongSuccessFailure.returnType = MMServiceIOTypeLongLong;
        serviceMetaData[NSStringFromSelector(@selector(returnLong:success:failure:))] = returnLongSuccessFailure;


        __metaData = serviceMetaData;
    });

    return __metaData;
}

@end
