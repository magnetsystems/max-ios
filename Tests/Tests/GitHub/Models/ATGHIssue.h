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
#import "ATGHIssueState.h"

@class ATGHUser;

@interface ATGHIssue : MMModel

@property (nonatomic, copy, readonly) NSURL *URL;

@property (nonatomic, copy, readonly) NSURL *HTMLURL;

@property (nonatomic, copy, readonly) NSNumber *number;

@property (nonatomic, assign, readonly) ATGHIssueState state;

@property (nonatomic, copy, readonly) NSString *reporterLogin;

@property (nonatomic, strong, readonly) ATGHUser *user;

@property (nonatomic, copy, readonly) NSDate *updatedAt;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *body;

@property (nonatomic, copy, readonly) NSDate *retrievedAt;

@end