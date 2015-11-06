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
#import "MMValueTransformer.h"
//#import "TESTNodeWithAllTypes.h"

SPEC_BEGIN(MMValueTransformerSpec)

    describe(@"MMValueTransformer", ^{

        context(@"when calling dateTransformer", ^{

            it(@"should return the correct reversible transformer", ^{
                NSDate *input = [NSDate dateWithTimeIntervalSince1970:NSTimeIntervalSince1970];
                NSString *output = [[MMValueTransformer dateTransformer] reverseTransformedValue:input];
                [[output should] equal:@"2001-01-01T00:00:00.000Z"];
                [[[[MMValueTransformer dateTransformer] transformedValue:output] should] equal:input];
            });
        });

        context(@"when calling urlTransformer", ^{

            it(@"should return the correct reversible transformer", ^{
                NSURL *input = [NSURL URLWithString:@"http://magnet.com"];
                NSString *output = [[MMValueTransformer urlTransformer] reverseTransformedValue:input];
                [[output should] equal:@"http://magnet.com"];
                [[[[MMValueTransformer urlTransformer] transformedValue:output] should] equal:input];
            });
        });

        context(@"when calling dataTransformer", ^{

            it(@"should return the correct reversible transformer", ^{
                NSData *input = [@"Hello Magnet" dataUsingEncoding:NSUTF8StringEncoding];
                NSString *output = [[MMValueTransformer dataTransformer] reverseTransformedValue:input];
                [[output should] equal:@"SGVsbG8gTWFnbmV0"]; // base64(Hello Magnet) = SGVsbG8gTWFnbmV0
                [[[[MMValueTransformer dataTransformer] transformedValue:output] should] equal:input];
            });
        });

        context(@"when calling unicharTransformer", ^{

            it(@"should return the correct reversible transformer", ^{
                NSNumber *input = @163;
                id output = [[MMValueTransformer unicharTransformer] reverseTransformedValue:input];
                [[output should] equal:@"£"];
                [[[[MMValueTransformer unicharTransformer] transformedValue:output] should] equal:input];
            });
        });

        context(@"when calling floatTransformer", ^{

            it(@"should return the correct reversible transformer", ^{
                NSNumber *input = @(FLT_MAX);
                id output = [[MMValueTransformer floatTransformer] reverseTransformedValue:input];
                [[[[MMValueTransformer floatTransformer] transformedValue:output] should] equal:output];
            });
        });

        context(@"when calling doubleTransformer", ^{

            it(@"should return the correct reversible transformer", ^{
                NSNumber *input = @(DBL_MAX);
                id output = [[MMValueTransformer doubleTransformer] reverseTransformedValue:input];
                [[[[MMValueTransformer doubleTransformer] transformedValue:output] should] equal:output];
            });
        });

        context(@"when calling doubleTransformer", ^{

            it(@"should return the correct reversible transformer", ^{
                NSNumber *input = @(LLONG_MAX);
                id output = [[MMValueTransformer longLongTransformer] reverseTransformedValue:input];
                [[[[MMValueTransformer longLongTransformer] transformedValue:output] should] equal:output];
            });
        });

        context(@"when calling booleanTransformer", ^{

            it(@"should return the correct reversible transformer", ^{
                NSNumber *input = @(YES);
                id output = [[MMValueTransformer longLongTransformer] reverseTransformedValue:input];
                [[[[MMValueTransformer longLongTransformer] transformedValue:output] should] equal:output];
            });
        });

//        context(@"when calling enumTransformerForKey:", ^{
//
//            it(@"should return the correct reversible transformer", ^{
//                NSNumber *input = @(EnumAttributeINPROGRESS);
//                NSString *output = [[MMValueTransformer enumTransformerForKey:@"enumAttribute"] reverseTransformedValue:input];
//                [[output should] equal:@"INPROGRESS"];
//                [[[[MMValueTransformer enumTransformerForKey:@"enumAttribute"] transformedValue:output] should] equal:input];
//            });
//        });
//
//        context(@"when calling resourceNodeTransformerForClass:", ^{
//
//            it(@"should return the correct reversible transformer", ^{
//                TESTNodeWithAllTypes *input = [[TESTNodeWithAllTypes alloc] init];
//                input.stringAttribute = @"Hello Magnet";
//                NSDictionary *output = [[MMValueTransformer resourceNodeTransformerForClass:TESTNodeWithAllTypes.class] reverseTransformedValue:input];
//                [[output[@"stringAttribute"] should] equal:input.stringAttribute];
//                [[[[MMValueTransformer resourceNodeTransformerForClass:TESTNodeWithAllTypes.class] transformedValue:output] should] equal:input];
//            });
//        });

//        context(@"when calling listTransformerForType:", ^{
//
//            it(@"should return the correct reversible transformer", ^{
//                NSArray *input = @[ [NSURL URLWithString:@"http://magnet.com"], [NSURL URLWithString:@"http://google.com"] ];
//                NSArray *output = [[MMValueTransformer listTransformerForType:@"_uri"] reverseTransformedValue:input];
//                [[output should] equal:@[ @"http://magnet.com", @"http://google.com"] ];
//                [[[[MMValueTransformer listTransformerForType:@"_uri"] transformedValue:output] should] equal:input];
//
//                input = @[ [NSDate dateWithTimeIntervalSince1970:NSTimeIntervalSince1970], [NSDate dateWithTimeIntervalSince1970:0] ];
//                output = [[MMValueTransformer listTransformerForType:@"_date"] reverseTransformedValue:input];
//                [[output should] equal:@[ @"2001-01-01T00:00:00Z", @"1970-01-01T00:00:00Z"] ];
//                [[[[MMValueTransformer listTransformerForType:@"_date"] transformedValue:output] should] equal:input];
//
//                input = @[ [NSDecimalNumber minimumDecimalNumber], [NSDecimalNumber maximumDecimalNumber] ];
//                output = [[MMValueTransformer listTransformerForType:@"_big_decimal"] reverseTransformedValue:input];
//                [[output should] equal:@[ [NSDecimalNumber minimumDecimalNumber].stringValue, [NSDecimalNumber maximumDecimalNumber].stringValue] ];
//                [[[[MMValueTransformer listTransformerForType:@"_big_decimal"] transformedValue:output] should] equal:input];
//
//                input = @[ [NSDecimalNumber minimumDecimalNumber], [NSDecimalNumber maximumDecimalNumber] ];
//                output = [[MMValueTransformer listTransformerForType:@"_big_integer"] reverseTransformedValue:input];
//                [[output should] equal:@[ [NSDecimalNumber minimumDecimalNumber].stringValue, [NSDecimalNumber maximumDecimalNumber].stringValue] ];
//                [[[[MMValueTransformer listTransformerForType:@"_big_integer"] transformedValue:output] should] equal:input];
//
//                input = @[ [NSDecimalNumber minimumDecimalNumber], [NSDecimalNumber maximumDecimalNumber] ];
//                output = [[MMValueTransformer listTransformerForType:@"_big_integer"] reverseTransformedValue:input];
//                [[output should] equal:@[ [NSDecimalNumber minimumDecimalNumber].stringValue, [NSDecimalNumber maximumDecimalNumber].stringValue] ];
//                [[[[MMValueTransformer listTransformerForType:@"_big_integer"] transformedValue:output] should] equal:input];
//
//                TESTNodeWithAllTypes *input1 = [[TESTNodeWithAllTypes alloc] init];
//                input1.stringAttribute = @"Hello Magnet";
//                TESTNodeWithAllTypes *input2 = [[TESTNodeWithAllTypes alloc] init];
//                input2.stringAttribute = @"Hello World";
//
//                input = @[ input1, input2 ];
//                output = [[MMValueTransformer listTransformerForType:@"_bean:TESTNodeWithAllTypes"] reverseTransformedValue:input];
//                [[output[0][@"stringAttribute"] should] equal:input1.stringAttribute];
//                [[output[1][@"stringAttribute"] should] equal:input2.stringAttribute];
//                [[[[MMValueTransformer listTransformerForType:@"_bean:TESTNodeWithAllTypes"] transformedValue:output] should] equal:input];
//
//                BOOL i1 = NO;
//                NSValue *param1 = [NSValue value:&i1 withObjCType:@encode(BOOL)];
//                BOOL i2 = YES;
//                NSValue *param2 = [NSValue value:&i2 withObjCType:@encode(BOOL)];
//                input = @[param1, param2];
//                output = [[MMValueTransformer listTransformerForType:@"_boolean"] reverseTransformedValue:input];
//                [[output should] equal:@[ @NO, @YES ]];
//                [[[[MMValueTransformer listTransformerForType:@"_boolean"] transformedValue:output] should] equal:input];
//            });
//        });

        context(@"when calling bigDecimalTransformer", ^{

            it(@"should return the correct reversible transformer", ^{
                NSDecimalNumber *input = [NSDecimalNumber maximumDecimalNumber];
                NSNumber *output = [[MMValueTransformer bigDecimalTransformer] reverseTransformedValue:input];
                [[output should] equal:input.stringValue];
                [[[[MMValueTransformer bigDecimalTransformer] transformedValue:output] should] equal:input];
            });
        });
    });

SPEC_END