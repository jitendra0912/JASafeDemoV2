//
//  User+API.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 03/08/22.
//

import Foundation

class User {
    
    func registerDeviceWithToken(_ token: String) {
        guard ReachabilityManager.sharedManager.isInternetReachable else {
            return ()
        }
        let deviceID = DataManager.sharedManager.deviceIdentifier
    }
}

func unregisterDevice(_ isLogout: Bool) {
    guard ReachabilityManager.sharedManager.isInternetReachable else {
        return ()
    }
    let deviceID = DataManager.sharedManager.deviceIdentifier
    if isLogout {
        DataManager.sharedManager.enablePushNotification(true)
    }
    AppDelegate.unregisterForPushNotifications()
}


