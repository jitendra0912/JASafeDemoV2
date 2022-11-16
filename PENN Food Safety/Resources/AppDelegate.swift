//
//  AppDelegate.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 08/07/22.
//

import UIKit
import AppAuth
import UserNotifications


@main
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate {
    
    var currentAuthorizationFlow: OIDExternalUserAgentSession?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        do {
            if let path = Bundle.main.path(forResource: "DataSources", ofType: "json"),
                let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
                let json = try JSONSerialization.jsonObject(with: data) as? [Any] {
                let dictionary = ["sources" : json]
                UserDefaults.standard.register(defaults: dictionary)
            }
        } catch {
            print("Error deserializing JSON: \(error)")
        }
        
       
        
        
        UNUserNotificationCenter.current().delegate = self
      
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        if let authorizationFlow = self.currentAuthorizationFlow, authorizationFlow.resumeExternalUserAgentFlow(with: url) {
            self.currentAuthorizationFlow = nil
            return true
        }
        
        return false
    }
    
    // MARK:- Push Notifications
    static func registerForPushNotifications(callback: ((_ accepted: Bool) -> Void)? = nil) {
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) {(accepted, error) in
                DispatchQueue.main.async {
                    if accepted {
                        UIApplication.shared.registerForRemoteNotifications()
                    }
                    if let callback = callback {
                        callback(accepted)
                    }
                }
            }
        } else {
            let settings: UIUserNotificationSettings = UIUserNotificationSettings(types:[.alert, .sound], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(settings)
            UIApplication.shared.registerForRemoteNotifications()
        }
    }
    
    static func unregisterForPushNotifications() {
        UIApplication.shared.unregisterForRemoteNotifications()
        DataManager.sharedManager.setApnsToken(nil)
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//        let tokenString = deviceToken.hexString()
        //        if let user = DataManager.sharedManager.currentUser, DataManager.sharedManager.apnsToken() == nil, DataManager.sharedManager.pushNotificationEnabled {
        //            _ = user.registerDeviceWithToken(tokenString)
        //        }
//        DataManager.sharedManager.setApnsToken(tokenString)
//        print("Token: \(tokenString)")
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        
        print("error")
        
    }
    
}

//extension Data {
//    func hexString() -> String {
//        var string = ""
//        self.forEach { (byte) in
//            string += String(format: "%02x", byte)
//        }
//        return string
//    }
//}

