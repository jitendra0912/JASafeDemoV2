////
////  UnauthenticatedViewModel.swift
////  PENN Food Safety
////
////  Created by Varun Shukla on 24/08/22.
////
//
//import Foundation
//import AppAuth
//
//
//class UnauthenticatedViewModel {
//    
//    
//    var hideLoading: (()->())?
//    
////    private let config: ApplicationConfig
////    private let state: ApplicationStateManager
////    private let appauth: AppAuthHandler
////    private let onLoggedIn: () -> Void
//    
//    
////    init(
////        config: ApplicationConfig,
////        state: ApplicationStateManager,
////        appauth: AppAuthHandler,
////        onLoggedIn: @escaping () -> Void) {
////
////        self.config = config
////        self.state = state
////        self.appauth = appauth
////        self.onLoggedIn = onLoggedIn
////    }
//    
//    func startLogin() {
//        
////        if state.authState == nil {
////            let (issuerUrl, parseError) = config.getIssuerUri()
////            if issuerUrl == nil {
////                print("Error creating issuer URL for: \(parseError!)")
////                return
////            }
////        AppAuthHandler.authorizeRp(issuerUrl: FSConstants.AppAuthConfiguration.issuerUrl, configuration: nil)
//        
//        AppAuthHandler.authorizeRp(issuerUrl: FSConstants.AppAuthConfiguration.issuerUrl, configuration: nil) {
//            self.hideLoading?()
//        }
//        }
//    
//}
//    
//
//    
//
//        
//      
