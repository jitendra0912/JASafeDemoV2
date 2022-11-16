////
////  MainViewModel.swift
////  PENN Food Safety
////
////  Created by Varun Shukla on 24/08/22.
////
//
//import Foundation
//
//
//class MainViewModel {
//    
//    private let config: ApplicationConfig
//    private let state: ApplicationStateManager
//    private let appauth: AppAuthHandler
////    private var unauthenticatedModel: UnauthenticatedViewModel?
////    private var authenticatedModel: AuthenticatedViewModel?
//    
//    
//    
//    init(config: ApplicationConfig, state: ApplicationStateManager, appauth: AppAuthHandler) {
//        
//        // Create globals
//        self.config = try! ApplicationConfigLoader.load()
//        self.state = ApplicationStateManager()
//        self.appauth = AppAuthHandler(config: self.config)
//        
//        // These are created on first use
////        self.unauthenticatedModel = nil
////        self.authenticatedModel = nil
//    }
//    
//    
//    
//    
//    func onLoggedIn() {
//        self.isAuthenticated = true
//    }
//
//    func onLoggedOut() {
//        self.isAuthenticated = false
//    }
//    
//    
//}
