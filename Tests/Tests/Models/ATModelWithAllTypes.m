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

#import "ATModelWithAllTypes.h"
#import "ATSubModel.h"

@implementation ATModelWithAllTypes

+ (NSDictionary *)attributeMappings {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                      @"booleanAttribute": @"booleanAttribute",
                                                                                      @"byteAttribute": @"byteAttribute",
                                                                                      @"charAttribute": @"charAttribute",
                                                                                      @"doubleAttribute": @"doubleAttribute",
                                                                                      @"enumAttribute": @"enumAttribute",
                                                                                      @"floatAttribute": @"floatAttribute",
                                                                                      @"intAttribute": @"intAttribute",
                                                                                      @"integerAttribute": @"integerAttribute",
                                                                                      @"listOfBooleansAttribute": @"listOfBooleansAttribute",
                                                                                      @"listOfBytesAttribute": @"listOfBytesAttribute",
                                                                                      @"listOfCharactersAttribute": @"listOfCharactersAttribute",
                                                                                      @"listOfDoublesAttribute": @"listOfDoublesAttribute",
                                                                                      @"listOfEnumsAttribute": @"listOfEnumsAttribute",
                                                                                      @"listOfFloatsAttribute": @"listOfFloatsAttribute",
                                                                                      @"listOfIntegersAttribute": @"listOfIntegersAttribute",
                                                                                      @"listOfLongsAttribute": @"listOfLongsAttribute",
                                                                                      @"listOfModelsAttribute": @"listOfModelsAttribute",
                                                                                      @"listOfShortsAttribute": @"listOfShortsAttribute",
                                                                                      @"listOfStringsAttribute": @"listOfStringsAttribute",
                                                                                      @"longAttribute": @"longAttribute",
                                                                                      @"mapOfBooleansAttribute": @"mapOfBooleansAttribute",
                                                                                      @"mapOfBytesAttribute": @"mapOfBytesAttribute",
                                                                                      @"mapOfCharactersAttribute": @"mapOfCharactersAttribute",
                                                                                      @"mapOfDoublesAttribute": @"mapOfDoublesAttribute",
                                                                                      @"mapOfEnumsAttribute": @"mapOfEnumsAttribute",
                                                                                      @"mapOfFloatsAttribute": @"mapOfFloatsAttribute",
                                                                                      @"mapOfIntegersAttribute": @"mapOfIntegersAttribute",
                                                                                      @"mapOfLongsAttribute": @"mapOfLongsAttribute",
                                                                                      @"mapOfModelsAttribute": @"mapOfModelsAttribute",
                                                                                      @"mapOfShortsAttribute": @"mapOfShortsAttribute",
                                                                                      @"mapOfStringsAttribute": @"mapOfStringsAttribute",
                                                                                      @"shortAttribute": @"shortAttribute",
                                                                                      @"stringAttribute": @"stringAttribute",
                                                                                      @"subModelAttribute": @"subModelAttribute",
    }];
    [dictionary addEntriesFromDictionary:[super attributeMappings]];
    return dictionary;
}

+ (NSDictionary *)listAttributeTypes {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:@{
        @"listOfEnumsAttribute" : ATEnumAttributeContainer.class,
        @"listOfModelsAttribute" : ATSubModel.class,
    }];
    [dictionary addEntriesFromDictionary:[super listAttributeTypes]];
    return dictionary;
}

+ (NSDictionary *)mapAttributeTypes {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:@{
        @"mapOfEnumsAttribute" : ATEnumAttributeContainer.class,
        @"mapOfModelsAttribute" : ATSubModel.class,
    }];
    [dictionary addEntriesFromDictionary:[super mapAttributeTypes]];
    return dictionary;
}

+ (NSDictionary *)enumAttributeTypes {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:@{
        @"enumAttribute" : ATEnumAttributeContainer.class,
    }];
    [dictionary addEntriesFromDictionary:[super enumAttributeTypes]];
    return dictionary;
}

+ (NSArray *)charAttributes {
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[
        @"byteAttribute",
    ]];
    [array addObjectsFromArray:[super charAttributes]];
    return array;
}

@end
