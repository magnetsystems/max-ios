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
#import "MMEndPoint.h"

SPEC_BEGIN(MMEndPointSpec)

    describe(@"MMEndPoint", ^{
        NSURL *URL = [NSURL URLWithString:@"https://api.github.com"];

        context(@"when passed a URL", ^{
            it(@"should return a valid endpoint with the default name", ^{
                MMEndPoint *endPoint = [MMEndPoint endPointWithURL:URL];
                [[endPoint.URL should] equal:URL];
                [[endPoint.name should] equal:@"MMDefaultName"];
            });
        });

        context(@"when passed a URL and a name", ^{
            it(@"should return a valid endpoint", ^{
                NSString *name = @"GitHub";
                MMEndPoint *endPoint = [MMEndPoint endPointWithURL:URL name:name];
                [[endPoint.URL should] equal:URL];
                [[endPoint.name should] equal:name];
            });
        });
    });

SPEC_END
