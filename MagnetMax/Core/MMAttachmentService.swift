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
import AFNetworking

@objc public class MMAttachment: NSObject {
    public private(set) var attachmentID: String?
    public private(set) var name: String
    public private(set) var summary: String
    public private(set) var mimeType: String
    
    internal init(name: String, summary: String, mimeType: String) {
        self.name = name
        self.summary = summary
        self.mimeType = mimeType
    }
}

@objc public class MMFileAttachment: MMAttachment {
    public private(set) var fileURL: NSURL
    public private(set) var fileName: String
    
    public init(fileURL: NSURL, fileName: String, name: String, summary: String, mimeType: String) {
        self.fileName = fileName
        self.fileURL = fileURL
        super.init(name: name, summary: fileName, mimeType: mimeType)
    }
    
}

@objc public class MMDataAttachment: MMAttachment {
    public private(set) var data: NSData
    public private(set) var fileName: String
    
    init(data: NSData, fileName: String, name: String, summary: String, mimeType: String) {
        self.data = data
        self.fileName = fileName
        super.init(name: name, summary: fileName, mimeType: mimeType)
    }
    
}

@objc public class MMAttachmentService: NSObject {
    
    static public func upload(attachments: [MMAttachment], success: (() -> ())?, failure: ((error: NSError) -> Void)?) {
        guard let uploadURL = NSURL(string: "com.magnet.server/file/save", relativeToURL: MMCoreConfiguration.serviceAdapter.endPoint.URL)?.absoluteString else {
            fatalError("uploadURL should not be nil")
        }
        let request = AFHTTPRequestSerializer().multipartFormRequestWithMethod(MMStringFromRequestMethod(MMRequestMethod.POST), URLString: uploadURL, parameters: nil, constructingBodyWithBlock: { formData in
            for attachment in attachments {
                if let fileAttachment = attachment as? MMFileAttachment {
                    let _ = try? formData.appendPartWithFileURL(fileAttachment.fileURL, name: fileAttachment.name, fileName: fileAttachment.fileName, mimeType: fileAttachment.mimeType)
                } else if let dataAttachment = attachment as? MMDataAttachment {
                    formData.appendPartWithFileData(dataAttachment.data, name: dataAttachment.name, fileName: dataAttachment.fileName, mimeType: dataAttachment.mimeType)
                } else {
                    
                }
            }
        }, error: nil)
        
        request.setValue("Bearer \(MMCoreConfiguration.serviceAdapter.HATToken)", forHTTPHeaderField: "Authorization")
        let uploadTask = MMCoreConfiguration.serviceAdapter.backgroundSessionManager.uploadTaskWithStreamedRequest(request, progress: nil) { response, responseObject, error in
            if let e = error {
                failure?(error: e)
            } else {
                if let data = responseObject as? NSData {
                    if let attachmentID = NSString(data: data, encoding: NSUTF8StringEncoding) as? String {
                        attachments.first?.attachmentID = attachmentID
                        success?()
                    }
                }
            }
        }
        uploadTask.resume()
    }
    
    static public func download(attachmentID: String, success: ((MMAttachment) -> ())?, failure: ((error: NSError) -> Void)?) {
        guard let downloadURL = NSURL(string: "com.magnet.server/file/download/\(attachmentID)", relativeToURL: MMCoreConfiguration.serviceAdapter.endPoint.URL) else {
            fatalError("downloadURL should not be nil")
        }
        let request = NSMutableURLRequest(URL: downloadURL)
        request.setValue("Bearer \(MMCoreConfiguration.serviceAdapter.HATToken)", forHTTPHeaderField: "Authorization")
        
        let downloadTask = MMCoreConfiguration.serviceAdapter.backgroundSessionManager.downloadTaskWithRequest(request, progress: nil, destination: { targetPath, response in
            let documentsDirectoryURL = try! NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)
            return documentsDirectoryURL.URLByAppendingPathComponent(response.suggestedFilename!)
        }) { response, filePath, error in
            if let e = error {
                failure?(error: e)
            } else {
                let fileAttachment = MMFileAttachment(fileURL: filePath!, fileName: "", name: "", summary: "", mimeType: "image/jpeg")
                success?(fileAttachment)
            }
        }
        
        downloadTask.resume()
    }
    
}