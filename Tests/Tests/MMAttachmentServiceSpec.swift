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

class MMAttachmentServiceSpec : QuickSpec {
    override func spec() {
        
        describe("MMAttachmentService") {
            
            let user = MMUser()
            user.firstName = "Jane"
            user.lastName = "Doe"
            user.email = "richmessageuser_\(NSDate.timeIntervalSinceReferenceDate())@magnet.com"
            user.userName = user.email
            user.password = "magnet"
            
            beforeSuite {
                let credential = NSURLCredential(user: user.userName, password: user.password, persistence: .None)
                var loggedInUser: MMUser?
                user.register({ user in
                    MMUser.login(credential, rememberMe: false, success: {
                        loggedInUser = MMUser.currentUser()
                    }) { error in
                    }
                }) { error in
                }
                
                expect(loggedInUser).toEventuallyNot(beNil(), timeout: 10)
            }
            
            afterSuite {
                var loggedInUser: MMUser? = MMUser()
                MMUser.logout({
                    loggedInUser = MMUser.currentUser()
                }, failure: { error in
                        
                })
                
                expect(loggedInUser).toEventually(beNil(), timeout: 10)
            }
            
            let attachment = MMAttachment(fileURL: NSURL(fileURLWithPath: NSBundle(forClass: MMAttachmentServiceSpec.self).pathForResource("GoldenGateBridge1", ofType: "jpg")!), mimeType: "image/jpeg")
            
            let attachment2 = MMAttachment(fileURL: NSURL(fileURLWithPath: NSBundle(forClass: MMAttachmentServiceSpec.self).pathForResource("GoldenGateBridge2", ofType: "jpg")!), mimeType: "image/jpeg", name: "Golden Gate Bridge", description: nil)
        
            it("should be able to upload attachments") {
                MMAttachmentService.upload([attachment, attachment2], metaData:nil, success: {
                    //
                }, failure: { error in
                    //
                })
                
                expect(attachment.attachmentID).toEventuallyNot(beNil(), timeout: 10)
                expect(attachment2.attachmentID).toEventuallyNot(beNil(), timeout: 10)
            }
            
            it("should be able to download attachments") {
                var localFilePath: NSURL?
                MMAttachmentService.download(attachment.attachmentID!, userID: MMUser.currentUser()?.userID, success: { filePath in
                    localFilePath = filePath
                }, failure: { error in
                    //
                })
                
                expect(localFilePath).toEventuallyNot(beNil(), timeout: 10)
            }
        }
    }
}

