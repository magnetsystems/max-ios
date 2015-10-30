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
import AFNetworking

class MMReachabilityConditionSpec : QuickSpec {
    override func spec() {
        describe("MMReachabilityCondition") {
            it("allows you to suspend operation until you are online!") {
                var isFinished = false
                let queue: OperationQueue = OperationQueue()
                let operation = BlockOperation { (continuation: Void -> Void) in
                    isFinished = true
                    continuation()
                }
                // Initialize the condition first!
                let reachabilityCondition = MMReachabilityCondition()
                
                // Pretend we are Disconnected
                let userInfo = [AFNetworkingReachabilityNotificationStatusItem: NSNumber(integer: AFNetworkReachabilityStatus.NotReachable.rawValue)]
                NSNotificationCenter.defaultCenter().postNotificationName(AFNetworkingReachabilityDidChangeNotification, object: nil, userInfo: userInfo)
                operation.addCondition(reachabilityCondition)
                
                queue.addOperation(operation)
                
                // Reconnect after 3 seconds!
                let interval: NSTimeInterval = 3
                let when = dispatch_time(DISPATCH_TIME_NOW, Int64(interval * Double(NSEC_PER_SEC)))
                dispatch_after(when, dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0)) {
                    // Now, we are connected again!
                    let userInfo = [AFNetworkingReachabilityNotificationStatusItem: NSNumber(integer: AFNetworkReachabilityStatus.ReachableViaWWAN.rawValue)]
                    NSNotificationCenter.defaultCenter().postNotificationName(AFNetworkingReachabilityDidChangeNotification, object: nil, userInfo: userInfo)
                }
                
                expect{isFinished}.toEventually(beTruthy(), timeout: 10, pollInterval: 2, description: "Could not execute")
            }
        }
    }
}
