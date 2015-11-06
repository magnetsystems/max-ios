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

#import "MMXModule.h"

@implementation MMXModule

+ (id <MMModule> __nonnull)sharedInstance {
    return [[MMXModule alloc] init];
}

- (NSString *)name {
    return @"MMX";
}

- (void)shouldInitializeWithConfiguration:(NSDictionary * __nonnull)configuration success:(void (^ __nonnull)(void))success failure:(void (^ __nonnull)(NSError * __nonnull))failure {
    
    if (success) {
        success();
    }
}

- (void)didReceiveAppToken:(NSString * __nonnull)appToken appID:(NSString * __nonnull)appID deviceID:(NSString * __nonnull)deviceID {
    
}

- (void)didReceiveUserToken:(NSString * __nonnull)userToken userID:(NSString * __nonnull)userID deviceID:(NSString * __nonnull)deviceID {
    
}

@end
