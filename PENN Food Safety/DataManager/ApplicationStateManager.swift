////
////  ApplicationStateManager.swift
////  PENN Food Safety
////
////  Created by Varun Shukla on 24/08/22.
////
//
//import AppAuth
//
//
//class ApplicationStateManager {
//    
//    var authState: OIDAuthState
//    private var configuration: OIDServiceConfiguration? = nil
//    var idToken: String? = nil
//    
//    /*
//     * Initialize the app's state when it starts
//     */
//    init() {
//        self.authState = OIDAuthState(authorizationResponse: nil, tokenResponse: nil, registrationResponse: nil)
//    }
//    
//    
//    var configData: OIDServiceConfiguration? {
//        get {
//            return self.configuration
//        }
//        set(value) {
//            self.configuration = value
//        }
//    }
//    
//    func saveState() {
//        var data: Data? = nil
//        if #available(iOS 12.0, *) {
//            data = try! NSKeyedArchiver.archivedData(withRootObject: authState, requiringSecureCoding: false)
//        } else {
//            data = NSKeyedArchiver.archivedData(withRootObject: authState)
//        }
//        UserDefaults.standard.set(data, forKey: FSConstants.AppAuthConfiguration.authStateKey)
//        UserDefaults.standard.synchronize()
//        
//        print("Authorization state has been saved.")
//    }
//    
//    func setAuthState(_ authState: OIDAuthState?) {
//        if (self.authState != authState) {
//            self.authState = authState!
//            self.stateChanged()
//        }
//    }
//    
//    func stateChanged() {
//        self.saveState()
//        /* if authState != nil {
//         getUserInfo()
//         } */
//    }
//    
//    func loadState() {
//        guard let data = UserDefaults.standard.object(forKey: FSConstants.AppAuthConfiguration.authStateKey) as? Data else {
//            return
//        }
//        
//        var authState: OIDAuthState? = nil
//        
//        if #available(iOS 12.0, *) {
//            authState = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? OIDAuthState
//        } else {
//            authState = NSKeyedUnarchiver.unarchiveObject(with: data) as? OIDAuthState
//        }
//        
//        if let authState = authState {
//            print("Authorization state has been loaded.")
//            
//            self.setAuthState(authState)
//        }
//    }
//}
