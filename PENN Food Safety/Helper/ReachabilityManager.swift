//
//  ReachabilityManager.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 03/08/22.
//

import Foundation
import Reachability

let kReachabilityManagerInternetDidBecomeReachableNotification = "ReachabilityManagerInternetDidBecomeReachableNotification"
let kReachabilityManagerInternetDidBecomeUnreachableNotification = "ReachabilityManagerInternetDidBecomeUnreachableNotification"
let kReachabilityManagerInternetDidChangeReachabilityNotification = "ReachabilityManagerInternetDidChangeReachabilityNotification"

final class ReachabilityManager {
    fileprivate let reachability = Reachability.forInternetConnection()

    static let sharedManager = ReachabilityManager()

    fileprivate init() {
        self.reachability?.startNotifier()
        self.reachability?.reachableBlock = { _ in
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: Notification.Name(rawValue: kReachabilityManagerInternetDidBecomeReachableNotification), object: self)
                NotificationCenter.default.post(name: Notification.Name(rawValue: kReachabilityManagerInternetDidChangeReachabilityNotification), object: self)
            }
        }
        self.reachability?.unreachableBlock = { _ in
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: Notification.Name(rawValue: kReachabilityManagerInternetDidBecomeUnreachableNotification), object: self)
                NotificationCenter.default.post(name: Notification.Name(rawValue: kReachabilityManagerInternetDidChangeReachabilityNotification), object: self)
            }
        }
    }

    var isInternetReachable: Bool {
        return self.reachability!.isReachable()
    }
}
