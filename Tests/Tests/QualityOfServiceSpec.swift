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

import Foundation
import Quick
import Nimble
import MagnetMax

class QualityOfServiceSpec : QuickSpec {
    override func spec() {
        
        let service = ATDateType()
        let cacheOptions = MMCacheOptions(maxCacheAge: 86400, alwaysUseCacheIfOffline: true)
        
        describe("Caching") {
            
            beforeSuite {
                NSURLCache.sharedURLCache().removeAllCachedResponses()
            }
            
            xit("should fail for POST requests") {
                let service = ATPrimitiveTypeService()
                expect {
                    service.returnStringWithFormParameters("", success: { _ -> Void in
                        //
                    }, failure: { _ -> Void in
                        //
                    }).executeInBackground(MMCacheOptions(maxCacheAge: 86400, alwaysUseCacheIfOffline: true))
                }.to(raiseException())
            }
            
            it("should result in a cache-hit within maxCacheAge time") {
                var _isFinished = false
                
                service.getCurrentLongDateWithSuccess({ response -> Void in
                    let _response = response
                    delay(2) {
                        service.getCurrentLongDateWithSuccess({ response -> Void in
                            expect(response).to(equal(_response))
                            _isFinished = true
                        }) { error -> Void in
                                //
                        }.executeInBackground(cacheOptions)
                    }
                }) { error -> Void in
                    //
                }.executeInBackground(cacheOptions)
                
                expect(_isFinished).toEventually(beTrue(), timeout: 10);
            }
        }
    }
}

