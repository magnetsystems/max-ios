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

#import "ATGHIssue.h"


@implementation ATGHIssue

+ (NSDictionary *)attributeMappings {
    return @{
            @"URL": @"url",
            @"HTMLURL": @"html_url",
            @"number": @"number",
            @"state": @"state",
            @"reporterLogin": @"user.login",
            @"updatedAt": @"updated_at"
    };
}

+ (NSDictionary *)enumAttributeTypes {
    return @{
            @"state" : ATGHIssueStateContainer.class,
    };
}

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    return dateFormatter;
}

+ (NSValueTransformer *)updatedAtJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^(NSString *str, BOOL __unused *success, NSError __unused **error) {
        return [self.dateFormatter dateFromString:str];
    } reverseBlock:^(NSDate *date, BOOL __unused *success, NSError __unused **error) {
        return [self.dateFormatter stringFromDate:date];
    }];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self == nil) return nil;

    // Store a value that needs to be determined locally upon initialization.
    _retrievedAt = [NSDate date];

    return self;
}

@end