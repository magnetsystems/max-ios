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
@testable import MagnetMax

class MMAttachmentSpec : QuickSpec {
    override func spec() {
        
        describe("MMAttachment") {
            
            it("should implement Equatable") {
                let attachment = MMFileAttachment(fileURL: NSURL(fileURLWithPath: NSBundle(forClass: MMAttachmentServiceSpec.self).pathForResource("GoldenGateBridge1", ofType: "jpg")!), fileName: "GoldenGateBridge1.jpg", name: "file", summary: "Golden Gate Bridge", mimeType: "image/jpeg")
                let attachmentID = NSUUID().UUIDString
                attachment.attachmentID = attachmentID
                
                let attachment2 = MMFileAttachment(fileURL: NSURL(fileURLWithPath: NSBundle(forClass: MMAttachmentServiceSpec.self).pathForResource("GoldenGateBridge2", ofType: "jpg")!), fileName: "GoldenGateBridge2.jpg", name: "file", summary: "Golden Gate Bridge", mimeType: "image/jpeg")
                attachment2.attachmentID = attachmentID
                
                expect(attachment).to(equal(attachment2))
            }
        }
    }
}

