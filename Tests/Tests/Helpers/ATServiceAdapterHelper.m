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

#import "ATServiceAdapterHelper.h"
#import <AFNetworking/AFSecurityPolicy.h>
#import "ATDictionaryConfiguration.h"
#import <AFOAuth2Manager/AFOAuth2Manager.h>

@interface ATServiceAdapterHelper ()

+ (MMClient *)clientWithPinnedCertificate;

+ (MMServiceAdapter *)adapterWithURLString:(NSString *)theURLString;

@end

@implementation ATServiceAdapterHelper

+ (void)load {
    // Delete the CAT token
    [AFOAuthCredential deleteCredentialWithIdentifier:@"com.magnet.networking.cattoken"];
    
    [MMCoreConfiguration setCurrentConfiguration:[self defaultConfiguration]];
    [MMCoreConfiguration setServiceAdapter:[self defaultHTTPTestAdapter]];
    
    [MMLogger sharedLogger].level = MMLoggerLevelVerbose;
    [MMLogger sharedLogger].options = MMFileLogging/* | MMTTYLogging*/;
    [[MMLogger sharedLogger] startLogging];
}

+ (id <MMConfiguration>)defaultConfiguration {
    
    NSString *theURLString = @"http://localhost:8443/api/";
    
    NSString *filePath = [[NSBundle bundleForClass:self.class] pathForResource:@"keys" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
    NSError *error;
    NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    json[@"url"] = theURLString;
    id <MMConfiguration> configuration = [ATDictionaryConfiguration configurationWithDictionary:json];
    
    return configuration;
}

+ (MMServiceAdapter *)defaultHTTPTestAdapter {
    return [MMServiceAdapter adapterWithConfiguration:[self defaultConfiguration]];
}

+ (MMServiceAdapter *)defaultWSTestAdapter {

//    return [self adapterWithURLString:@"ws://priteshs-macbook-pro.local:8443"];
    return [self adapterWithURLString:@"ws://localhost:8443/api/"];
}

+ (MMServiceAdapter *)defaultHTTPSTestAdapter {

//    MMServiceAdapter *serviceAdapter = [self adapterWithURLString:@"https://priteshs-macbook-pro.local:8443"];
    MMServiceAdapter *serviceAdapter = [self adapterWithURLString:@"https://localhost:8443/api/"];

    serviceAdapter.client = [self clientWithPinnedCertificate];

    return serviceAdapter;
}

+ (MMServiceAdapter *)defaultWSSTestAdapter {

//    MMServiceAdapter *serviceAdapter = [self adapterWithURLString:@"wss://priteshs-macbook-pro.local:8443"];
    MMServiceAdapter *serviceAdapter = [self adapterWithURLString:@"wss://localhost:8443/api/"];

    serviceAdapter.client = [self clientWithPinnedCertificate];

    return serviceAdapter;
}

#pragma mark - Private implementation

+ (MMClient *)clientWithPinnedCertificate {

    MMClient *client = [[MMClient alloc] init];

    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey];
    securityPolicy.allowInvalidCertificates = YES;
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [bundle pathForResource:@"Deep Thought" ofType:@"cer"];
    NSData *certificateData = [NSData dataWithContentsOfFile:path];
    securityPolicy.pinnedCertificates = @[certificateData];
//        securityPolicy.validatesDomainName = NO;
//        securityPolicy.validatesCertificateChain = NO;
    client.securityPolicy = securityPolicy;

    return client;
}

+ (MMServiceAdapter *)adapterWithURLString:(NSString *)theURLString {

    NSString *filePath = [[NSBundle bundleForClass:self.class] pathForResource:@"keys" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
    NSError *error;
    NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    MMServiceAdapter *serviceAdapter;
    json[@"url"] = theURLString;
    id <MMConfiguration> configuration = [ATDictionaryConfiguration configurationWithDictionary:json];
    if (!error) {
        serviceAdapter = [MMServiceAdapter adapterWithConfiguration:configuration];
    }
	
    return serviceAdapter;
}

@end