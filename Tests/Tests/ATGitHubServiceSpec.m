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

#import <Kiwi/Kiwi.h>
#import "ATGitHubService.h"
#import "ATGHIssue.h"
#import "ATGHUser.h"

#define DEFAULT_TEST_TIMEOUT 5.0

SPEC_BEGIN(ATGitHubServiceSpec)

    describe(@"ATGitHubService", ^{

        __block MMServiceAdapter *_serviceAdapter;
        __block ATGitHubService *_service;

        beforeAll(^{
            _serviceAdapter = [MMServiceAdapter adapter];
            NSURL *URL = [NSURL URLWithString:@"https://api.github.com"];
            _serviceAdapter.endPoint = [MMEndPoint endPointWithURL:URL];
            _service = [ATGitHubService serviceWithServiceAdapter:_serviceAdapter];
        });

        context(@"when fetching ocotocat's repos", ^{
            it(@"should return atleast 5 items", ^{
                __block NSArray *_repos;

                [[_service.serviceAdapter should] equal:_serviceAdapter];
                [_service listRepos:@"octocat" success:^(NSArray *repos) {
                    _repos = repos;
                } failure:^(NSError *error) {
                    fail(@"should not fail!");
                }];

                // Assert
                [[expectFutureValue(_repos) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] haveCountOfAtLeast:5];
            });
        });

        context(@"when fetching issues filed in ocotocat's Spoon-Knife repo", ^{
            it(@"should return atleast 5 items", ^{
                __block NSArray *_issues;

                [_service listIssues:@"octocat" repo:@"Spoon-Knife" success:^(NSArray *issues) {
                    _issues = issues;
                    for (ATGHIssue *issue in issues) {
                        [[issue should] beKindOfClass:ATGHIssue.class];
                        [[issue.user should] beKindOfClass:ATGHUser.class];
                    }
                }            failure:^(NSError *error) {
                    fail(@"should not fail!");
                }];

                // Assert
                [[expectFutureValue(_issues) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] haveCountOfAtLeast:5];
            });
        });

        context(@"when fetching a particular filed in ocotocat's Spoon-Knife repo", ^{
            it(@"should return the correct issue", ^{
                __block ATGHIssue *_issue;

                [_service issue:@"octocat" repo:@"Spoon-Knife" issueNumber:5566 success:^(ATGHIssue *issue) {
                    _issue = issue;
                } failure:^(NSError *error) {
                    fail(@"should not fail!");
                }];

                // Assert
                [[expectFutureValue(_issue.reporterLogin) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:@"priteshshah1983"];
                [[expectFutureValue(_issue.title) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:@"Testing issues"];
                [[expectFutureValue(_issue.user.login) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:@"priteshshah1983"];
            });
        });
    });

SPEC_END