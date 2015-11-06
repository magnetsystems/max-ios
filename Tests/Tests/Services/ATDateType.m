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

#import "ATDateType.h"

@implementation ATDateType

+ (NSDictionary *)metaData {
    static NSDictionary *__metaData = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSMutableDictionary *serviceMetaData = [NSMutableDictionary dictionary];


        // schema for service method postDate:success:failure:
        MMServiceMethod *postDateSuccessFailure = [[MMServiceMethod alloc] init];
        postDateSuccessFailure.clazz = [self class];
        postDateSuccessFailure.selector = @selector(postDate:success:failure:);
        postDateSuccessFailure.path = @"date-type/date";
        postDateSuccessFailure.requestMethod = MMRequestMethodPOST;
        postDateSuccessFailure.produces = [NSSet setWithObjects:@"application/json", nil];

        NSMutableArray *postDateSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *postDateSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        postDateSuccessFailureParam0.name = @"input";
        postDateSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeHeader;
        postDateSuccessFailureParam0.type = MMServiceIOTypeDate;
        postDateSuccessFailureParam0.isOptional = NO;
        [postDateSuccessFailureParams addObject:postDateSuccessFailureParam0];

        postDateSuccessFailure.parameters = postDateSuccessFailureParams;
        postDateSuccessFailure.returnType = MMServiceIOTypeDate;
        serviceMetaData[NSStringFromSelector(postDateSuccessFailure.selector)] = postDateSuccessFailure;

        // schema for service method putDate:success:failure:
        MMServiceMethod *putDateSuccessFailure = [[MMServiceMethod alloc] init];
        putDateSuccessFailure.clazz = [self class];
        putDateSuccessFailure.selector = @selector(putDate:success:failure:);
        putDateSuccessFailure.path = @"date-type/date";
        putDateSuccessFailure.requestMethod = MMRequestMethodPUT;
        putDateSuccessFailure.produces = [NSSet setWithObjects:@"application/json", nil];

        NSMutableArray *putDateSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *putDateSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        putDateSuccessFailureParam0.name = @"input";
        putDateSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeHeader;
        putDateSuccessFailureParam0.type = MMServiceIOTypeDate;
        putDateSuccessFailureParam0.isOptional = NO;
        [putDateSuccessFailureParams addObject:putDateSuccessFailureParam0];

        putDateSuccessFailure.parameters = putDateSuccessFailureParams;
        putDateSuccessFailure.returnType = MMServiceIOTypeDate;
        serviceMetaData[NSStringFromSelector(putDateSuccessFailure.selector)] = putDateSuccessFailure;

        // schema for service method getDate:success:failure:
        MMServiceMethod *getDateSuccessFailure = [[MMServiceMethod alloc] init];
        getDateSuccessFailure.clazz = [self class];
        getDateSuccessFailure.selector = @selector(getDate:success:failure:);
        getDateSuccessFailure.path = @"date-type/date";
        getDateSuccessFailure.requestMethod = MMRequestMethodGET;
        getDateSuccessFailure.produces = [NSSet setWithObjects:@"application/json", nil];

        NSMutableArray *getDateSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *getDateSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        getDateSuccessFailureParam0.name = @"input";
        getDateSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeHeader;
        getDateSuccessFailureParam0.type = MMServiceIOTypeDate;
        getDateSuccessFailureParam0.isOptional = NO;
        [getDateSuccessFailureParams addObject:getDateSuccessFailureParam0];

        getDateSuccessFailure.parameters = getDateSuccessFailureParams;
        getDateSuccessFailure.returnType = MMServiceIOTypeDate;
        serviceMetaData[NSStringFromSelector(getDateSuccessFailure.selector)] = getDateSuccessFailure;

        // schema for service method deleteDate:success:failure:
        MMServiceMethod *deleteDateSuccessFailure = [[MMServiceMethod alloc] init];
        deleteDateSuccessFailure.clazz = [self class];
        deleteDateSuccessFailure.selector = @selector(deleteDate:success:failure:);
        deleteDateSuccessFailure.path = @"date-type/date";
        deleteDateSuccessFailure.requestMethod = MMRequestMethodDELETE;
        deleteDateSuccessFailure.produces = [NSSet setWithObjects:@"application/json", nil];

        NSMutableArray *deleteDateSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *deleteDateSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        deleteDateSuccessFailureParam0.name = @"input";
        deleteDateSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeHeader;
        deleteDateSuccessFailureParam0.type = MMServiceIOTypeDate;
        deleteDateSuccessFailureParam0.isOptional = NO;
        [deleteDateSuccessFailureParams addObject:deleteDateSuccessFailureParam0];

        deleteDateSuccessFailure.parameters = deleteDateSuccessFailureParams;
        deleteDateSuccessFailure.returnType = MMServiceIOTypeDate;
        serviceMetaData[NSStringFromSelector(deleteDateSuccessFailure.selector)] = deleteDateSuccessFailure;

        // schema for service method postCurrentLongDateWithSuccess:failure:
        MMServiceMethod *postCurrentLongDateWithSuccessFailure = [[MMServiceMethod alloc] init];
        postCurrentLongDateWithSuccessFailure.clazz = [self class];
        postCurrentLongDateWithSuccessFailure.selector = @selector(postCurrentLongDateWithSuccess:failure:);
        postCurrentLongDateWithSuccessFailure.path = @"date-type/currentlongdate";
        postCurrentLongDateWithSuccessFailure.requestMethod = MMRequestMethodPOST;
        postCurrentLongDateWithSuccessFailure.produces = [NSSet setWithObjects:@"application/json", nil];

        NSMutableArray *postCurrentLongDateWithSuccessFailureParams = [NSMutableArray array];
        postCurrentLongDateWithSuccessFailure.parameters = postCurrentLongDateWithSuccessFailureParams;
        postCurrentLongDateWithSuccessFailure.returnType = MMServiceIOTypeLongLong;
        serviceMetaData[NSStringFromSelector(postCurrentLongDateWithSuccessFailure.selector)] = postCurrentLongDateWithSuccessFailure;

        // schema for service method putCurrentLongDateWithSuccess:failure:
        MMServiceMethod *putCurrentLongDateWithSuccessFailure = [[MMServiceMethod alloc] init];
        putCurrentLongDateWithSuccessFailure.clazz = [self class];
        putCurrentLongDateWithSuccessFailure.selector = @selector(putCurrentLongDateWithSuccess:failure:);
        putCurrentLongDateWithSuccessFailure.path = @"date-type/currentlongdate";
        putCurrentLongDateWithSuccessFailure.requestMethod = MMRequestMethodPUT;
        putCurrentLongDateWithSuccessFailure.produces = [NSSet setWithObjects:@"application/json", nil];

        NSMutableArray *putCurrentLongDateWithSuccessFailureParams = [NSMutableArray array];
        putCurrentLongDateWithSuccessFailure.parameters = putCurrentLongDateWithSuccessFailureParams;
        putCurrentLongDateWithSuccessFailure.returnType = MMServiceIOTypeLongLong;
        serviceMetaData[NSStringFromSelector(putCurrentLongDateWithSuccessFailure.selector)] = putCurrentLongDateWithSuccessFailure;

        // schema for service method getCurrentLongDateWithSuccess:failure:
        MMServiceMethod *getCurrentLongDateWithSuccessFailure = [[MMServiceMethod alloc] init];
        getCurrentLongDateWithSuccessFailure.clazz = [self class];
        getCurrentLongDateWithSuccessFailure.selector = @selector(getCurrentLongDateWithSuccess:failure:);
        getCurrentLongDateWithSuccessFailure.path = @"date-type/currentlongdate";
        getCurrentLongDateWithSuccessFailure.requestMethod = MMRequestMethodGET;
        getCurrentLongDateWithSuccessFailure.produces = [NSSet setWithObjects:@"application/json", nil];

        NSMutableArray *getCurrentLongDateWithSuccessFailureParams = [NSMutableArray array];
        getCurrentLongDateWithSuccessFailure.parameters = getCurrentLongDateWithSuccessFailureParams;
        getCurrentLongDateWithSuccessFailure.returnType = MMServiceIOTypeLongLong;
        serviceMetaData[NSStringFromSelector(getCurrentLongDateWithSuccessFailure.selector)] = getCurrentLongDateWithSuccessFailure;

        // schema for service method deleteCurrentLongDateWithSuccess:failure:
        MMServiceMethod *deleteCurrentLongDateWithSuccessFailure = [[MMServiceMethod alloc] init];
        deleteCurrentLongDateWithSuccessFailure.clazz = [self class];
        deleteCurrentLongDateWithSuccessFailure.selector = @selector(deleteCurrentLongDateWithSuccess:failure:);
        deleteCurrentLongDateWithSuccessFailure.path = @"date-type/currentlongdate";
        deleteCurrentLongDateWithSuccessFailure.requestMethod = MMRequestMethodDELETE;
        deleteCurrentLongDateWithSuccessFailure.produces = [NSSet setWithObjects:@"application/json", nil];

        NSMutableArray *deleteCurrentLongDateWithSuccessFailureParams = [NSMutableArray array];
        deleteCurrentLongDateWithSuccessFailure.parameters = deleteCurrentLongDateWithSuccessFailureParams;
        deleteCurrentLongDateWithSuccessFailure.returnType = MMServiceIOTypeLongLong;
        serviceMetaData[NSStringFromSelector(deleteCurrentLongDateWithSuccessFailure.selector)] = deleteCurrentLongDateWithSuccessFailure;

        // schema for service method postJsonDateParam:success:failure:
        MMServiceMethod *postJsonDateParamSuccessFailure = [[MMServiceMethod alloc] init];
        postJsonDateParamSuccessFailure.clazz = [self class];
        postJsonDateParamSuccessFailure.selector = @selector(postJsonDateParam:success:failure:);
        postJsonDateParamSuccessFailure.path = @"date-type/jsondateparam";
        postJsonDateParamSuccessFailure.requestMethod = MMRequestMethodPOST;
        postJsonDateParamSuccessFailure.consumes = [NSSet setWithObjects:@"application/json", nil];
        postJsonDateParamSuccessFailure.produces = [NSSet setWithObjects:@"application/json", nil];

        NSMutableArray *postJsonDateParamSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *postJsonDateParamSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        postJsonDateParamSuccessFailureParam0.name = @"body";
        postJsonDateParamSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        postJsonDateParamSuccessFailureParam0.type = MMServiceIOTypeDate;
        postJsonDateParamSuccessFailureParam0.isOptional = NO;
        [postJsonDateParamSuccessFailureParams addObject:postJsonDateParamSuccessFailureParam0];

        postJsonDateParamSuccessFailure.parameters = postJsonDateParamSuccessFailureParams;
        postJsonDateParamSuccessFailure.returnType = MMServiceIOTypeDate;
        serviceMetaData[NSStringFromSelector(postJsonDateParamSuccessFailure.selector)] = postJsonDateParamSuccessFailure;

        // schema for service method getJsonDate:success:failure:
        MMServiceMethod *getJsonDateSuccessFailure = [[MMServiceMethod alloc] init];
        getJsonDateSuccessFailure.clazz = [self class];
        getJsonDateSuccessFailure.selector = @selector(getJsonDate:success:failure:);
        getJsonDateSuccessFailure.path = @"date-type/jsondate";
        getJsonDateSuccessFailure.requestMethod = MMRequestMethodPOST;
        getJsonDateSuccessFailure.consumes = [NSSet setWithObjects:@"application/json", nil];
        getJsonDateSuccessFailure.produces = [NSSet setWithObjects:@"application/json", nil];

        NSMutableArray *getJsonDateSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *getJsonDateSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        getJsonDateSuccessFailureParam0.name = @"body";
        getJsonDateSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeBody;
        getJsonDateSuccessFailureParam0.type = MMServiceIOTypeDate;
        getJsonDateSuccessFailureParam0.isOptional = NO;
        [getJsonDateSuccessFailureParams addObject:getJsonDateSuccessFailureParam0];

        getJsonDateSuccessFailure.parameters = getJsonDateSuccessFailureParams;
        getJsonDateSuccessFailure.returnType = MMServiceIOTypeDate;
        serviceMetaData[NSStringFromSelector(getJsonDateSuccessFailure.selector)] = getJsonDateSuccessFailure;

        // schema for service method postDateParam:success:failure:
        MMServiceMethod *postDateParamSuccessFailure = [[MMServiceMethod alloc] init];
        postDateParamSuccessFailure.clazz = [self class];
        postDateParamSuccessFailure.selector = @selector(postDateParam:success:failure:);
        postDateParamSuccessFailure.path = @"date-type/dateparam";
        postDateParamSuccessFailure.requestMethod = MMRequestMethodPOST;
        postDateParamSuccessFailure.produces = [NSSet setWithObjects:@"application/json", nil];

        NSMutableArray *postDateParamSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *postDateParamSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        postDateParamSuccessFailureParam0.name = @"input";
        postDateParamSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeHeader;
        postDateParamSuccessFailureParam0.type = MMServiceIOTypeDate;
        postDateParamSuccessFailureParam0.isOptional = NO;
        [postDateParamSuccessFailureParams addObject:postDateParamSuccessFailureParam0];

        postDateParamSuccessFailure.parameters = postDateParamSuccessFailureParams;
        postDateParamSuccessFailure.returnType = MMServiceIOTypeDate;
        serviceMetaData[NSStringFromSelector(postDateParamSuccessFailure.selector)] = postDateParamSuccessFailure;

        // schema for service method putDateParam:success:failure:
        MMServiceMethod *putDateParamSuccessFailure = [[MMServiceMethod alloc] init];
        putDateParamSuccessFailure.clazz = [self class];
        putDateParamSuccessFailure.selector = @selector(putDateParam:success:failure:);
        putDateParamSuccessFailure.path = @"date-type/dateparam";
        putDateParamSuccessFailure.requestMethod = MMRequestMethodPUT;
        putDateParamSuccessFailure.produces = [NSSet setWithObjects:@"application/json", nil];

        NSMutableArray *putDateParamSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *putDateParamSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        putDateParamSuccessFailureParam0.name = @"input";
        putDateParamSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeHeader;
        putDateParamSuccessFailureParam0.type = MMServiceIOTypeDate;
        putDateParamSuccessFailureParam0.isOptional = NO;
        [putDateParamSuccessFailureParams addObject:putDateParamSuccessFailureParam0];

        putDateParamSuccessFailure.parameters = putDateParamSuccessFailureParams;
        putDateParamSuccessFailure.returnType = MMServiceIOTypeDate;
        serviceMetaData[NSStringFromSelector(putDateParamSuccessFailure.selector)] = putDateParamSuccessFailure;

        // schema for service method getDateParam:success:failure:
        MMServiceMethod *getDateParamSuccessFailure = [[MMServiceMethod alloc] init];
        getDateParamSuccessFailure.clazz = [self class];
        getDateParamSuccessFailure.selector = @selector(getDateParam:success:failure:);
        getDateParamSuccessFailure.path = @"date-type/dateparam";
        getDateParamSuccessFailure.requestMethod = MMRequestMethodGET;
        getDateParamSuccessFailure.produces = [NSSet setWithObjects:@"application/json", nil];

        NSMutableArray *getDateParamSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *getDateParamSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        getDateParamSuccessFailureParam0.name = @"input";
        getDateParamSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeHeader;
        getDateParamSuccessFailureParam0.type = MMServiceIOTypeDate;
        getDateParamSuccessFailureParam0.isOptional = NO;
        [getDateParamSuccessFailureParams addObject:getDateParamSuccessFailureParam0];

        getDateParamSuccessFailure.parameters = getDateParamSuccessFailureParams;
        getDateParamSuccessFailure.returnType = MMServiceIOTypeDate;
        serviceMetaData[NSStringFromSelector(getDateParamSuccessFailure.selector)] = getDateParamSuccessFailure;

        // schema for service method deleteDateParam:success:failure:
        MMServiceMethod *deleteDateParamSuccessFailure = [[MMServiceMethod alloc] init];
        deleteDateParamSuccessFailure.clazz = [self class];
        deleteDateParamSuccessFailure.selector = @selector(deleteDateParam:success:failure:);
        deleteDateParamSuccessFailure.path = @"date-type/dateparam";
        deleteDateParamSuccessFailure.requestMethod = MMRequestMethodDELETE;
        deleteDateParamSuccessFailure.produces = [NSSet setWithObjects:@"application/json", nil];

        NSMutableArray *deleteDateParamSuccessFailureParams = [NSMutableArray array];
        MMServiceMethodParameter *deleteDateParamSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        deleteDateParamSuccessFailureParam0.name = @"input";
        deleteDateParamSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypeHeader;
        deleteDateParamSuccessFailureParam0.type = MMServiceIOTypeDate;
        deleteDateParamSuccessFailureParam0.isOptional = NO;
        [deleteDateParamSuccessFailureParams addObject:deleteDateParamSuccessFailureParam0];

        deleteDateParamSuccessFailure.parameters = deleteDateParamSuccessFailureParams;
        deleteDateParamSuccessFailure.returnType = MMServiceIOTypeDate;
        serviceMetaData[NSStringFromSelector(deleteDateParamSuccessFailure.selector)] = deleteDateParamSuccessFailure;

        // schema for service method postCurrentDateWithSuccess:failure:
        MMServiceMethod *postCurrentDateWithSuccessFailure = [[MMServiceMethod alloc] init];
        postCurrentDateWithSuccessFailure.clazz = [self class];
        postCurrentDateWithSuccessFailure.selector = @selector(postCurrentDateWithSuccess:failure:);
        postCurrentDateWithSuccessFailure.path = @"date-type/currentdate";
        postCurrentDateWithSuccessFailure.requestMethod = MMRequestMethodPOST;
        postCurrentDateWithSuccessFailure.produces = [NSSet setWithObjects:@"application/json", nil];

        NSMutableArray *postCurrentDateWithSuccessFailureParams = [NSMutableArray array];
        postCurrentDateWithSuccessFailure.parameters = postCurrentDateWithSuccessFailureParams;
        postCurrentDateWithSuccessFailure.returnType = MMServiceIOTypeDate;
        serviceMetaData[NSStringFromSelector(postCurrentDateWithSuccessFailure.selector)] = postCurrentDateWithSuccessFailure;

        // schema for service method putCurrentDateWithSuccess:failure:
        MMServiceMethod *putCurrentDateWithSuccessFailure = [[MMServiceMethod alloc] init];
        putCurrentDateWithSuccessFailure.clazz = [self class];
        putCurrentDateWithSuccessFailure.selector = @selector(putCurrentDateWithSuccess:failure:);
        putCurrentDateWithSuccessFailure.path = @"date-type/currentdate";
        putCurrentDateWithSuccessFailure.requestMethod = MMRequestMethodPUT;
        putCurrentDateWithSuccessFailure.produces = [NSSet setWithObjects:@"application/json", nil];

        NSMutableArray *putCurrentDateWithSuccessFailureParams = [NSMutableArray array];
        putCurrentDateWithSuccessFailure.parameters = putCurrentDateWithSuccessFailureParams;
        putCurrentDateWithSuccessFailure.returnType = MMServiceIOTypeDate;
        serviceMetaData[NSStringFromSelector(putCurrentDateWithSuccessFailure.selector)] = putCurrentDateWithSuccessFailure;

        // schema for service method getCurrentDateWithSuccess:failure:
        MMServiceMethod *getCurrentDateWithSuccessFailure = [[MMServiceMethod alloc] init];
        getCurrentDateWithSuccessFailure.clazz = [self class];
        getCurrentDateWithSuccessFailure.selector = @selector(getCurrentDateWithSuccess:failure:);
        getCurrentDateWithSuccessFailure.path = @"date-type/currentdate";
        getCurrentDateWithSuccessFailure.requestMethod = MMRequestMethodGET;
        getCurrentDateWithSuccessFailure.produces = [NSSet setWithObjects:@"application/json", nil];

        NSMutableArray *getCurrentDateWithSuccessFailureParams = [NSMutableArray array];
        getCurrentDateWithSuccessFailure.parameters = getCurrentDateWithSuccessFailureParams;
        getCurrentDateWithSuccessFailure.returnType = MMServiceIOTypeDate;
        serviceMetaData[NSStringFromSelector(getCurrentDateWithSuccessFailure.selector)] = getCurrentDateWithSuccessFailure;

        // schema for service method deleteCurrentDateWithSuccess:failure:
        MMServiceMethod *deleteCurrentDateWithSuccessFailure = [[MMServiceMethod alloc] init];
        deleteCurrentDateWithSuccessFailure.clazz = [self class];
        deleteCurrentDateWithSuccessFailure.selector = @selector(deleteCurrentDateWithSuccess:failure:);
        deleteCurrentDateWithSuccessFailure.path = @"date-type/currentdate";
        deleteCurrentDateWithSuccessFailure.requestMethod = MMRequestMethodDELETE;
        deleteCurrentDateWithSuccessFailure.produces = [NSSet setWithObjects:@"application/json", nil];

        NSMutableArray *deleteCurrentDateWithSuccessFailureParams = [NSMutableArray array];
        deleteCurrentDateWithSuccessFailure.parameters = deleteCurrentDateWithSuccessFailureParams;
        deleteCurrentDateWithSuccessFailure.returnType = MMServiceIOTypeDate;
        serviceMetaData[NSStringFromSelector(deleteCurrentDateWithSuccessFailure.selector)] = deleteCurrentDateWithSuccessFailure;


        __metaData = serviceMetaData;
    });

    return __metaData;
}

@end
