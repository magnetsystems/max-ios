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

class MMUserSpec : QuickSpec {
    override func spec() {
        
        describe("MMUser") {
            
            let user = MMUser()
            user.firstName = "Jane"
            user.lastName = "Doe"
            user.email = "jane.doe_\(NSDate.timeIntervalSinceReferenceDate())@magnet.com"
            user.userName = user.email
            user.password = "magnet"
            
            it("should be able to register with valid information") {
                var createdUser: MMUser?
                user.register({ user in
                    createdUser = user
                }) { error in
                }
                
                expect(createdUser?.userID).toEventually(beNil(), timeout: 10)
                expect(createdUser?.firstName).toEventually(equal(user.firstName), timeout: 10)
                expect(createdUser?.lastName).toEventually(equal(user.lastName), timeout: 10)
                expect(createdUser?.email).toEventually(equal(user.email), timeout: 10)
            }
            
            it("should be able to login with valid information") {
                let credential = NSURLCredential(user: user.userName, password: user.password, persistence: .None)
                var loggedInUser: MMUser?
                MMUser.login(credential, rememberMe: false, success: {
                    loggedInUser = MMUser.currentUser()
                }) { error in
                }
                
                expect(loggedInUser?.userID).toEventually(beNil(), timeout: 10)
                expect(loggedInUser?.firstName).toEventually(equal(user.firstName), timeout: 10)
                expect(loggedInUser?.lastName).toEventually(equal(user.lastName), timeout: 10)
                expect(loggedInUser?.email).toEventually(equal(user.email), timeout: 10)
            }
            
            it("should be able to logout") {
                var loggedInUser: MMUser? = MMUser()
                MMUser.logout({ () -> Void in
                    loggedInUser = MMUser.currentUser()
                }) { (error) -> Void in
                }
                
                expect(loggedInUser).toEventually(beNil(), timeout: 10)
            }
            
            let user2 = MMUser()
            user2.firstName = "Jane2"
            user2.lastName = "Doe2"
            user2.email = "jane2.doe2_\(NSDate.timeIntervalSinceReferenceDate())@magnet.com"
            user2.userName = user2.email
            user2.password = "magnet"
            
            it("should be able to register second user with valid information") {
                var createdUser: MMUser?
                user2.register({ user in
                    createdUser = user
                    }) { error in
                }
                
                expect(createdUser?.userID).toEventually(beNil(), timeout: 10)
                expect(createdUser?.firstName).toEventually(equal(user2.firstName), timeout: 10)
                expect(createdUser?.lastName).toEventually(equal(user2.lastName), timeout: 10)
                expect(createdUser?.email).toEventually(equal(user2.email), timeout: 10)
            }
            
            it("should be able to login multiple times") {
                MagnetMax.configure(ATServiceAdapterHelper.defaultConfiguration())
                let credential = NSURLCredential(user: user.userName, password: user.password, persistence: .None)
                let credential2 = NSURLCredential(user: user2.userName, password: user2.password, persistence: .None)
                var didFinish : Bool = false
                MMUser.login(credential, rememberMe: false, success: {
                    MMUser.login(credential, rememberMe: true, success: {
                        MMUser.login(credential, rememberMe: false, success: {
                            MMUser.login(credential2, rememberMe: false, success: {
                         didFinish = true
                            }) { error in
                        }
                        }) { error in
                    }
                        }) { error in
                    }
                    }) { error in
                }
                
                expect(didFinish).toEventually(beTrue(), timeout: 15)
            }
        }
    }
}

