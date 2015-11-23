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
    public internal(set) var attachmentID: String?
    public private(set) var name: String?
    public private(set) var summary: String?
    public private(set) var mimeType: String
    
    init(name: String?, summary: String?, mimeType: String) {
        self.name = name
        self.summary = summary
        self.mimeType = mimeType
    }
    
    func toDictionary() -> [String: AnyObject] {
        var dictionary = ["mimeType": mimeType]
        if let attachmentID = self.attachmentID {
            dictionary["attachmentID"] = attachmentID
        }
        if let name = self.name {
            dictionary["name"] = name
        }
        if let summary = self.summary {
            dictionary["summary"] = summary
        }
        
        return dictionary
    }
    
    func toJSON() -> NSData? {
        let dictionary = toDictionary()
        if NSJSONSerialization.isValidJSONObject(dictionary) {
            do {
                let data = try NSJSONSerialization.dataWithJSONObject(dictionary, options: NSJSONWritingOptions(rawValue: 0))
                return data
            } catch {
                return nil
            }
        }
        return nil
    }
    
    public func toJSONString() -> String {
        var jsonString = ""
        if let jsonData = toJSON() {
            jsonString = NSString(data: jsonData, encoding: NSUTF8StringEncoding) as! String
        }
        
        return jsonString
    }
    
    static public func fromJSONString(jsonString: String) -> Self? {
        do {
            let object = try NSJSONSerialization.JSONObjectWithData(jsonString.dataUsingEncoding(NSUTF8StringEncoding)!, options: NSJSONReadingOptions(rawValue: 0))
            if let dictionary = object as? [String: AnyObject] {
                return fromDictionary(dictionary)
            }
        } catch {
            return nil
        }
        
        return nil
    }
    
    class func fromDictionary(dictionary: [String: AnyObject]) -> Self? {
        return nil
    }
    
    override public func isEqual(object: AnyObject?) -> Bool {
        if let rhs = object as? MMAttachment {
            return attachmentID != nil && attachmentID == rhs.attachmentID
        }
        return false
    }
}

@objc public class MMFileAttachment: MMAttachment {
    public private(set) var fileURL: NSURL?
    public private(set) var fileName: String?
    
    required public init(fileURL: NSURL?, fileName: String?, name: String?, summary: String?, mimeType: String) {
        self.fileName = fileName
        self.fileURL = fileURL
        super.init(name: name, summary: fileName, mimeType: mimeType)
    }
    
    override public func toDictionary() -> [String: AnyObject] {
        var dictionary = super.toDictionary()
        if let fileName = self.fileName {
            dictionary["fileName"] = fileName
        }
        
        return dictionary
    }
    
    override class func fromDictionary(dictionary: [String: AnyObject]) -> Self? {
        let fileAttachment = self.init(fileURL: nil, fileName: dictionary["fileName"] as? String, name: dictionary["name"] as? String, summary: dictionary["summary"] as? String, mimeType: dictionary["mimeType"] as! String)
        fileAttachment.attachmentID = dictionary["attachmentID"] as? String
        
        return fileAttachment
    }
    
    public func download(success: ((attachment: MMFileAttachment) -> Void)?, failure: ((error: NSError) -> Void)?) {
        // FIXME: Check for attachmentID
        if let attachmentID = self.attachmentID {
            MMAttachmentService.download(attachmentID, success: { URL in
                self.fileURL = URL
                success?(attachment: self)
                }) { error in
                    failure?(error: error)
            }
        }
    }
    
}

@objc public class MMDataAttachment: MMAttachment {
    public private(set) var data: NSData?
    public private(set) var fileName: String?
    
    required public init(data: NSData?, fileName: String?, name: String?, summary: String?, mimeType: String) {
        self.data = data
        self.fileName = fileName
        super.init(name: name, summary: summary, mimeType: mimeType)
    }
    
