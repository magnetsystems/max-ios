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

#import <Foundation/Foundation.h>
@import MagnetMax;

#import "ATEnumAttribute.h"

@class ATModelWithAllTypes;

@protocol ATPrimitiveTypeServiceProtocol <NSObject>

@optional
/**
 
 POST /api/primitive-type-service/returnMapOfIntegers
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnMapOfIntegers:(NSDictionary *)body
                        success:(void (^)(NSDictionary *response))success
                        failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnMapOfCharacters
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnMapOfCharacters:(NSDictionary *)body
                          success:(void (^)(NSDictionary *response))success
                          failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnListOfBooleans
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnListOfBooleans:(NSArray *)body
                         success:(void (^)(NSArray *response))success
                         failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnShort
 @param input style:FORM
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnShortWithFormParameters:(short)input
                                  success:(void (^)(short response))success
                                  failure:(void (^)(NSError *error))failure;
/**
 
 PUT /api/primitive-type-service/returnShort
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnShortWithBodyParameters:(short)body
                                  success:(void (^)(short response))success
                                  failure:(void (^)(NSError *error))failure;
/**
 
 GET /api/primitive-type-service/returnShort
 @param input style:QUERY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnShort:(short)input
                success:(void (^)(short response))success
                failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnListOfBytes
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnListOfBytes:(NSArray *)body
                      success:(void (^)(NSArray *response))success
                      failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnListOfLongs
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnListOfLongs:(NSArray *)body
                      success:(void (^)(NSArray *response))success
                      failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnString
 @param input style:FORM
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnStringWithFormParameters:(NSString *)input
                                   success:(void (^)(NSString *response))success
                                   failure:(void (^)(NSError *error))failure;
/**
 
 PUT /api/primitive-type-service/returnString
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnStringWithBodyParameters:(NSString *)body
                                   success:(void (^)(NSString *response))success
                                   failure:(void (^)(NSError *error))failure;
/**
 
 GET /api/primitive-type-service/returnString
 @param input style:QUERY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnString:(NSString *)input
                 success:(void (^)(NSString *response))success
                 failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnMapOfBooleans
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnMapOfBooleans:(NSDictionary *)body
                        success:(void (^)(NSDictionary *response))success
                        failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnListOfEnums
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnListOfEnums:(NSArray *)body
                      success:(void (^)(NSArray *response))success
                      failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnEnum
 @param input style:FORM
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnEnumWithFormParameters:(ATEnumAttribute)input
                                 success:(void (^)(ATEnumAttribute response))success
                                 failure:(void (^)(NSError *error))failure;
/**
 
 PUT /api/primitive-type-service/returnEnum
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnEnumWithBodyParameters:(ATEnumAttribute)body
                                 success:(void (^)(ATEnumAttribute response))success
                                 failure:(void (^)(NSError *error))failure;
/**
 
 GET /api/primitive-type-service/returnEnum
 @param input style:QUERY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnEnum:(ATEnumAttribute)input
               success:(void (^)(ATEnumAttribute response))success
               failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnMapOfDoubles
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnMapOfDoubles:(NSDictionary *)body
                       success:(void (^)(NSDictionary *response))success
                       failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnMapOfModels
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnMapOfModels:(NSDictionary *)body
                      success:(void (^)(NSDictionary *response))success
                      failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnListOfFloats
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnListOfFloats:(NSArray *)body
                       success:(void (^)(NSArray *response))success
                       failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnListOfModels
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnListOfModels:(NSArray *)body
                       success:(void (^)(NSArray *response))success
                       failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnDate
 @param input style:FORM
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnDateWithFormParameters:(NSDate *)input
                                 success:(void (^)(NSDate *response))success
                                 failure:(void (^)(NSError *error))failure;
/**
 
 PUT /api/primitive-type-service/returnDate
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnDateWithBodyParameters:(NSDate *)body
                                 success:(void (^)(NSDate *response))success
                                 failure:(void (^)(NSError *error))failure;
/**
 
 GET /api/primitive-type-service/returnDate
 @param input style:QUERY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnDate:(NSDate *)input
               success:(void (^)(NSDate *response))success
               failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnMapOfStrings
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnMapOfStrings:(NSDictionary *)body
                       success:(void (^)(NSDictionary *response))success
                       failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnModelWithAllTypes
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnModelWithAllTypes:(ATModelWithAllTypes *)body
                            success:(void (^)(ATModelWithAllTypes *response))success
                            failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnChar
 @param input style:FORM
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnCharWithFormParameters:(unichar)input
                                 success:(void (^)(unichar response))success
                                 failure:(void (^)(NSError *error))failure;
/**
 
 PUT /api/primitive-type-service/returnChar
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnCharWithBodyParameters:(unichar)body
                                 success:(void (^)(unichar response))success
                                 failure:(void (^)(NSError *error))failure;
/**
 
 GET /api/primitive-type-service/returnChar
 @param input style:QUERY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnChar:(unichar)input
               success:(void (^)(unichar response))success
               failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnMapOfBytes
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnMapOfBytes:(NSDictionary *)body
                     success:(void (^)(NSDictionary *response))success
                     failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnMapOfLongs
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnMapOfLongs:(NSDictionary *)body
                     success:(void (^)(NSDictionary *response))success
                     failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnListOfCharacters
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnListOfCharacters:(NSArray *)body
                           success:(void (^)(NSArray *response))success
                           failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnDouble
 @param input style:FORM
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnDoubleWithFormParameters:(double)input
                                   success:(void (^)(double response))success
                                   failure:(void (^)(NSError *error))failure;
/**
 
 PUT /api/primitive-type-service/returnDouble
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnDoubleWithBodyParameters:(double)body
                                   success:(void (^)(double response))success
                                   failure:(void (^)(NSError *error))failure;
/**
 
 GET /api/primitive-type-service/returnDouble
 @param input style:QUERY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnDouble:(double)input
                 success:(void (^)(double response))success
                 failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnInt
 @param input style:FORM
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnIntWithFormParameters:(int)input
                                success:(void (^)(int response))success
                                failure:(void (^)(NSError *error))failure;
/**
 
 PUT /api/primitive-type-service/returnInt
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnIntWithBodyParameters:(int)body
                                success:(void (^)(int response))success
                                failure:(void (^)(NSError *error))failure;
/**
 
 GET /api/primitive-type-service/returnInt
 @param input style:QUERY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnInt:(int)input
              success:(void (^)(int response))success
              failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnMapOfShorts
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnMapOfShorts:(NSDictionary *)body
                      success:(void (^)(NSDictionary *response))success
                      failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnListOfIntegers
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnListOfIntegers:(NSArray *)body
                         success:(void (^)(NSArray *response))success
                         failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnByte
 @param input style:FORM
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnByteWithFormParameters:(char)input
                                 success:(void (^)(char response))success
                                 failure:(void (^)(NSError *error))failure;
/**
 
 PUT /api/primitive-type-service/returnByte
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnByteWithBodyParameters:(char)body
                                 success:(void (^)(char response))success
                                 failure:(void (^)(NSError *error))failure;
/**
 
 GET /api/primitive-type-service/returnByte
 @param input style:QUERY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnByte:(char)input
               success:(void (^)(char response))success
               failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnListOfDoubles
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnListOfDoubles:(NSArray *)body
                        success:(void (^)(NSArray *response))success
                        failure:(void (^)(NSError *error))failure;
/**
 
 GET /api/primitive-type-service/returnVoid
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnVoidWithSuccess:(void (^)())success
                          failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnBoolean
 @param input style:FORM
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnBooleanWithFormParameters:(BOOL)input
                                    success:(void (^)(BOOL response))success
                                    failure:(void (^)(NSError *error))failure;
/**
 
 PUT /api/primitive-type-service/returnBoolean
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnBooleanWithBodyParameters:(BOOL)body
                                    success:(void (^)(BOOL response))success
                                    failure:(void (^)(NSError *error))failure;
/**
 
 GET /api/primitive-type-service/returnBoolean
 @param input style:QUERY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnBoolean:(BOOL)input
                  success:(void (^)(BOOL response))success
                  failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnMapOfEnums
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnMapOfEnums:(NSDictionary *)body
                     success:(void (^)(NSDictionary *response))success
                     failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnFloat
 @param input style:FORM
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnFloatWithFormParameters:(float)input
                                  success:(void (^)(float response))success
                                  failure:(void (^)(NSError *error))failure;
/**
 
 PUT /api/primitive-type-service/returnFloat
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnFloatWithBodyParameters:(float)body
                                  success:(void (^)(float response))success
                                  failure:(void (^)(NSError *error))failure;
/**
 
 GET /api/primitive-type-service/returnFloat
 @param input style:QUERY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnFloat:(float)input
                success:(void (^)(float response))success
                failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnMapOfFloats
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnMapOfFloats:(NSDictionary *)body
                      success:(void (^)(NSDictionary *response))success
                      failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnListOfStrings
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnListOfStrings:(NSArray *)body
                        success:(void (^)(NSArray *response))success
                        failure:(void (^)(NSError *error))failure;

/**
 
 POST /api/primitive-type-service/returnListOfStringsGET
 @param input style:QUERY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnListOfStringsGET:(NSArray *)input
                           success:(void (^)(NSArray *response))success
                           failure:(void (^)(NSError *error))failure;

/**
 
 POST /api/primitive-type-service/returnListOfShorts
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnListOfShorts:(NSArray *)body
                       success:(void (^)(NSArray *response))success
                       failure:(void (^)(NSError *error))failure;
/**
 
 POST /api/primitive-type-service/returnLong
 @param input style:FORM
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnLongWithFormParameters:(long long)input
                                 success:(void (^)(long long response))success
                                 failure:(void (^)(NSError *error))failure;
/**
 
 PUT /api/primitive-type-service/returnLong
 @param body style:BODY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnLongWithBodyParameters:(long long)body
                                 success:(void (^)(long long response))success
                                 failure:(void (^)(NSError *error))failure;
/**
 
 GET /api/primitive-type-service/returnLong
 @param input style:QUERY
 @param options
 @return A 'MMCall' object.
 */
- (MMCall *)returnLong:(long long)input
               success:(void (^)(long long response))success
               failure:(void (^)(NSError *error))failure;

@end

@interface ATPrimitiveTypeService : MMService<ATPrimitiveTypeServiceProtocol>

@end
