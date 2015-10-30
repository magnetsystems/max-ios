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



@protocol ATDateTypeProtocol <NSObject>

@optional
/**
 
 POST /date-type/date
 @param input style:HEADER
 @return A 'MMCall' object.
 */
- (MMCall *)postDate:(NSDate *)input
             success:(void (^)(NSDate *response))success
             failure:(void (^)(NSError *error))failure;
/**
 
 PUT /date-type/date
 @param input style:HEADER
 @return A 'MMCall' object.
 */
- (MMCall *)putDate:(NSDate *)input
            success:(void (^)(NSDate *response))success
            failure:(void (^)(NSError *error))failure;
/**
 
 GET /date-type/date
 @param input style:HEADER
 @return A 'MMCall' object.
 */
- (MMCall *)getDate:(NSDate *)input
            success:(void (^)(NSDate *response))success
            failure:(void (^)(NSError *error))failure;
/**
 
 DELETE /date-type/date
 @param input style:HEADER
 @return A 'MMCall' object.
 */
- (MMCall *)deleteDate:(NSDate *)input
               success:(void (^)(NSDate *response))success
               failure:(void (^)(NSError *error))failure;
/**
 
 POST /date-type/currentlongdate
 @return A 'MMCall' object.
 */
- (MMCall *)postCurrentLongDateWithSuccess:(void (^)(long long response))success
                                   failure:(void (^)(NSError *error))failure;
/**
 
 PUT /date-type/currentlongdate
 @return A 'MMCall' object.
 */
- (MMCall *)putCurrentLongDateWithSuccess:(void (^)(long long response))success
                                  failure:(void (^)(NSError *error))failure;
/**
 
 GET /date-type/currentlongdate
 @return A 'MMCall' object.
 */
- (MMCall *)getCurrentLongDateWithSuccess:(void (^)(long long response))success
                                  failure:(void (^)(NSError *error))failure;
/**
 
 DELETE /date-type/currentlongdate
 @return A 'MMCall' object.
 */
- (MMCall *)deleteCurrentLongDateWithSuccess:(void (^)(long long response))success
                                     failure:(void (^)(NSError *error))failure;
/**
 
 POST /date-type/jsondateparam
 @param body style:BODY
 @return A 'MMCall' object.
 */
- (MMCall *)postJsonDateParam:(NSDate *)body
                      success:(void (^)(NSDate *response))success
                      failure:(void (^)(NSError *error))failure;
/**
 
 POST /date-type/jsondate
 @param body style:BODY
 @return A 'MMCall' object.
 */
- (MMCall *)getJsonDate:(NSDate *)body
                success:(void (^)(NSDate *response))success
                failure:(void (^)(NSError *error))failure;
/**
 
 POST /date-type/dateparam
 @param input style:HEADER
 @return A 'MMCall' object.
 */
- (MMCall *)postDateParam:(NSDate *)input
                  success:(void (^)(NSDate *response))success
                  failure:(void (^)(NSError *error))failure;
/**
 
 PUT /date-type/dateparam
 @param input style:HEADER
 @return A 'MMCall' object.
 */
- (MMCall *)putDateParam:(NSDate *)input
                 success:(void (^)(NSDate *response))success
                 failure:(void (^)(NSError *error))failure;
/**
 
 GET /date-type/dateparam
 @param input style:HEADER
 @return A 'MMCall' object.
 */
- (MMCall *)getDateParam:(NSDate *)input
                 success:(void (^)(NSDate *response))success
                 failure:(void (^)(NSError *error))failure;
/**
 
 DELETE /date-type/dateparam
 @param input style:HEADER
 @return A 'MMCall' object.
 */
- (MMCall *)deleteDateParam:(NSDate *)input
                    success:(void (^)(NSDate *response))success
                    failure:(void (^)(NSError *error))failure;
/**
 
 POST /date-type/currentdate
 @return A 'MMCall' object.
 */
- (MMCall *)postCurrentDateWithSuccess:(void (^)(NSDate *response))success
                               failure:(void (^)(NSError *error))failure;
/**
 
 PUT /date-type/currentdate
 @return A 'MMCall' object.
 */
- (MMCall *)putCurrentDateWithSuccess:(void (^)(NSDate *response))success
                              failure:(void (^)(NSError *error))failure;
/**
 
 GET /date-type/currentdate
 @return A 'MMCall' object.
 */
- (MMCall *)getCurrentDateWithSuccess:(void (^)(NSDate *response))success
                              failure:(void (^)(NSError *error))failure;
/**
 
 DELETE /date-type/currentdate
 @return A 'MMCall' object.
 */
- (MMCall *)deleteCurrentDateWithSuccess:(void (^)(NSDate *response))success
                                 failure:(void (^)(NSError *error))failure;

@end

@interface ATDateType : MMService<ATDateTypeProtocol>

@end