    override public func toDictionary() -> [String: AnyObject] {
        var dictionary = super.toDictionary()
        if let fileName = self.fileName {
            dictionary["fileName"] = fileName
        }
        
        return dictionary
    }
    
    override class func fromDictionary(dictionary: [String: AnyObject]) -> Self? {
        let dataAttachment = self.init(data: nil, fileName: dictionary["fileName"] as? String, name: dictionary["name"] as? String, summary: dictionary["summary"] as? String, mimeType: dictionary["mimeType"] as! String)
        dataAttachment.attachmentID = dictionary["attachmentID"] as? String
        
        return dataAttachment
    }
}

@objc public class MMAttachmentService: NSObject {
    
    static public func upload(attachments: [MMAttachment], success: (() -> ())?, failure: ((error: NSError) -> Void)?) {
        guard let uploadURL = NSURL(string: "com.magnet.server/file/save/multiple", relativeToURL: MMCoreConfiguration.serviceAdapter.endPoint.URL)?.absoluteString else {
            fatalError("uploadURL should not be nil")
        }
        let request = AFHTTPRequestSerializer().multipartFormRequestWithMethod(MMStringFromRequestMethod(MMRequestMethod.POST), URLString: uploadURL, parameters: nil, constructingBodyWithBlock: { formData in
            for i in 0..<attachments.count {
                let attachment = attachments[i]
                if let fileAttachment = attachment as? MMFileAttachment {
                    let _ = try? formData.appendPartWithFileURL(fileAttachment.fileURL!, name: fileAttachment.name ?? "file", fileName: fileAttachment.fileName ?? fileAttachment.fileURL?.lastPathComponent ?? "unknownFile\(i)", mimeType: fileAttachment.mimeType)
                } else if let dataAttachment = attachment as? MMDataAttachment {
                    formData.appendPartWithFileData(dataAttachment.data!, name: dataAttachment.name ?? "file", fileName: dataAttachment.fileName ?? "unknownFile\(i)", mimeType: dataAttachment.mimeType)
                } else {
                    
                }
            }
            }, error: nil)
        
        request.setValue("Bearer \(MMCoreConfiguration.serviceAdapter.HATToken)", forHTTPHeaderField: "Authorization")
        let uploadTask = MMCoreConfiguration.serviceAdapter.backgroundSessionManager.uploadTaskWithStreamedRequest(request, progress: nil) { response, responseObject, error in
            if let e = error {
                failure?(error: e)
            } else {
                do {
                    let res = try AFJSONResponseSerializer().responseObjectForResponse(response, data: responseObject as? NSData)
                    if let dictionary = res as? [String: String]  {
                        for i in 0..<attachments.count {
                            let attachment = attachments[i]
                            var fileName: String = ""
                            if let fileAttachment = attachment as? MMFileAttachment {
                                fileName = fileAttachment.fileName ?? "unknownFile\(i)"
                            } else if let dataAttachment = attachment as? MMDataAttachment {
                                fileName = dataAttachment.fileName ?? "unknownFile\(i)"
                            } else {
                                
                            }
                            let attachmentID = dictionary[fileName]
                            attachment.attachmentID = attachmentID
                        }
                        success?()
                    }
                } catch let error as NSError {
                    failure?(error: error)
                }
            }
        }
        uploadTask.resume()
    }
    
    static public func download(attachmentID: String, success: ((NSURL) -> ())?, failure: ((error: NSError) -> Void)?) {
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
//                guard let httpResponse = response as? NSHTTPURLResponse else {
//                    fatalError("response should be of type NSHTTPURLResponse")
//                }
//                let headers = httpResponse.allHeaderFields["Content-Type"] as! [String: AnyObject]
//                var contentType = "application/octet-stream"
//                if let contentTypeHeader = headers["Content-Type"] as? String {
//                    contentType = contentTypeHeader
//                }
                    success?(filePath!)
                }
        }
        
        downloadTask.resume()
    }
    
}