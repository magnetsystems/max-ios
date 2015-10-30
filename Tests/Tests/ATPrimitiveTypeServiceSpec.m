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
#import "ATModelWithAllTypes.h"
#import "ATSubModel.h"
#import "ATServiceAdapterHelper.h"
#import <AFNetworking/AFNetworkReachabilityManager.h>
#import <AFNetworking/AFHTTPSessionManager.h>
#import "ATDictionaryConfiguration.h"
#import "ATDelayCondition.h"


#define DEFAULT_TEST_TIMEOUT 10.0

SPEC_BEGIN(ATPrimitiveTypeServiceSpec)

    __block MMServiceAdapter *_HTTTPServiceAdapter;
    __block __unused MMServiceAdapter *_WebSocketServiceAdapter;
    __block ATPrimitiveTypeService *_HTTPService;
    __block ATPrimitiveTypeService *_WebSocketService;
    __block OperationQueue *_queue;

    void (^verifyShortAsFormParameter)(ATPrimitiveTypeService *, short) = ^(ATPrimitiveTypeService *service, short input) {

        __block short _response;


        // Creation
        MMCall *call = [service returnShortWithFormParameters:input
                                                      success:^(short response) {
                                                          _response = response;
                                                      }
                                                      failure:^(NSError *error) {
                                                      }];

        // Configuration
//        call.useMock = YES;

//        ATDelayCondition *condition = [[ATDelayCondition alloc] init];
//        [call addCondition:condition];
        
        // Execution/Invocation
        [call executeInBackground:nil];

        // Assert
        // FIXME: The first test takes forever! Bumping up the time to 15 seconds for now.
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(15.0)] equal:theValue(input)];
//        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input)];
    };

    void (^verifyShortAsQueryParameter)(ATPrimitiveTypeService *, short) = ^(ATPrimitiveTypeService *service, short input) {
        
//        if (service.serviceAdapter.networkReachabilityStatusBlock) {
//            service.serviceAdapter.networkReachabilityStatusBlock(AFNetworkReachabilityStatusNotReachable);
//        }
        
        __block short _response;
        MMCall *call = [service returnShort:input
                                    success:^(short response) {
                                        _response = response;
                                    }
                                    failure:^(NSError *error) {
                                    }];

//        MMReliableCallOptions *o = [[MMReliableCallOptions alloc] init];
//        [call executeEventually:o];
//        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
//            if (service.serviceAdapter.networkReachabilityStatusBlock) {
//                service.serviceAdapter.networkReachabilityStatusBlock(AFNetworkReachabilityStatusReachableViaWiFi);
//            }
//        });
        
        [call executeInBackground:nil];
        
        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(10)] equal:theValue(input)];
    };

    void (^verifyShortAsBodyParameter)(ATPrimitiveTypeService *, short) = ^(ATPrimitiveTypeService *service, short input) {

        __block short _response;
        MMCall *call = [service returnShortWithBodyParameters:input
                                                      success:^(short response) {
                                                          _response = response;
                                                      }
                                                      failure:^(NSError *error) {
                                                      }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input)];
    };

    void (^verifyIntAsFormParameter)(ATPrimitiveTypeService *, int) = ^(ATPrimitiveTypeService *service, int input) {

        __block int _response;
        MMCall *call = [service returnIntWithFormParameters:input
                                                    success:^(int response) {
                                                        _response = response;
                                                    }
                                                    failure:^(NSError *error) {
                                                    }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input)];
    };

    void (^verifyIntAsQueryParameter)(ATPrimitiveTypeService *, int) = ^(ATPrimitiveTypeService *service, int input) {

        __block int _response;
        MMCall *call = [service returnInt:input
                                  success:^(int response) {
                                      _response = response;
                                  }
                                  failure:^(NSError *error) {
                                  }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input)];
    };

    void (^verifyIntAsBodyParameter)(ATPrimitiveTypeService *, int) = ^(ATPrimitiveTypeService *service, int input) {

        __block int _response;
        MMCall *call = [service returnIntWithBodyParameters:input
                                                    success:^(int response) {
                                                        _response = response;
                                                    }
                                                    failure:^(NSError *error) {
                                                    }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input)];
    };

    void (^verifyDateAsFormParameter)(ATPrimitiveTypeService *, NSDate *) = ^(ATPrimitiveTypeService *service, NSDate *input) {
        
        __block NSDate *_response;
        MMCall *call = [service returnDateWithFormParameters:input
                                                     success:^(NSDate *response) {
                                                         _response = response;
                                                     }
                                                     failure:^(NSError *error) {
                                                     }];
        
        [call executeInBackground:nil];
        
        // Assert
        [[expectFutureValue(theValue([_response compare:input])) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(NSOrderedSame)];
    };

    void (^verifyDateAsQueryParameter)(ATPrimitiveTypeService *, NSDate *) = ^(ATPrimitiveTypeService *service, NSDate *input) {
        
        __block NSDate *_response;
        MMCall *call = [service returnDate:input
                                   success:^(NSDate *response) {
                                       _response = response;
                                   }
                                   failure:^(NSError *error) {
                                   }];
        
        [call executeInBackground:nil];
        
        // Assert
        [[expectFutureValue(theValue([_response compare:input])) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(NSOrderedSame)];
    };

    void (^verifyDateAsBodyParameter)(ATPrimitiveTypeService *, NSDate *) = ^(ATPrimitiveTypeService *service, NSDate *input) {
        
        __block NSDate *_response;
        MMCall *call = [service returnDateWithBodyParameters:input
                                                     success:^(NSDate *response) {
                                                         _response = response;
                                                     }
                                                     failure:^(NSError *error) {
                                                     }];
        
        [call executeInBackground:nil];
        
        // Assert
        [[expectFutureValue(theValue([_response compare:input])) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(NSOrderedSame)];
    };


    void (^verifyCharAsFormParameter)(ATPrimitiveTypeService *, char) = ^(ATPrimitiveTypeService *service, char input) {

        __block char _response;
        MMCall *call = [service returnByteWithFormParameters:input
                                                     success:^(char response) {
                                                         _response = response;
                                                     }
                                                     failure:^(NSError *error) {
                                                     }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input)];
    };

    void (^verifyCharAsQueryParameter)(ATPrimitiveTypeService *, char) = ^(ATPrimitiveTypeService *service, char input) {

        __block char _response;
        MMCall *call = [service returnByte:input
                                   success:^(char response) {
                                       _response = response;
                                   }
                                   failure:^(NSError *error) {
                                   }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input)];
    };

    void (^verifyCharAsBodyParameter)(ATPrimitiveTypeService *, char) = ^(ATPrimitiveTypeService *service, char input) {

        __block char _response;
        MMCall *call = [service returnByteWithBodyParameters:input
                                                     success:^(char response) {
                                                         _response = response;
                                                     }
                                                     failure:^(NSError *error) {
                                                     }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input)];
    };

    void (^verifyVoid)(ATPrimitiveTypeService *) = ^(ATPrimitiveTypeService *service) {

        __block BOOL _response;
        MMCall *call = [service returnVoidWithSuccess:^{
                    _response = YES;
                }
                                              failure:^(NSError *error) {
                                              }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] beYes];
    };

    void (^verifyBooleanAsFormParameter)(ATPrimitiveTypeService *, BOOL) = ^(ATPrimitiveTypeService *service, BOOL input) {

        __block BOOL _response;
        MMCall *call = [service returnBooleanWithFormParameters:input
                                                        success:^(BOOL response) {
                                                            _response = response;
                                                        }
                                                        failure:^(NSError *error) {
                                                        }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input)];
    };

    void (^verifyBooleanAsQueryParameter)(ATPrimitiveTypeService *, BOOL) = ^(ATPrimitiveTypeService *service, BOOL input) {

        __block BOOL _response;
        MMCall *call = [service returnBoolean:input
                                      success:^(BOOL response) {
                                          _response = response;
                                      }
                                      failure:^(NSError *error) {
                                      }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input)];
    };

    void (^verifyBooleanAsBodyParameter)(ATPrimitiveTypeService *, BOOL) = ^(ATPrimitiveTypeService *service, BOOL input) {

        __block BOOL _response;
        MMCall *call = [service returnBooleanWithBodyParameters:input
                                                        success:^(BOOL response) {
                                                            _response = response;
                                                        }
                                                        failure:^(NSError *error) {
                                                        }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input)];
    };

    void (^verifyUniCharAsFormParameter)(ATPrimitiveTypeService *, unichar) = ^(ATPrimitiveTypeService *service, unichar input) {

        __block unichar _response;
        MMCall *call = [service returnCharWithFormParameters:input
                                                     success:^(unichar response) {
                                                         _response = response;
                                                     }
                                                     failure:^(NSError *error) {
                                                     }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input)];
    };

    void (^verifyUniCharAsQueryParameter)(ATPrimitiveTypeService *, unichar) = ^(ATPrimitiveTypeService *service, unichar input) {

        __block unichar _response;
        MMCall *call = [service returnChar:input
                                   success:^(unichar response) {
                                       _response = response;
                                   }
                                   failure:^(NSError *error) {
                                   }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input)];
    };

    void (^verifyUniCharAsBodyParameter)(ATPrimitiveTypeService *, unichar) = ^(ATPrimitiveTypeService *service, unichar input) {

        __block unichar _response;
        MMCall *call = [service returnCharWithBodyParameters:input
                                                     success:^(unichar response) {
                                                         _response = response;
                                                     }
                                                     failure:^(NSError *error) {
                                                     }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input)];
    };

    void (^verifyLongLongAsFormParameter)(ATPrimitiveTypeService *, long long) = ^(ATPrimitiveTypeService *service, long long input) {

        __block long long _response;
        MMCall *call = [service returnLongWithFormParameters:input
                                                     success:^(long long response) {
                                                         _response = response;
                                                     }
                                                     failure:^(NSError *error) {
                                                     }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input)];
    };

    void (^verifyLongLongAsQueryParameter)(ATPrimitiveTypeService *, long long) = ^(ATPrimitiveTypeService *service, long long input) {

        __block long long _response;
        MMCall *call = [service returnLong:input
                                   success:^(long long response) {
                                       _response = response;
                                   }
                                   failure:^(NSError *error) {
                                   }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input)];
    };

    void (^verifyLongLongAsBodyParameter)(ATPrimitiveTypeService *, long long) = ^(ATPrimitiveTypeService *service, long long input) {

        __block long long _response;
        MMCall *call = [service returnLongWithBodyParameters:input
                                                     success:^(long long response) {
                                                         _response = response;
                                                     }
                                                     failure:^(NSError *error) {
                                                     }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input)];
    };

    void (^verifyStringAsFormParameter)(ATPrimitiveTypeService *, NSString *) = ^(ATPrimitiveTypeService *service, NSString *input) {

        __block NSString *_response;
        MMCall *call = [service returnStringWithFormParameters:input
                                                       success:^(NSString *response) {
                                                           _response = response;
                                                       }
                                                       failure:^(NSError *error) {
                                                       }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(_response) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input];
    };

    void (^verifyStringAsQueryParameter)(ATPrimitiveTypeService *, NSString *) = ^(ATPrimitiveTypeService *service, NSString *input) {

        __block NSString *_response;
        MMCall *call = [service returnString:input
                                     success:^(NSString *response) {
                                         _response = response;
                                     }
                                     failure:^(NSError *error) {
                                     }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(_response) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input];
    };

    void (^verifyStringAsBodyParameter)(ATPrimitiveTypeService *, NSString *) = ^(ATPrimitiveTypeService *service, NSString *input) {

        __block NSString *_response;
        MMCall *call = [service returnStringWithBodyParameters:input
                                                       success:^(NSString *response) {
                                                           _response = response;
                                                       }
                                                       failure:^(NSError *error) {
                                                       }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(_response) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input];
    };

    void (^verifyDoubleAsFormParameter)(ATPrimitiveTypeService *, double) = ^(ATPrimitiveTypeService *service, double input) {

        __block double _response;
        MMCall *call = [service returnDoubleWithFormParameters:input
                                                       success:^(double response) {
                                                           _response = response;
                                                       }
                                                       failure:^(NSError *error) {
                                                       }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input withDelta:DBL_EPSILON];
    };

    void (^verifyDoubleAsQueryParameter)(ATPrimitiveTypeService *, double) = ^(ATPrimitiveTypeService *service, double input) {

        __block double _response;
        MMCall *call = [service returnDouble:input
                                     success:^(double response) {
                                         _response = response;
                                     }
                                     failure:^(NSError *error) {
                                     }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input withDelta:DBL_EPSILON];
    };

    void (^verifyDoubleAsBodyParameter)(ATPrimitiveTypeService *, double) = ^(ATPrimitiveTypeService *service, double input) {

        __block double _response;
        MMCall *call = [service returnDoubleWithBodyParameters:input
                                                       success:^(double response) {
                                                           _response = response;
                                                       }
                                                       failure:^(NSError *error) {
                                                       }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input withDelta:DBL_EPSILON];
    };

    void (^verifyFloatAsFormParameter)(ATPrimitiveTypeService *, float) = ^(ATPrimitiveTypeService *service, float input) {

        __block float _response;
        MMCall *call = [service returnFloatWithFormParameters:input
                                                      success:^(float response) {
                                                          _response = response;
                                                      }
                                                      failure:^(NSError *error) {
                                                      }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input withDelta:FLT_EPSILON];
    };

    void (^verifyFloatAsQueryParameter)(ATPrimitiveTypeService *, float) = ^(ATPrimitiveTypeService *service, float input) {

        __block float _response;
        MMCall *call = [service returnFloat:input
                                    success:^(float response) {
                                        _response = response;
                                    }
                                    failure:^(NSError *error) {
                                    }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input withDelta:FLT_EPSILON];
    };

    void (^verifyFloatAsBodyParameter)(ATPrimitiveTypeService *, float) = ^(ATPrimitiveTypeService *service, float input) {

        __block float _response;
        MMCall *call = [service returnFloatWithBodyParameters:input
                                                      success:^(float response) {
                                                          _response = response;
                                                      }
                                                      failure:^(NSError *error) {
                                                      }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input withDelta:FLT_EPSILON];
    };

    void (^verifyEnumAsFormParameter)(ATPrimitiveTypeService *, ATEnumAttribute) = ^(ATPrimitiveTypeService *service, ATEnumAttribute input) {

        __block ATEnumAttribute _response;
        MMCall *call = [service returnEnumWithFormParameters:input
                                                     success:^(ATEnumAttribute response) {
                                                         _response = response;
                                                     }
                                                     failure:^(NSError *error) {
                                                     }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input)];
    };

    void (^verifyEnumAsQueryParameter)(ATPrimitiveTypeService *, ATEnumAttribute) = ^(ATPrimitiveTypeService *service, ATEnumAttribute input) {

        __block ATEnumAttribute _response;
        MMCall *call = [service returnEnum:input
                                   success:^(ATEnumAttribute response) {
                                       _response = response;
                                   }
                                   failure:^(NSError *error) {
                                   }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input)];
    };

    void (^verifyEnumAsBodyParameter)(ATPrimitiveTypeService *, ATEnumAttribute) = ^(ATPrimitiveTypeService *service, ATEnumAttribute input) {

        __block ATEnumAttribute _response;
        MMCall *call = [service returnEnumWithBodyParameters:input
                                                     success:^(ATEnumAttribute response) {
                                                         _response = response;
                                                     }
                                                     failure:^(NSError *error) {
                                                     }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input)];
    };

    void (^verifyModelAsBodyParameter)(ATPrimitiveTypeService *, ATModelWithAllTypes *) = ^(ATPrimitiveTypeService *service, ATModelWithAllTypes *input) {

        __block ATModelWithAllTypes *_response;
        MMCall *call = [service returnModelWithAllTypes:input
                                                success:^(ATModelWithAllTypes *response) {
                                                    _response = response;
                                                }
                                                failure:^(NSError *error) {
                                                }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response.charAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input.charAttribute)];
        [[expectFutureValue(theValue(_response.intAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input.intAttribute)];
        [[expectFutureValue(theValue(_response.shortAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input.shortAttribute)];
        [[expectFutureValue(_response.stringAttribute) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input.stringAttribute];
        [[expectFutureValue(theValue(_response.booleanAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input.booleanAttribute)];
        [[expectFutureValue(theValue(_response.floatAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input.floatAttribute withDelta:FLT_EPSILON];
        [[expectFutureValue(theValue(_response.doubleAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input.doubleAttribute withDelta:DBL_EPSILON];
        [[expectFutureValue(theValue(_response.longAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input.longAttribute)];
        [[expectFutureValue(theValue(_response.enumAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input.enumAttribute)];
        [[expectFutureValue(_response.listOfBooleansAttribute) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input.listOfBooleansAttribute];
        [[expectFutureValue(_response.listOfBytesAttribute) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input.listOfBytesAttribute];
        [[expectFutureValue(_response.listOfCharactersAttribute) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input.listOfCharactersAttribute];
        [[expectFutureValue(_response.listOfShortsAttribute) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input.listOfShortsAttribute];
        [[expectFutureValue(_response.listOfIntegersAttribute) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input.listOfIntegersAttribute];
        [[expectFutureValue(_response.listOfLongsAttribute) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input.listOfLongsAttribute];
        [[expectFutureValue(_response.listOfStringsAttribute) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input.listOfStringsAttribute];
        [[expectFutureValue(theValue([_response.listOfFloatsAttribute.firstObject floatValue])) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:[input.listOfFloatsAttribute.firstObject floatValue] withDelta:FLT_EPSILON];
        [[expectFutureValue(theValue([_response.listOfFloatsAttribute[1] floatValue])) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:[input.listOfFloatsAttribute[1] floatValue] withDelta:FLT_EPSILON];
        [[expectFutureValue(theValue([_response.listOfFloatsAttribute.lastObject floatValue])) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:[input.listOfFloatsAttribute.lastObject floatValue] withDelta:FLT_EPSILON];
        [[expectFutureValue(theValue([_response.listOfDoublesAttribute.firstObject doubleValue])) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:[input.listOfDoublesAttribute.firstObject doubleValue] withDelta:DBL_EPSILON];
        [[expectFutureValue(theValue([_response.listOfDoublesAttribute[1] doubleValue])) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:[input.listOfDoublesAttribute[1] doubleValue] withDelta:DBL_EPSILON];
        [[expectFutureValue(theValue([_response.listOfDoublesAttribute.lastObject doubleValue])) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:[input.listOfDoublesAttribute.lastObject doubleValue] withDelta:DBL_EPSILON];
        [[expectFutureValue(_response.listOfEnumsAttribute) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input.listOfEnumsAttribute];
        [[expectFutureValue(theValue(_response.subModelAttribute.intAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input.subModelAttribute.intAttribute)];
        [[expectFutureValue(_response.subModelAttribute.stringAttribute) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input.subModelAttribute.stringAttribute];

        [[expectFutureValue(theValue([_response.listOfModelsAttribute.firstObject intAttribute])) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue([_response.listOfModelsAttribute.firstObject intAttribute])];
        [[expectFutureValue([_response.listOfModelsAttribute.firstObject stringAttribute]) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:[input.listOfModelsAttribute.firstObject stringAttribute]];

        [[expectFutureValue(theValue([_response.listOfModelsAttribute.lastObject intAttribute])) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue([_response.listOfModelsAttribute.lastObject intAttribute])];
        [[expectFutureValue([_response.listOfModelsAttribute.lastObject stringAttribute]) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:[input.listOfModelsAttribute.lastObject stringAttribute]];
    };

    void (^verifyListOfBooleansAsBodyParameter)(ATPrimitiveTypeService *, NSArray *) = ^(ATPrimitiveTypeService *service, NSArray *input) {

        __block NSArray *_response;
        MMCall *call = [service returnListOfBooleans:input
                                             success:^(NSArray *response) {
                                                 _response = response;
                                             }
                                             failure:^(NSError *error) {
                                             }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(_response) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input];
    };

    void (^verifyListOfCharsAsBodyParameter)(ATPrimitiveTypeService *, NSArray *) = ^(ATPrimitiveTypeService *service, NSArray *input) {

        __block NSArray *_response;
        MMCall *call = [service returnListOfBytes:input
                                          success:^(NSArray *response) {
                                              _response = response;
                                          }
                                          failure:^(NSError *error) {
                                          }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(_response) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input];
    };

    void (^verifyListOfUniCharsAsBodyParameter)(ATPrimitiveTypeService *, NSArray *) = ^(ATPrimitiveTypeService *service, NSArray *input) {

        __block NSArray *_response;
        MMCall *call = [service returnListOfCharacters:input
                                               success:^(NSArray *response) {
                                                   _response = response;
                                               }
                                               failure:^(NSError *error) {
                                               }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(_response) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input];
    };

    void (^verifyListOfShortsAsBodyParameter)(ATPrimitiveTypeService *, NSArray *) = ^(ATPrimitiveTypeService *service, NSArray *input) {

        __block NSArray *_response;
        MMCall *call = [service returnListOfShorts:input
                                           success:^(NSArray *response) {
                                               _response = response;
                                           }
                                           failure:^(NSError *error) {
                                           }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(_response) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input];
    };

    void (^verifyListOfIntsAsBodyParameter)(ATPrimitiveTypeService *, NSArray *) = ^(ATPrimitiveTypeService *service, NSArray *input) {

        __block NSArray *_response;
        MMCall *call = [service returnListOfIntegers:input
                                             success:^(NSArray *response) {
                                                 _response = response;
                                             }
                                             failure:^(NSError *error) {
                                             }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(_response) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input];
    };

    void (^verifyListOfLongLongsAsBodyParameter)(ATPrimitiveTypeService *, NSArray *) = ^(ATPrimitiveTypeService *service, NSArray *input) {

        __block NSArray *_response;
        MMCall *call = [service returnListOfLongs:input
                                          success:^(NSArray *response) {
                                              _response = response;
                                          }
                                          failure:^(NSError *error) {
                                          }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(_response) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input];
    };

    void (^verifyListOfStringsAsBodyParameter)(ATPrimitiveTypeService *, NSArray *) = ^(ATPrimitiveTypeService *service, NSArray *input) {

        __block NSArray *_response;
        MMCall *call = [service returnListOfStrings:input
                                            success:^(NSArray *response) {
                                                _response = response;
                                            }
                                            failure:^(NSError *error) {
                                            }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(_response) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input];
    };

    void (^verifyListOfStringsAsQueryParameter)(ATPrimitiveTypeService *, NSArray *) = ^(ATPrimitiveTypeService *service, NSArray *input) {
        
        __block NSArray *_response;
        MMCall *call = [service returnListOfStringsGET:input
                                               success:^(NSArray *response) {
                                                   _response = response;
                                               }
                                               failure:^(NSError *error) {
                                               }];
        
        [call executeInBackground:nil];
        
        // Assert
        [[expectFutureValue(_response) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input];
    };

    void (^verifyListOfFloatsAsBodyParameter)(ATPrimitiveTypeService *, NSArray *) = ^(ATPrimitiveTypeService *service, NSArray *input) {

        __block NSArray *_response;
        MMCall *call = [service returnListOfFloats:input
                                           success:^(NSArray *response) {
                                               _response = response;
                                           }
                                           failure:^(NSError *error) {
                                           }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue([_response.firstObject floatValue])) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:[input.firstObject floatValue] withDelta:FLT_EPSILON];
        [[expectFutureValue(theValue([_response[1] floatValue])) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:[input[1] floatValue] withDelta:FLT_EPSILON];
        [[expectFutureValue(theValue([_response.lastObject floatValue])) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:[input.lastObject floatValue] withDelta:FLT_EPSILON];
    };

    void (^verifyListOfDoublesAsBodyParameter)(ATPrimitiveTypeService *, NSArray *) = ^(ATPrimitiveTypeService *service, NSArray *input) {

        __block NSArray *_response;
        MMCall *call = [service returnListOfDoubles:input
                                            success:^(NSArray *response) {
                                                _response = response;
                                            }
                                            failure:^(NSError *error) {
                                            }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue([_response.firstObject doubleValue])) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:[input.firstObject doubleValue] withDelta:DBL_EPSILON];
        [[expectFutureValue(theValue([_response[1] doubleValue])) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:[input[1] doubleValue] withDelta:DBL_EPSILON];
        [[expectFutureValue(theValue([_response.lastObject doubleValue])) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:[input.lastObject doubleValue] withDelta:DBL_EPSILON];
    };

    void (^verifyListOfEnumsAsBodyParameter)(ATPrimitiveTypeService *, NSArray *) = ^(ATPrimitiveTypeService *service, NSArray *input) {

        __block NSArray *_response;
        MMCall *call = [service returnListOfEnums:input
                                          success:^(NSArray *response) {
                                              _response = response;
                                          }
                                          failure:^(NSError *error) {
                                          }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(_response) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input];
    };

    void (^verifyListOfModelsAsBodyParameter)(ATPrimitiveTypeService *, NSArray *) = ^(ATPrimitiveTypeService *service, NSArray *input) {

        ATModelWithAllTypes *input1 = [input firstObject];
        ATModelWithAllTypes *input2 = [input lastObject];

        __block ATModelWithAllTypes *_response1;
        __block ATModelWithAllTypes *_response2;
        MMCall *call = [service returnListOfModels:input
                                           success:^(NSArray *response) {
                                               _response1 = [response firstObject];
                                               _response2 = [response lastObject];
                                           }
                                           failure:^(NSError *error) {
                                           }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response1.charAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input1.charAttribute)];
        [[expectFutureValue(theValue(_response1.intAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input1.intAttribute)];
        [[expectFutureValue(theValue(_response1.shortAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input1.shortAttribute)];
        [[expectFutureValue(_response1.stringAttribute) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input1.stringAttribute];
        [[expectFutureValue(theValue(_response1.booleanAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input1.booleanAttribute)];
        [[expectFutureValue(theValue(_response1.floatAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input1.floatAttribute withDelta:FLT_EPSILON];
        [[expectFutureValue(theValue(_response1.byteAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input1.byteAttribute)];
        [[expectFutureValue(theValue(_response1.doubleAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input1.doubleAttribute withDelta:DBL_EPSILON];
        [[expectFutureValue(theValue(_response1.longAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input1.longAttribute)];
        [[expectFutureValue(theValue(_response1.enumAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input1.enumAttribute)];
        [[expectFutureValue(theValue(_response1.subModelAttribute.intAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input1.subModelAttribute.intAttribute)];
        [[expectFutureValue(_response1.subModelAttribute.stringAttribute) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input1.subModelAttribute.stringAttribute];
        [[expectFutureValue(_response1.listOfShortsAttribute) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input1.listOfShortsAttribute];

        // Assert
        [[expectFutureValue(theValue(_response2.charAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input2.charAttribute)];
        [[expectFutureValue(theValue(_response2.intAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input2.intAttribute)];
        [[expectFutureValue(theValue(_response2.shortAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input2.shortAttribute)];
        [[expectFutureValue(_response2.stringAttribute) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input2.stringAttribute];
        [[expectFutureValue(theValue(_response2.booleanAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input2.booleanAttribute)];
        [[expectFutureValue(theValue(_response2.floatAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input2.floatAttribute withDelta:FLT_EPSILON];
        [[expectFutureValue(theValue(_response2.byteAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input2.byteAttribute)];
        [[expectFutureValue(theValue(_response2.doubleAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input2.doubleAttribute withDelta:DBL_EPSILON];
        [[expectFutureValue(theValue(_response2.longAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input2.longAttribute)];
        [[expectFutureValue(theValue(_response2.enumAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input2.enumAttribute)];
        [[expectFutureValue(theValue(_response2.subModelAttribute.intAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input2.subModelAttribute.intAttribute)];
        [[expectFutureValue(_response2.subModelAttribute.stringAttribute) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input2.subModelAttribute.stringAttribute];
        [[expectFutureValue(_response2.listOfShortsAttribute) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input2.listOfShortsAttribute];
    };

    void (^verifyMapOfBooleansAsBodyParameter)(ATPrimitiveTypeService *, NSDictionary *) = ^(ATPrimitiveTypeService *service, NSDictionary *input) {

        __block NSDictionary *_response;
        MMCall *call = [service returnMapOfBooleans:input
                                            success:^(NSDictionary *response) {
                                                _response = response;
                                            }
                                            failure:^(NSError *error) {
                                            }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(_response) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input];
    };

    void (^verifyMapOfCharsAsBodyParameter)(ATPrimitiveTypeService *, NSDictionary *) = ^(ATPrimitiveTypeService *service, NSDictionary *input) {

        __block NSDictionary *_response;
        MMCall *call = [service returnMapOfBytes:input
                                         success:^(NSDictionary *response) {
                                             _response = response;
                                         }
                                         failure:^(NSError *error) {
                                         }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(_response) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input];
    };

    void (^verifyMapOfUniCharsAsBodyParameter)(ATPrimitiveTypeService *, NSDictionary *) = ^(ATPrimitiveTypeService *service, NSDictionary *input) {

        __block NSDictionary *_response;
        MMCall *call = [service returnMapOfCharacters:input
                                              success:^(NSDictionary *response) {
                                                  _response = response;
                                              }
                                              failure:^(NSError *error) {
                                              }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(_response) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input];
    };

    void (^verifyMapOfShortsAsBodyParameter)(ATPrimitiveTypeService *, NSDictionary *) = ^(ATPrimitiveTypeService *service, NSDictionary *input) {

        __block NSDictionary *_response;
        MMCall *call = [service returnMapOfShorts:input
                                          success:^(NSDictionary *response) {
                                              _response = response;
                                          }
                                          failure:^(NSError *error) {
                                          }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(_response) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input];
    };

    void (^verifyMapOfIntsAsBodyParameter)(ATPrimitiveTypeService *, NSDictionary *) = ^(ATPrimitiveTypeService *service, NSDictionary *input) {

        __block NSDictionary *_response;
        MMCall *call = [service returnMapOfIntegers:input
                                            success:^(NSDictionary *response) {
                                                _response = response;
                                            }
                                            failure:^(NSError *error) {
                                            }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(_response) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input];
    };

    void (^verifyMapOfLongLongsAsBodyParameter)(ATPrimitiveTypeService *, NSDictionary *) = ^(ATPrimitiveTypeService *service, NSDictionary *input) {

        __block NSDictionary *_response;
        MMCall *call = [service returnMapOfLongs:input
                                         success:^(NSDictionary *response) {
                                             _response = response;
                                         }
                                         failure:^(NSError *error) {
                                         }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(_response) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input];
    };

    void (^verifyMapOfStringsAsBodyParameter)(ATPrimitiveTypeService *, NSDictionary *) = ^(ATPrimitiveTypeService *service, NSDictionary *input) {

        __block NSDictionary *_response;
        MMCall *call = [service returnMapOfStrings:input
                                           success:^(NSDictionary *response) {
                                               _response = response;
                                           }
                                           failure:^(NSError *error) {
                                           }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(_response) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input];
    };

    void (^verifyMapOfFloatsAsBodyParameter)(ATPrimitiveTypeService *, NSDictionary *) = ^(ATPrimitiveTypeService *service, NSDictionary *input) {

        __block NSDictionary *_response;
        MMCall *call = [service returnMapOfFloats:input
                                          success:^(NSDictionary *response) {
                                              _response = response;
                                          }
                                          failure:^(NSError *error) {
                                          }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue([_response[@"key1"] floatValue])) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:[input[@"key1"] floatValue] withDelta:FLT_EPSILON];
        [[expectFutureValue(theValue([_response[@"key2"] floatValue])) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:[input[@"key2"] floatValue] withDelta:FLT_EPSILON];
        [[expectFutureValue(theValue([_response[@"key3"] floatValue])) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:[input[@"key3"] floatValue] withDelta:FLT_EPSILON];

    };

    void (^verifyMapOfDoublesAsBodyParameter)(ATPrimitiveTypeService *, NSDictionary *) = ^(ATPrimitiveTypeService *service, NSDictionary *input) {

        __block NSDictionary *_response;
        MMCall *call = [service returnMapOfDoubles:input
                                           success:^(NSDictionary *response) {
                                               _response = response;
                                           }
                                           failure:^(NSError *error) {
                                           }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue([_response[@"key1"] doubleValue])) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:[input[@"key1"] doubleValue] withDelta:DBL_EPSILON];
        [[expectFutureValue(theValue([_response[@"key2"] doubleValue])) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:[input[@"key2"] doubleValue] withDelta:DBL_EPSILON];
        [[expectFutureValue(theValue([_response[@"key3"] doubleValue])) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:[input[@"key3"] doubleValue] withDelta:DBL_EPSILON];
    };

    void (^verifyMapOfEnumsAsBodyParameter)(ATPrimitiveTypeService *, NSDictionary *) = ^(ATPrimitiveTypeService *service, NSDictionary *input) {

        __block NSDictionary *_response;
        MMCall *call = [service returnMapOfEnums:input
                                         success:^(NSDictionary *response) {
                                             _response = response;
                                         }
                                         failure:^(NSError *error) {
                                         }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(_response[@"key1"]) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input[@"key1"]];
        [[expectFutureValue(_response[@"key2"]) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input[@"key2"]];
        [[expectFutureValue(_response[@"key3"]) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input[@"key3"]];
    };

    void (^verifyMapOfModelsAsBodyParameter)(ATPrimitiveTypeService *, NSDictionary *) = ^(ATPrimitiveTypeService *service, NSDictionary *input) {

        ATModelWithAllTypes *input1 = input[@"key1"];
        ATModelWithAllTypes *input2 = input[@"key2"];

        __block ATModelWithAllTypes *_response1;
        __block ATModelWithAllTypes *_response2;
        MMCall *call = [service returnMapOfModels:input
                                          success:^(NSDictionary *response) {
                                              _response1 = response[@"key1"];
                                              _response2 = response[@"key2"];
                                          }
                                          failure:^(NSError *error) {
                                          }];

        [call executeInBackground:nil];

        // Assert
        [[expectFutureValue(theValue(_response1.charAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input1.charAttribute)];
        [[expectFutureValue(theValue(_response1.intAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input1.intAttribute)];
        [[expectFutureValue(theValue(_response1.shortAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input1.shortAttribute)];
        [[expectFutureValue(_response1.stringAttribute) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input1.stringAttribute];
        [[expectFutureValue(theValue(_response1.booleanAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input1.booleanAttribute)];
        [[expectFutureValue(theValue(_response1.floatAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input1.floatAttribute withDelta:FLT_EPSILON];
        [[expectFutureValue(theValue(_response1.byteAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input1.byteAttribute)];
        [[expectFutureValue(theValue(_response1.doubleAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input1.doubleAttribute withDelta:DBL_EPSILON];
        [[expectFutureValue(theValue(_response1.longAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input1.longAttribute)];
        [[expectFutureValue(theValue(_response1.enumAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input1.enumAttribute)];
        [[expectFutureValue(theValue(_response1.subModelAttribute.intAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input1.subModelAttribute.intAttribute)];
        [[expectFutureValue(_response1.subModelAttribute.stringAttribute) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input1.subModelAttribute.stringAttribute];

        // Assert
        [[expectFutureValue(theValue(_response2.charAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input2.charAttribute)];
        [[expectFutureValue(theValue(_response2.intAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input2.intAttribute)];
        [[expectFutureValue(theValue(_response2.shortAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input2.shortAttribute)];
        [[expectFutureValue(_response2.stringAttribute) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input2.stringAttribute];
        [[expectFutureValue(theValue(_response2.booleanAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input2.booleanAttribute)];
        [[expectFutureValue(theValue(_response2.floatAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input2.floatAttribute withDelta:FLT_EPSILON];
        [[expectFutureValue(theValue(_response2.byteAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input2.byteAttribute)];
        [[expectFutureValue(theValue(_response2.doubleAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input2.doubleAttribute withDelta:DBL_EPSILON];
        [[expectFutureValue(theValue(_response2.longAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input2.longAttribute)];
        [[expectFutureValue(theValue(_response2.enumAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input2.enumAttribute)];
        [[expectFutureValue(theValue(_response2.subModelAttribute.intAttribute)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:theValue(input2.subModelAttribute.intAttribute)];
        [[expectFutureValue(_response2.subModelAttribute.stringAttribute) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] equal:input2.subModelAttribute.stringAttribute];
    };

    describe(@"ATPrimitiveTypeService", ^{

        // Take off
        beforeAll(^{
            _HTTTPServiceAdapter = [MMCoreConfiguration serviceAdapter];
//            _WebSocketServiceAdapter = [ATServiceAdapterHelper defaultWSTestAdapter];
            _HTTPService = [[ATPrimitiveTypeService alloc] init];
            _WebSocketService = [[ATPrimitiveTypeService alloc] init];
            _queue = [[OperationQueue alloc] init];
        });

        afterAll(^{
            //
        });


        context(@"when passing a short as a FORM parameter", ^{

            it(@"should return the expected response for lower bound over HTTP", ^{
                verifyShortAsFormParameter(_HTTPService, SHRT_MIN);
            });

            it(@"should return the expected response for upper bound over HTTP", ^{
                verifyShortAsFormParameter(_HTTPService, SHRT_MAX);
            });
        });


        context(@"when passing a short as a QUERY parameter", ^{
            
            beforeAll(^{
                [[expectFutureValue(theValue(_HTTTPServiceAdapter.sessionManager.reachabilityManager.isReachable)) shouldEventuallyBeforeTimingOutAfter(DEFAULT_TEST_TIMEOUT)] beYes];
            });

            it(@"should return the expected response for lower bound over HTTP", ^{
                verifyShortAsQueryParameter(_HTTPService, SHRT_MIN);
            });

            it(@"should return the expected response for upper bound over HTTP", ^{
                verifyShortAsQueryParameter(_HTTPService, SHRT_MAX);
            });
        });

        context(@"when passing a short as a BODY parameter", ^{

            it(@"should return the expected response for lower bound over HTTP", ^{
                verifyShortAsBodyParameter(_HTTPService, SHRT_MIN);
            });

            it(@"should return the expected response for upper bound over HTTP", ^{
                verifyShortAsBodyParameter(_HTTPService, SHRT_MAX);
            });
        });

        context(@"when passing a int as a FORM parameter", ^{

            it(@"should return the expected response for lower bound over HTTP", ^{
                verifyIntAsFormParameter(_HTTPService, INT_MIN);
            });

            it(@"should return the expected response for upper bound over HTTP", ^{
                verifyIntAsFormParameter(_HTTPService, INT_MAX);
            });
        });


        context(@"when passing a int as a QUERY parameter", ^{

            it(@"should return the expected response for lower bound over HTTP", ^{
                verifyIntAsQueryParameter(_HTTPService, INT_MIN);
            });

            it(@"should return the expected response for upper bound over HTTP", ^{
                verifyIntAsQueryParameter(_HTTPService, INT_MAX);
            });
        });

        context(@"when passing a int as a BODY parameter", ^{

            it(@"should return the expected response for lower bound over HTTP", ^{
                verifyIntAsBodyParameter(_HTTPService, INT_MIN);
            });

            it(@"should return the expected response for upper bound over HTTP", ^{
                verifyIntAsBodyParameter(_HTTPService, INT_MAX);
            });
        });
        
        context(@"when passing a NSDate as an input parameter", ^{
            
            NSDate *input = [NSDate dateWithTimeIntervalSince1970:NSTimeIntervalSince1970];
            
            it(@"should return the expected response for NSTimeIntervalSince1970", ^{
                verifyDateAsFormParameter(_HTTPService, input);
            });
            
            it(@"should return the expected response for NSTimeIntervalSince1970", ^{
                verifyDateAsQueryParameter(_HTTPService, input);
            });
            
            it(@"should return the expected response for NSTimeIntervalSince1970", ^{
                verifyDateAsBodyParameter(_HTTPService, input);
            });
        });


        context(@"when passing a char as a FORM parameter", ^{

            it(@"should return the expected response for lower bound over HTTP", ^{
                verifyCharAsFormParameter(_HTTPService, CHAR_MIN);
            });

            it(@"should return the expected response for upper bound over HTTP", ^{
                verifyCharAsFormParameter(_HTTPService, CHAR_MAX);
            });
        });


        context(@"when passing a char as a QUERY parameter", ^{

            it(@"should return the expected response for lower bound over HTTP", ^{
                verifyCharAsQueryParameter(_HTTPService, CHAR_MIN);
            });

            it(@"should return the expected response for upper bound over HTTP", ^{
                verifyCharAsQueryParameter(_HTTPService, CHAR_MAX);
            });
        });

        context(@"when passing a char as a BODY parameter", ^{

            it(@"should return the expected response for lower bound over HTTP", ^{
                verifyCharAsBodyParameter(_HTTPService, CHAR_MIN);
            });

            it(@"should return the expected response for upper bound over HTTP", ^{
                verifyCharAsBodyParameter(_HTTPService, CHAR_MAX);
            });
        });


        context(@"when a service returning a void is invoked", ^{

            it(@"should return the expected response over HTTP", ^{
                verifyVoid(_HTTPService);
            });
        });

        context(@"when passing a boolean as a FORM parameter", ^{

            it(@"should return the expected response for falsy over HTTP", ^{
                verifyBooleanAsFormParameter(_HTTPService, NO);
            });

            it(@"should return the expected response for truthy over HTTP", ^{
                verifyBooleanAsFormParameter(_HTTPService, YES);
            });
        });


        context(@"when passing a boolean as a QUERY parameter", ^{

            it(@"should return the expected response for falsy over HTTP", ^{
                verifyBooleanAsQueryParameter(_HTTPService, NO);
            });

            it(@"should return the expected response for truthy over HTTP", ^{
                verifyBooleanAsQueryParameter(_HTTPService, YES);
            });
        });

        context(@"when passing a boolean as a BODY parameter", ^{

            it(@"should return the expected response for falsy over HTTP", ^{
                verifyBooleanAsBodyParameter(_HTTPService, NO);
            });

            it(@"should return the expected response for truthy over HTTP", ^{
                verifyBooleanAsBodyParameter(_HTTPService, YES);
            });
        });

        context(@"when passing a unichar as a FORM parameter", ^{

            it(@"should return the expected response for ★ over HTTP", ^{
                verifyUniCharAsFormParameter(_HTTPService, 0x2605);
            });

            it(@"should return the expected response for £ over HTTP", ^{
                verifyUniCharAsFormParameter(_HTTPService, 0x00A3);
            });
        });


        context(@"when passing a unichar as a QUERY parameter", ^{

            it(@"should return the expected response for ★ over HTTP", ^{
                verifyUniCharAsQueryParameter(_HTTPService, 0x2605);
            });

            it(@"should return the expected response for £ over HTTP", ^{
                verifyUniCharAsQueryParameter(_HTTPService, 0x00A3);
            });
        });

        context(@"when passing a unichar as a BODY parameter", ^{

            it(@"should return the expected response for ★ over HTTP", ^{
                verifyUniCharAsBodyParameter(_HTTPService, 0x2605);
            });

            it(@"should return the expected response for £ over HTTP", ^{
                verifyUniCharAsBodyParameter(_HTTPService, 0x00A3);
            });
        });


        context(@"when passing a long long as a FORM parameter", ^{

            it(@"should return the expected response for lower bound over HTTP", ^{
                verifyLongLongAsFormParameter(_HTTPService, LLONG_MIN);
            });

            it(@"should return the expected response for upper bound over HTTP", ^{
                verifyLongLongAsFormParameter(_HTTPService, LLONG_MAX);
            });
        });


        context(@"when passing a long long as a QUERY parameter", ^{

            it(@"should return the expected response for lower bound over HTTP", ^{
                verifyLongLongAsQueryParameter(_HTTPService, LLONG_MIN);
            });

            it(@"should return the expected response for upper bound over HTTP", ^{
                verifyLongLongAsQueryParameter(_HTTPService, LLONG_MAX);
            });
        });

        context(@"when passing a long long as a BODY parameter", ^{

            it(@"should return the expected response for lower bound over HTTP", ^{
                verifyLongLongAsBodyParameter(_HTTPService, LLONG_MIN);
            });

            it(@"should return the expected response for upper bound over HTTP", ^{
                verifyLongLongAsBodyParameter(_HTTPService, LLONG_MAX);
            });
        });

        context(@"when passing a string as a FORM parameter", ^{

            it(@"should return the expected response over HTTP", ^{
                verifyStringAsFormParameter(_HTTPService, @"Hello Magnet");
            });
        });


        context(@"when passing a string as a QUERY parameter", ^{

            it(@"should return the expected response over HTTP", ^{
                verifyStringAsQueryParameter(_HTTPService, @"Hello Magnet");
            });
        });

        context(@"when passing a string as a BODY parameter", ^{

            it(@"should return the expected response over HTTP", ^{
                verifyStringAsBodyParameter(_HTTPService, @"Hello Magnet");
            });
        });

        context(@"when passing a double as a FORM parameter", ^{

            it(@"should return the expected response for lower bound over HTTP", ^{
                verifyDoubleAsFormParameter(_HTTPService, DBL_MIN);
            });

            it(@"should return the expected response for pi over HTTP", ^{
                verifyDoubleAsFormParameter(_HTTPService, M_PI);
            });
        });


        context(@"when passing a double as a QUERY parameter", ^{

            it(@"should return the expected response for lower bound over HTTP", ^{
                verifyDoubleAsQueryParameter(_HTTPService, DBL_MIN);
            });

            it(@"should return the expected response for pi over HTTP", ^{
                verifyDoubleAsQueryParameter(_HTTPService, M_PI);
            });
        });

        context(@"when passing a double as a BODY parameter", ^{

            it(@"should return the expected response for lower bound over HTTP", ^{
                verifyDoubleAsBodyParameter(_HTTPService, DBL_MIN);
            });

            it(@"should return the expected response for pi over HTTP", ^{
                verifyDoubleAsBodyParameter(_HTTPService, M_PI);
            });
        });


        context(@"when passing a fLoat as a FORM parameter", ^{

            it(@"should return the expected response for lower bound over HTTP", ^{
                verifyFloatAsFormParameter(_HTTPService, FLT_MIN);
            });

            it(@"should return the expected response for 1.2345f over HTTP", ^{
                verifyFloatAsFormParameter(_HTTPService, 1.2345f);
            });
        });


        context(@"when passing a fLoat as a QUERY parameter", ^{

            it(@"should return the expected response for lower bound over HTTP", ^{
                verifyFloatAsQueryParameter(_HTTPService, FLT_MIN);
            });

            it(@"should return the expected response for 1.2345f over HTTP", ^{
                verifyFloatAsQueryParameter(_HTTPService, 1.2345f);
            });
        });

        context(@"when passing a fLoat as a BODY parameter", ^{

            it(@"should return the expected response for lower bound over HTTP", ^{
                verifyFloatAsBodyParameter(_HTTPService, FLT_MIN);
            });

            it(@"should return the expected response for 1.2345f over HTTP", ^{
                verifyFloatAsBodyParameter(_HTTPService, 1.2345f);
            });
        });


        context(@"when passing an enum as a FORM parameter", ^{

            it(@"should return the expected response for first value over HTTP", ^{
                verifyEnumAsFormParameter(_HTTPService, ATEnumAttributeSTARTED);
            });

            it(@"should return the expected response for last value over HTTP", ^{
                verifyEnumAsFormParameter(_HTTPService, ATEnumAttributeENDED);
            });
        });

        context(@"when passing an enum as a QUERY parameter", ^{

            it(@"should return the expected response for first value over HTTP", ^{
                verifyEnumAsQueryParameter(_HTTPService, ATEnumAttributeSTARTED);
            });

            it(@"should return the expected response for last value over HTTP", ^{
                verifyEnumAsQueryParameter(_HTTPService, ATEnumAttributeENDED);
            });
        });

        context(@"when passing an enum as a BODY parameter", ^{

            it(@"should return the expected response for first value over HTTP", ^{
                verifyEnumAsBodyParameter(_HTTPService, ATEnumAttributeSTARTED);
            });

            it(@"should return the expected response for last value over HTTP", ^{
                verifyEnumAsBodyParameter(_HTTPService, ATEnumAttributeENDED);
            });
        });

        context(@"when passing a complex type (model) as a BODY parameter", ^{

            ATModelWithAllTypes *input = [[ATModelWithAllTypes alloc] init];
            input.charAttribute = 0x2605; // Star sign
            input.intAttribute = INT_MAX;
            input.shortAttribute = SHRT_MAX;
            input.integerAttribute = INT_MAX;
            input.stringAttribute = @"Hello Magnet";
            input.booleanAttribute = YES;
            input.floatAttribute = 1.2345f;
            input.byteAttribute = CHAR_MAX;
            input.doubleAttribute = M_PI;
            input.longAttribute = LLONG_MAX;
            input.enumAttribute = ATEnumAttributeENDED;
            ATSubModel *subModel = [[ATSubModel alloc] init];
            subModel.intAttribute = INT_MAX;
            subModel.stringAttribute = @"Hello SubModel";
            input.subModelAttribute = subModel;
            input.listOfBooleansAttribute = @[@YES, @NO, @NO];
            input.listOfBytesAttribute = @[@(CHAR_MIN), @(CHAR_MAX), @(0)];
            input.listOfCharactersAttribute = @[@"★", @"£"];
            // TODO: SHRT_MIN is failing for some mysterious reason!
//            input.listOfShortsAttribute = @[@(SHRT_MIN), @(SHRT_MAX), @(0)];
            input.listOfShortsAttribute = @[@(SHRT_MIN + 1), @(SHRT_MAX), @(0)];
            input.listOfIntegersAttribute = @[@(INT_MIN), @(INT_MAX), @(0)];
            input.listOfLongsAttribute = @[@(LLONG_MIN), @(LLONG_MAX), @(0)];
            input.listOfStringsAttribute = @[@"Apple", @"Banana", @"Orange"];
            input.listOfFloatsAttribute = @[@(0.12345f), @(1.2345f), @(0)];
            input.listOfDoublesAttribute = @[@(-M_PI), @(M_PI), @(0)];
            input.listOfEnumsAttribute = @[@(ATEnumAttributeSTARTED), @(ATEnumAttributeINPROGRESS), @(ATEnumAttributeENDED)];
            ATSubModel *subModel2 = [[ATSubModel alloc] init];
            subModel2.intAttribute = INT_MIN;
            subModel2.stringAttribute = @"Hello SubModel2";
            input.listOfModelsAttribute = @[subModel, subModel2];

            ATModelWithAllTypes *input2 = [[ATModelWithAllTypes alloc] init];
            input2.charAttribute = 0x00A3; // Pound sign
            input2.intAttribute = INT_MIN;
            input2.shortAttribute = (SHRT_MIN + 1);
            input2.integerAttribute = INT_MIN;
            input2.stringAttribute = @"Hello Magnet";
            input2.booleanAttribute = NO;
            input2.floatAttribute = 0.1234f;
            input2.byteAttribute = CHAR_MIN;
            input2.doubleAttribute = -M_PI;
            input2.longAttribute = LLONG_MIN;
            input2.enumAttribute = ATEnumAttributeSTARTED;
            ATSubModel *subModel3 = [[ATSubModel alloc] init];
            subModel3.intAttribute = INT_MIN;
            subModel3.stringAttribute = @"Hola Mundo";
            input2.subModelAttribute = subModel3;
            input2.listOfBooleansAttribute = @[@YES, @NO, @NO];
            input2.listOfBytesAttribute = @[@(CHAR_MIN), @(CHAR_MAX), @(0)];
            input2.listOfCharactersAttribute = @[@"★", @"£"];
            // TODO: SHRT_MIN is failing for some mysterious reason!
//            input2.listOfShortsAttribute = @[@(SHRT_MIN), @(SHRT_MAX), @(0)];
            input2.listOfShortsAttribute = @[@(SHRT_MIN + 1), @(SHRT_MAX), @(0)];
            input2.listOfIntegersAttribute = @[@(INT_MIN), @(INT_MAX), @(0)];
            input2.listOfLongsAttribute = @[@(LLONG_MIN), @(LLONG_MAX), @(0)];
            input2.listOfStringsAttribute = @[@"Apple", @"Banana", @"Orange"];
            input2.listOfFloatsAttribute = @[@(0.12345f), @(1.2345f), @(0)];
            input2.listOfDoublesAttribute = @[@(-M_PI), @(M_PI), @(0)];
            input2.listOfEnumsAttribute = @[@(ATEnumAttributeSTARTED), @(ATEnumAttributeINPROGRESS), @(ATEnumAttributeENDED)];
            input2.listOfModelsAttribute = @[subModel3];

            it(@"should return the expected response for upper bound (kinda) over HTTP", ^{
                verifyModelAsBodyParameter(_HTTPService, input);
            });

            it(@"should return the expected response for lower bound (kinda) over HTTP", ^{
                verifyModelAsBodyParameter(_HTTPService, input2);
            });
        });

        context(@"when passing a list of booleans as a BODY parameter", ^{
            NSArray *input = @[@YES, @NO, @NO];

            it(@"should return the expected response over HTTP", ^{
                verifyListOfBooleansAsBodyParameter(_HTTPService, input);
            });
        });

        context(@"when passing a list of chars as a BODY parameter", ^{
            NSArray *input = @[@(CHAR_MIN), @(CHAR_MAX), @(0)];

            it(@"should return the expected response over HTTP", ^{
                verifyListOfCharsAsBodyParameter(_HTTPService, input);
            });
        });

        context(@"when passing a list of unichars as a BODY parameter", ^{

            NSArray *input = @[@"★", @"£"];

            it(@"should return the expected response over HTTP", ^{
                verifyListOfUniCharsAsBodyParameter(_HTTPService, input);
            });
        });

        context(@"when passing a list of shorts as a BODY parameter", ^{

            NSArray *input = @[@(SHRT_MIN), @(SHRT_MAX), @(0)];

            it(@"should return the expected response over HTTP", ^{
                verifyListOfShortsAsBodyParameter(_HTTPService, input);
            });
        });

        context(@"when passing a list of ints as a BODY parameter", ^{

            NSArray *input = @[@(INT_MIN), @(INT_MAX), @(0)];

            it(@"should return the expected response over HTTP", ^{
                verifyListOfIntsAsBodyParameter(_HTTPService, input);
            });
        });

        context(@"when passing a list of long longs as a BODY parameter", ^{

            NSArray *input = @[@(LLONG_MIN), @(LLONG_MAX), @(0)];

            it(@"should return the expected response over HTTP", ^{
                verifyListOfLongLongsAsBodyParameter(_HTTPService, input);
            });
        });

        context(@"when passing a list of strings as a BODY parameter", ^{

            NSArray *input = @[@"Apple", @"Banana", @"Orange"];

            it(@"should return the expected response over HTTP", ^{
                verifyListOfStringsAsBodyParameter(_HTTPService, input);
            });
        });
        
        context(@"when passing a list of strings as a BODY parameter", ^{
            
            NSArray *input = @[@"Apple", @"Banana", @"Orange"];
            
            it(@"should return the expected response over HTTP", ^{
                verifyListOfStringsAsQueryParameter(_HTTPService, input);
            });
        });

        context(@"when passing a list of floats as a BODY parameter", ^{

            NSArray *input = @[@(FLT_MIN), @(1.2345f), @(0)];

            it(@"should return the expected response over HTTP", ^{
                verifyListOfFloatsAsBodyParameter(_HTTPService, input);
            });
        });

        context(@"when passing a list of doubles as a BODY parameter", ^{

            NSArray *input = @[@(-M_PI), @(M_PI), @(0)];

            it(@"should return the expected response over HTTP", ^{
                verifyListOfDoublesAsBodyParameter(_HTTPService, input);
            });
        });


        context(@"when passing a list of enums as a BODY parameter", ^{

            NSArray *input = @[@(ATEnumAttributeSTARTED), @(ATEnumAttributeINPROGRESS), @(ATEnumAttributeENDED)];

            it(@"should return the expected response over HTTP", ^{
                verifyListOfEnumsAsBodyParameter(_HTTPService, input);
            });
        });

        context(@"when passing a list of complex types (models) as a BODY parameter", ^{

            // Model 1
            ATModelWithAllTypes *input1 = [[ATModelWithAllTypes alloc] init];
            input1.charAttribute = 0x2605; // Star sign
            input1.intAttribute = INT_MAX;
            input1.shortAttribute = SHRT_MAX;
            input1.integerAttribute = INT_MAX;
            input1.stringAttribute = @"Hello Magnet";
            input1.booleanAttribute = YES;
            input1.floatAttribute = 1.2345f;
            input1.byteAttribute = CHAR_MAX;
            input1.doubleAttribute = M_PI;
            input1.longAttribute = LLONG_MAX;
            input1.enumAttribute = ATEnumAttributeENDED;
            ATSubModel *subModel1 = [[ATSubModel alloc] init];
            subModel1.intAttribute = INT_MAX;
            subModel1.stringAttribute = @"Hello SubModel";
            input1.subModelAttribute = subModel1;
            input1.listOfShortsAttribute = @[@(SHRT_MIN), @(SHRT_MAX), @(0)];

            // Model 2
            ATModelWithAllTypes *input2 = [[ATModelWithAllTypes alloc] init];
            input2.charAttribute = 0x00A3; // Pound sign
            input2.intAttribute = INT_MIN;
            input2.shortAttribute = SHRT_MIN;
            input2.integerAttribute = INT_MIN;
            input2.stringAttribute = @"Hello Magnet";
            input2.booleanAttribute = NO;
            input2.floatAttribute = 0.12345f;
            input2.byteAttribute = CHAR_MIN;
            input2.doubleAttribute = -M_PI;
            input2.longAttribute = LLONG_MIN;
            input2.enumAttribute = ATEnumAttributeSTARTED;
            ATSubModel *subModel2 = [[ATSubModel alloc] init];
            subModel2.intAttribute = INT_MIN;
            subModel2.stringAttribute = @"Hola Mundo";
            input2.subModelAttribute = subModel2;
            input2.listOfShortsAttribute = @[@(SHRT_MIN), @(SHRT_MAX), @(0)];

            NSArray *input = @[input1, input2];

            it(@"should return the expected response over HTTP", ^{
                verifyListOfModelsAsBodyParameter(_HTTPService, input);
            });
        });


        context(@"when passing a map of <string,boolean> as a BODY parameter", ^{

            NSDictionary *input = @{
                    @"key1" : @(YES),
                    @"key2" : @(NO),
                    @"key3" : @(YES),
            };

            it(@"should return the expected response over HTTP", ^{
                verifyMapOfBooleansAsBodyParameter(_HTTPService, input);
            });
        });

        context(@"when passing a map of <string,char> as a BODY parameter", ^{

            NSDictionary *input = @{
                    @"key1" : @(CHAR_MIN),
                    @"key2" : @(CHAR_MAX),
                    @"key3" : @(0),
            };

            it(@"should return the expected response over HTTP", ^{
                verifyMapOfCharsAsBodyParameter(_HTTPService, input);
            });
        });

        context(@"when passing a map of <string,unichar> as a BODY parameter", ^{

            NSDictionary *input = @{
                    @"key1" : @"★",
                    @"key2" : @"£",
                    @"key3" : @"1",
            };

            it(@"should return the expected response over HTTP", ^{
                verifyMapOfUniCharsAsBodyParameter(_HTTPService, input);
            });
        });

        context(@"when passing a map of <string,short> as a BODY parameter", ^{

            NSDictionary *input = @{
                    @"key1" : @(SHRT_MIN),
                    @"key2" : @(SHRT_MAX),
                    @"key3" : @(0),
            };

            it(@"should return the expected response over HTTP", ^{
                verifyMapOfShortsAsBodyParameter(_HTTPService, input);
            });
        });

        context(@"when passing a map of <string,int> as a BODY parameter", ^{

            NSDictionary *input = @{
                    @"key1" : @(INT_MIN),
                    @"key2" : @(INT_MAX),
                    @"key3" : @(0),
            };

            it(@"should return the expected response over HTTP", ^{
                verifyMapOfIntsAsBodyParameter(_HTTPService, input);
            });
        });

        context(@"when passing a map of <string,long long> as a BODY parameter", ^{

            NSDictionary *input = @{
                    @"key1" : @(LLONG_MIN),
                    @"key2" : @(LLONG_MAX),
                    @"key3" : @(0),
            };

            it(@"should return the expected response over HTTP", ^{
                verifyMapOfLongLongsAsBodyParameter(_HTTPService, input);
            });
        });

        context(@"when passing a map of <string,string> as a BODY parameter", ^{

            NSDictionary *input = @{
                    @"key1" : @"Johnny Appleseed",
                    @"key2" : @"johnny.appleseed@magnet.com",
                    @"key3" : @"123-123-1122",
            };

            it(@"should return the expected response over HTTP", ^{
                verifyMapOfStringsAsBodyParameter(_HTTPService, input);
            });
        });

        context(@"when passing a map of <string,float> as a BODY parameter", ^{

            NSDictionary *input = @{
                    @"key1" : @(0.12345f),
                    @"key2" : @(1.2345f),
                    @"key3" : @(0),
            };

            it(@"should return the expected response over HTTP", ^{
                verifyMapOfFloatsAsBodyParameter(_HTTPService, input);
            });
        });

        context(@"when passing a map of <string,double> as a BODY parameter", ^{

            NSDictionary *input = @{
                    @"key1" : @(-M_PI),
                    @"key2" : @(M_PI),
                    @"key3" : @(0),
            };

            it(@"should return the expected response over HTTP", ^{
                verifyMapOfDoublesAsBodyParameter(_HTTPService, input);
            });
        });

        context(@"when passing a map of <string,enum> as a BODY parameter", ^{

            NSDictionary *input = @{
                    @"key1" : @(ATEnumAttributeSTARTED),
                    @"key2" : @(ATEnumAttributeINPROGRESS),
                    @"key3" : @(ATEnumAttributeENDED),
            };

            it(@"should return the expected response over HTTP", ^{
                verifyMapOfEnumsAsBodyParameter(_HTTPService, input);
            });
        });

        context(@"when passing a map of <string,complex types (models)> as a BODY parameter", ^{

            // Model 1
            ATModelWithAllTypes *input1 = [[ATModelWithAllTypes alloc] init];
            input1.charAttribute = 0x2605; // Star sign
            input1.intAttribute = INT_MAX;
            input1.shortAttribute = SHRT_MAX;
            input1.integerAttribute = INT_MAX;
            input1.stringAttribute = @"Hello Magnet";
            input1.booleanAttribute = YES;
            input1.floatAttribute = 1.2345f;
            input1.byteAttribute = CHAR_MAX;
            input1.doubleAttribute = M_PI;
            input1.longAttribute = LLONG_MAX;
            input1.enumAttribute = ATEnumAttributeENDED;
            ATSubModel *subModel1 = [[ATSubModel alloc] init];
            subModel1.intAttribute = INT_MAX;
            subModel1.stringAttribute = @"Hello SubModel";
            input1.subModelAttribute = subModel1;

            // Model 2
            ATModelWithAllTypes *input2 = [[ATModelWithAllTypes alloc] init];
            input2.charAttribute = 0x00A3; // Pound sign
            input2.intAttribute = INT_MIN;
            input2.shortAttribute = SHRT_MIN;
            input2.integerAttribute = INT_MIN;
            input2.stringAttribute = @"Hello Magnet";
            input2.booleanAttribute = NO;
            input2.floatAttribute = 0.12345f;
            input2.byteAttribute = CHAR_MIN;
            input2.doubleAttribute = -M_PI;
            input2.longAttribute = LLONG_MIN;
            input2.enumAttribute = ATEnumAttributeSTARTED;
            ATSubModel *subModel2 = [[ATSubModel alloc] init];
            subModel2.intAttribute = INT_MIN;
            subModel2.stringAttribute = @"Hola Mundo";
            input2.subModelAttribute = subModel2;

            NSDictionary *input = @{
                    @"key1" : input1,
                    @"key2" : input2,
            };

            it(@"should return the expected response over HTTP", ^{
                verifyMapOfModelsAsBodyParameter(_HTTPService, input);
            });
        });

    });

SPEC_END