//
//  DataManager.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 03/08/22.
//

import Foundation
import UIKit
import JWTDecode

class DataManager: NSObject {
    
    static let sharedManager: DataManager = DataManager()
    
    fileprivate var apnsTokenString: String?
    fileprivate var defaultDateFormatter: DateFormatter?
    fileprivate var accessTokenString: String?
    
    
    func apnsToken() -> String? {
        return apnsTokenString
    }
    
    func accessToken() -> String? {
        return accessTokenString
    }
    
    func setApnsToken(_ token: String?) {
        apnsTokenString = token
    }
    
    func setAccessToken(_ token: String?) {
        accessTokenString = token
    }
    
    var deviceIdentifier: String {
        if let deviceId = UserDefaults.standard.string(forKey: FSConstants.UserDefault.deviceIdKey) {
            return deviceId
        }
        let id = UIDevice.current.identifierForVendor?.uuidString
        UserDefaults.standard.set(id, forKey: FSConstants.UserDefault.deviceIdKey)
        UserDefaults.standard.synchronize()
        return id!
    }
    
    var pushNotificationEnabled: Bool {
        let standardUserDefaults = UserDefaults.standard
        if let remindersEnabled = standardUserDefaults.object(forKey: FSConstants.UserDefault.pushNotificationKey) as? NSNumber {
            return remindersEnabled.boolValue
        }
        //By Default disable push notifications
        return true
    }
    
    private func getCachedTokenExpiryTime() -> Date? {
        let standardUserDefaults = UserDefaults.standard
        let tokenExpiryTime = standardUserDefaults.object(forKey: FSConstants.UserDefault.accessTokenExpiryTime) as? Date
        return tokenExpiryTime
    }
    
     var isTokenExpired: Bool {
        print("currentDate \(Date.getCurrentDate())")
        if let expiryDate = getCachedTokenExpiryTime() {
            print("expiryDate \(expiryDate)")
            let timeAuthTokenCanBeRenewedByTimer = Date()
            return timeAuthTokenCanBeRenewedByTimer.compare(expiryDate) == .orderedDescending
        }
        return true
    }
    func isTokenValids() -> Bool{
        do  {
            let jwt = try decode(jwt: OBJ_FOR_KEY(FSConstants.UserDefault.accessToken) as! String)
            if jwt.expired {
                return true
            }
            
        } catch let error as NSError {
            print(error)
        }
        return false
    }
    
    func enablePushNotification(_ enable: Bool) {
        let standardUserDefaults = UserDefaults.standard
        standardUserDefaults.set(NSNumber(value: enable as Bool), forKey: FSConstants.UserDefault.pushNotificationKey)
        standardUserDefaults.synchronize()
    }
}

extension Date {
    static func getCurrentDate() -> Date {
        let currentDate = Date()
        return currentDate
    }
}


