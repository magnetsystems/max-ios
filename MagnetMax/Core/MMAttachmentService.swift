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
    public private(set) var fileURL: NSURL?
    public private(set) var data: NSData?
    public private(set) var inputStream: NSInputStream?
    public private(set) var length: Int64?
    public private(set) var content: String?
    public internal(set) var attachmentID: String?
    public private(set) var name: String?
    public private(set) var summary: String?
    public private(set) var mimeType: String
    
    public lazy var downloadURL: NSURL? = {
        [unowned self] in
        if let attachmentID = self.attachmentID, let accessToken = MMCoreConfiguration.serviceAdapter.HATToken {
            let downloadURL = NSURL(string: "com.magnet.server/file/download/\(attachmentID)?access_token=\(accessToken)", relativeToURL: MMCoreConfiguration.serviceAdapter.endPoint.URL)
            return downloadURL
        }
        return nil
    }()
    
    public convenience init(fileURL: NSURL, mimeType: String) {
        self.init(fileURL: fileURL, mimeType: mimeType, name: nil, description: nil)
    }
    
    public convenience init(fileURL: NSURL, mimeType: String, name: String?, description: String?) {
        self.init(mimeType: mimeType, name: name, description: description)
        self.fileURL = fileURL
    }
    
    public convenience init(data: NSData, mimeType: String) {
        self.init(data: data, mimeType: mimeType, name: nil, description: nil)
    }
    
    public convenience init(data: NSData, mimeType: String, name: String?, description: String?) {
        self.init(mimeType: mimeType, name: name, description: description)
        self.data = data
    }
    
    public convenience init(inputStream: NSInputStream, length: Int64, mimeType: String) {
        self.init(inputStream: inputStream, length: length, mimeType: mimeType, name: nil, description: nil)
    }
    
    public convenience init(inputStream: NSInputStream, length: Int64, mimeType: String, name: String?, description: String?) {
        self.init(mimeType: mimeType, name: name, description: description)
        self.inputStream = inputStream
        self.length = length
    }
    
    public convenience init(content: String, mimeType: String) {
        self.init(content: content, mimeType: mimeType, name: nil, description: nil)
    }
    
    public convenience init(content: String, mimeType: String, name: String?, description: String?) {
        self.init(mimeType: mimeType, name: name, description: description)
        self.content = content
    }
    
    public required init(mimeType: String, name: String?, description: String?) {
        self.mimeType = mimeType
        self.name = name
        self.summary = description
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
        let attachment = self.init(mimeType: dictionary["mimeType"] as! String, name: dictionary["name"] as? String, description: dictionary["summary"] as? String)
        attachment.attachmentID = dictionary["attachmentID"] as? String
        
        return attachment
    }
    
    override public func isEqual(object: AnyObject?) -> Bool {
        if let rhs = object as? MMAttachment {
            return attachmentID != nil && attachmentID == rhs.attachmentID
        }
        return false
    }
    
    public func downloadToFile(fileURL: NSURL, success: (Void -> Void)?, failure: ((error: NSError) -> Void)?) {
        if let attachmentID = self.attachmentID {
            MMAttachmentService.download(attachmentID, success: { URL in
                do {
                    try NSFileManager.defaultManager().moveItemAtURL(URL, toURL: fileURL)
                } catch let error as NSError {
                    failure?(error: error)
                }
                success?()
            }) { error in
                failure?(error: error)
            }
        }
    }
    
    public func downloadFileWithSuccess(success: ((fileURL: NSURL) -> Void)?, failure: ((error: NSError) -> Void)?) {
        if let attachmentID = self.attachmentID {
            MMAttachmentService.download(attachmentID, success: { URL in
                self.fileURL = URL
                success?(fileURL: URL)
            }) { error in
                failure?(error: error)
            }
        }
    }
    
    public func downloadDataWithSuccess(success: ((data: NSData) -> Void)?, failure: ((error: NSError) -> Void)?) {
        if let attachmentID = self.attachmentID {
            MMAttachmentService.download(attachmentID, success: { URL in
                self.data = NSData(contentsOfURL: URL)
                success?(data: self.data!)
            }) { error in
                failure?(error: error)
            }
        }
    }
    
    public func downloadInputStreamWithSuccess(success: ((inputStream: NSInputStream, length: Int64) -> Void)?, failure: ((error: NSError) -> Void)?) {
        if let attachmentID = self.attachmentID {
            MMAttachmentService.download(attachmentID, success: { URL in
                self.inputStream = NSInputStream(URL: URL)
                let fileAttributes = try? NSFileManager.defaultManager().attributesOfItemAtPath(URL.path!)
                self.length = (fileAttributes?[NSFileSize] as? NSNumber)?.longLongValue
                success?(inputStream: self.inputStream!, length: self.length ?? 0)
            }) { error in
                failure?(error: error)
            }
        }
    }
    
    public func downloadStringWithSuccess(success: ((content: String) -> Void)?, failure: ((error: NSError) -> Void)?) {
        if let attachmentID = self.attachmentID {
            MMAttachmentService.download(attachmentID, success: { URL in
                if let data = NSData(contentsOfURL: URL), content = NSString(data: data, encoding: NSUTF8StringEncoding) as? String {
                    success?(content: content)
                }
            }) { error in
                failure?(error: error)
            }
        }
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
                if let fileURL = attachment.fileURL {
                    let _ = try? formData.appendPartWithFileURL(fileURL, name: attachment.name ?? "file", fileName: "attachment\(i)", mimeType: attachment.mimeType)
                } else if let data = attachment.data {
                    formData.appendPartWithFileData(data, name: attachment.name ?? "file", fileName: "attachment\(i)", mimeType: attachment.mimeType)
                } else if let inputStream = attachment.inputStream {
                    formData.appendPartWithInputStream(inputStream, name: attachment.name ?? "file", fileName: "attachment\(i)", length: attachment.length ?? 0, mimeType: attachment.mimeType)
                } else if let content = attachment.content {
                    if let data = content.dataUsingEncoding(NSUTF8StringEncoding) {
                        formData.appendPartWithFileData(data, name: attachment.name ?? "file", fileName: "attachment\(i)", mimeType: attachment.mimeType)
                    }
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
                            let attachmentID = dictionary["attachment\(i)"]
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
            let destination  = documentsDirectoryURL.URLByAppendingPathComponent("\(attachmentID)_\(response.suggestedFilename!)")
            //            let _ = try? NSFileManager.defaultManager().removeItemAtURL(destination)
            return destination
            
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