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

#import "ATGitHubService.h"
#import "ATGHIssue.h"


@implementation ATGitHubService

+ (NSDictionary *)metaData {
    static NSDictionary *__metaData = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSMutableDictionary *serviceMetaData = [NSMutableDictionary dictionary];

        MMServiceMethod *listReposSuccessFailure = [[MMServiceMethod alloc] init];
        listReposSuccessFailure.path = @"/users/{user}/repos";
        listReposSuccessFailure.requestMethod = MMRequestMethodGET;

        NSMutableArray *listReposSuccessFailureParams = [[NSMutableArray alloc] init];
        MMServiceMethodParameter *listReposSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        listReposSuccessFailureParam0.name = @"user";
        listReposSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypePath;
        listReposSuccessFailureParam0.type = MMServiceIOTypeString;
        listReposSuccessFailureParam0.isOptional = NO;
        [listReposSuccessFailureParams addObject:listReposSuccessFailureParam0];

        listReposSuccessFailure.parameters = listReposSuccessFailureParams;
        listReposSuccessFailure.returnType = MMServiceIOTypeArray;
        serviceMetaData[NSStringFromSelector(@selector(listRepos:success:failure:))] = listReposSuccessFailure;

        MMServiceMethod *listIssuesRepoSuccessFailure = [[MMServiceMethod alloc] init];
        listIssuesRepoSuccessFailure.path = @"/repos/{owner}/{repo}/issues";
        listIssuesRepoSuccessFailure.requestMethod = MMRequestMethodGET;

        NSMutableArray *listIssuesRepoSuccessFailureParams = [[NSMutableArray alloc] init];
        MMServiceMethodParameter *listIssuesRepoSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        listIssuesRepoSuccessFailureParam0.name = @"owner";
        listIssuesRepoSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypePath;
        listIssuesRepoSuccessFailureParam0.type = MMServiceIOTypeString;
        listIssuesRepoSuccessFailureParam0.isOptional = NO;
        [listIssuesRepoSuccessFailureParams addObject:listIssuesRepoSuccessFailureParam0];

        MMServiceMethodParameter *listIssuesRepoSuccessFailureParam1 = [[MMServiceMethodParameter alloc] init];
        listIssuesRepoSuccessFailureParam1.name = @"repo";
        listIssuesRepoSuccessFailureParam1.requestParameterType = MMServiceMethodParameterTypePath;
        listIssuesRepoSuccessFailureParam1.type = MMServiceIOTypeString;
        listIssuesRepoSuccessFailureParam1.isOptional = NO;
        [listIssuesRepoSuccessFailureParams addObject:listIssuesRepoSuccessFailureParam1];

        listIssuesRepoSuccessFailure.parameters = listIssuesRepoSuccessFailureParams;
        listIssuesRepoSuccessFailure.returnType = MMServiceIOTypeArray;
        listIssuesRepoSuccessFailure.returnComponentType = MMServiceIOTypeMagnetNode;
        listIssuesRepoSuccessFailure.returnTypeClass = ATGHIssue.class;
        serviceMetaData[NSStringFromSelector(@selector(listIssues:repo:success:failure:))] = listIssuesRepoSuccessFailure;


        MMServiceMethod *issueRepoIssueNumberSuccessFailure = [[MMServiceMethod alloc] init];
        issueRepoIssueNumberSuccessFailure.path = @"/repos/{owner}/{repo}/issues/{number}";
        issueRepoIssueNumberSuccessFailure.requestMethod = MMRequestMethodGET;

        NSMutableArray *issueRepoIssueNumberSuccessFailureParams = [[NSMutableArray alloc] init];
        MMServiceMethodParameter *issueRepoIssueNumberSuccessFailureParam0 = [[MMServiceMethodParameter alloc] init];
        issueRepoIssueNumberSuccessFailureParam0.name = @"owner";
        issueRepoIssueNumberSuccessFailureParam0.requestParameterType = MMServiceMethodParameterTypePath;
        issueRepoIssueNumberSuccessFailureParam0.type = MMServiceIOTypeString;
        issueRepoIssueNumberSuccessFailureParam0.isOptional = NO;
        [issueRepoIssueNumberSuccessFailureParams addObject:issueRepoIssueNumberSuccessFailureParam0];

        MMServiceMethodParameter *issueRepoIssueNumberSuccessFailureParam1 = [[MMServiceMethodParameter alloc] init];
        issueRepoIssueNumberSuccessFailureParam1.name = @"repo";
        issueRepoIssueNumberSuccessFailureParam1.requestParameterType = MMServiceMethodParameterTypePath;
        issueRepoIssueNumberSuccessFailureParam1.type = MMServiceIOTypeString;
        issueRepoIssueNumberSuccessFailureParam1.isOptional = NO;
        [issueRepoIssueNumberSuccessFailureParams addObject:issueRepoIssueNumberSuccessFailureParam1];

        MMServiceMethodParameter *issueRepoIssueNumberSuccessFailureParam2 = [[MMServiceMethodParameter alloc] init];
        issueRepoIssueNumberSuccessFailureParam2.name = @"number";
        issueRepoIssueNumberSuccessFailureParam2.requestParameterType = MMServiceMethodParameterTypePath;
        issueRepoIssueNumberSuccessFailureParam2.type = MMServiceIOTypeLongLong;
        issueRepoIssueNumberSuccessFailureParam2.isOptional = NO;
        [issueRepoIssueNumberSuccessFailureParams addObject:issueRepoIssueNumberSuccessFailureParam2];

        issueRepoIssueNumberSuccessFailure.parameters = issueRepoIssueNumberSuccessFailureParams;
        issueRepoIssueNumberSuccessFailure.returnType = MMServiceIOTypeMagnetNode;
        issueRepoIssueNumberSuccessFailure.returnTypeClass = ATGHIssue.class;
        serviceMetaData[NSStringFromSelector(@selector(issue:repo:issueNumber:success:failure:))] = issueRepoIssueNumberSuccessFailure;




        __metaData = serviceMetaData;
    });

    return __metaData;
}

@end