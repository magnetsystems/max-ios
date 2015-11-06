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
#import "ATPrimitiveTypeService.h"

#define DEFAULT_TEST_TIMEOUT 5.0

static NSString * const kClientID = @"73728e03-c3ee-457a-a06a-4e59c765eedd";
static NSString * const kClientSecret = @"Wu0vLi0YzkurLj8mVng7S2f8kJXSaC3Z5En8J6M3kM8";

SPEC_BEGIN(MMServiceAdapterSpec)

    describe(@"MMServiceAdapter", ^{
        context(@"when adapter is called", ^{
            it(@"should return a valid service adapter", ^{
                [[[MMServiceAdapter adapter] should] beKindOfClass:[MMServiceAdapter class]];
            });
        });

        context(@"when createService is called", ^{
            context(@"with a MMService subclass", ^{
                it(@"should return an instance of the correct class", ^{
                    MMServiceAdapter *serviceAdapter = [MMServiceAdapter adapter];
                    serviceAdapter.requestInterceptor = ^(id <MMRequestFacade> request) {
                        [request addValue:@"05a40e3f8f81e89d342d1bea65d53ed5a0d3c3df" forHTTPHeaderField:@"X-Api-Key"];
                    };
                    serviceAdapter.profiler = [MMProfiler profilerWithBeforeCallData:nil
                                                                          completion:^(id requestInfo, long elapsedTime, int statusCode, id beforeCallData) {

                                                                          }];
                    serviceAdapter.client = [MMClient client];
                    NSURL *URL = [NSURL URLWithString:@"https://api.github.com"];
                    serviceAdapter.endPoint = [MMEndPoint endPointWithURL:URL];
                    ATPrimitiveTypeService *service = [serviceAdapter createService:[ATPrimitiveTypeService class]];
                    [[service should] beKindOfClass:[ATPrimitiveTypeService class]];
//                    [[service.serviceAdapter should] equal:serviceAdapter];
                });
            });
        });
	});

SPEC_END
