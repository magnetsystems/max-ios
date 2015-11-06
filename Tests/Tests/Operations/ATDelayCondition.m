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

#import "ATDelayCondition.h"

@implementation ATDelayCondition

#pragma mark - MMCondition methods

+ (NSString * __nonnull)name {
    return @"ATDelayCondition";
}

+ (BOOL)isMutuallyExclusive {
    return NO;
}

- (NSOperation * __nullable)dependencyForOperation:(Operation * __nonnull)operation {
    return nil;
}

/// Evaluate the condition, to see if it has been satisfied or not.
- (void)evaluateForOperation:(Operation * __nonnull)operation completion:(void (^ __nonnull)(NSError * __nullable))completion {
    // Delay execution of my block for 10 seconds.
    dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC);
    dispatch_after(when, dispatch_get_main_queue(), ^{
        completion(nil);
    });
}

@end
