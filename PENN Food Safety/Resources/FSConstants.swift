//
//  FSConstants.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 03/08/22.
//

import Foundation
import UIKit

struct FSConstants {
    
    struct UserDefault {
        static let pushNotificationKey = "pushNotificationKey"
        static let deviceIdKey = "deviceIdKey"
        static let accessToken = "accessToken"
        static let refreshToken = "refreshToken"
        static let siteID = "extension_SiteID"
        static let roleID = "extension_RoleID"
        static let clientID = "extension_ClientID"
        static let accessTokenExpiryTime = "accessTokenExpirationDate"

    }
    
    // API Keys
    struct APIKeys {
        static var kClientKey = ""
    }
    
    // API Headers
    struct APIHeaders {
        static var kContentType = "Content-Type"
        static var contentTypeValue = "application/json"
    }
    
    struct AlertMessages {
        
        static let noNetworkError = "To enjoy all of the features of this app, you must be connected to the Internet.\n\nPlease check your device settings and try again."
        
    }
    
    struct AppAuthConfiguration {
        /**
         OAuth 2 client ID.
         
         Dynamic client registration is not demonstrated in this example.
         */
        static let clientId = "food-safety"
        
        /**
         Scheme used in the redirection URI.
         
         This value is provided separately so that its presence in `Info.plist` can be easily checked and so that it can be reused with different redirection URIs.
         */
        static let redirectionUriScheme = "https" // "com.forgeops.ios-appauth-basic"
        
        /**
         OAuth 2 redirection URI for the client.
         
         The redirection URI is provided as a computed property, so that it can refer to the class' instance properties.
         */
        static var redirectionUri: String {
            return FSConstants.AppAuthConfiguration.redirectionUriScheme + "pcfs://callback"
        }
        
        /**
         The key under which the authorization state will be saved in a keyed archive.
         */
        static let authStateKey = "authState"
        
        /**
         OpenID Connect issuer URL, where the OpenID configuration can be obtained from.
         */
        static let issuerUrl: String = "https://auth.dev.pennconnected.com/auth/realms/PENN"
        
        /**
         App Group name.
         
         Serves as a reference to the App Group for sharing the authentication state.
         */
        static let appGroup = "group.com.forgerock.sso-webview"
        
        /**
         Cookies to be shared with the App Group.
         */
        static let appGroupCookies = ["iPlanetDirectoryPro"]
    }
    struct Storyboard {
        static let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        static let cabinetStoryboard: UIStoryboard = UIStoryboard(name: "Cabinet", bundle: nil)

        
    }
   
   
    
}
func SWIFT_CLASS_STRING(_ className: String) -> String? {
    return "\(Bundle.main.infoDictionary!["CFBundleName"] as! String).\(className)";
}


func SET_OBJ_FOR_KEY(_ obj: Any, key: String) {
    UserDefaults.standard.set(obj, forKey: key)
    UserDefaults.standard.synchronize()
}

func OBJ_FOR_KEY(_ key: String) -> Any? {
    if UserDefaults.standard.object(forKey: key) != nil {
        return UserDefaults.standard.object(forKey: key)! as AnyObject?
    }
    return nil
}



func SET_INTEGER_FOR_KEY(_ integer: Int, key: String) {
    UserDefaults.standard.set(integer, forKey: key)
}

func INTEGER_FOR_KEY(_ key: String) -> Int? {
    return UserDefaults.standard.integer(forKey: key)
}

func SET_FLOAT_FOR_KEY(_ float: Float, key: String) {
    UserDefaults.standard.set(float, forKey: key)
}

func FLOAT_FOR_KEY(_ key: String) -> Float? {
    return UserDefaults.standard.float(forKey: key)
}

func SET_BOOL_FOR_KEY(_ bool: Bool, key: String) {
    UserDefaults.standard.set(bool, forKey: key)
}

func BOOL_FOR_KEY(_ key: String) -> Bool? {
    return UserDefaults.standard.bool(forKey: key)
}

func REMOVE_OBJ_FOR_KEY(_ key: String) {
    UserDefaults.standard.removeObject(forKey: key)
}
