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

@class ATGHIssue;

@protocol ATGitHubServiceProtocol

@optional

- (MMCall *)listRepos:(NSString *)user
              success:(void (^)(NSArray *repos))success
              failure:(void (^)(NSError *error))failure;

// GET /repos/:owner/:repo/issues
// https://api.github.com/repos/octocat/Spoon-Knife/issues
- (MMCall *)listIssues:(NSString *)owner
                  repo:(NSString *)repo
               success:(void (^)(NSArray *issues))success
               failure:(void (^)(NSError *error))failure;

// /repos/:owner/:repo/issues/:number
// https://api.github.com/repos/octocat/Spoon-Knife/issues/5566
- (MMCall *)issue:(NSString *)owner
             repo:(NSString *)repo
      issueNumber:(long long)issueNumber
          success:(void (^)(ATGHIssue *issue))success
          failure:(void (^)(NSError *error))failure;

@end

@interface ATGitHubService : MMService <ATGitHubServiceProtocol>

@end