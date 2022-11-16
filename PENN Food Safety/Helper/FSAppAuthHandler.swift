//
//  FSAppAuthHandler.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 05/09/22.
//

import Foundation
import AppAuth
class FSAppAuthHandler {
    
    private let config: FSApplicationConfig
    private var userAgentSession: OIDExternalUserAgentSession?
    private var delegate: FSWebViewControllerDelegate?
    private var authorizationRequest: OIDAuthorizationRequest? = nil
    typealias CompletionBlock = ( _ respose : OIDTokenResponse, _ error: Error?) -> Void
    var completionBlock: CompletionBlock?
    init(config: FSApplicationConfig) {
        self.config = config
        self.userAgentSession = nil
        
    }
    
    func discoverOIDServiceConfiguration(completion: @escaping (OIDServiceConfiguration?, Error?) -> Void) {
        let (issuerUrl, parseError) = self.config.getIssuerUri()
        guard let issuer = issuerUrl else {
            return
        }
        OIDAuthorizationService.discoverConfiguration(forIssuer: issuer) {
            configuration, error in
            if let error = error  {
                completion(nil, error)
                return
            }
            
            guard let configuration = configuration else {
                return
            }
            completion(configuration, error)
            
        }
        
    }
    
    //    private func discoverOIDServiceConfiguration(_ issuerUrl: URL?, completion: @escaping (OIDServiceConfiguration?, Error?) -> Void) {
    //        // Checking if the issuer's URL can be constructed.
    //        guard let issuer = issuerUrl else {
    //            return
    //        }
    //        OIDAuthorizationService.discoverConfiguration(forIssuer: issuer) {
    //            configuration, error in
    //            if let error = error  {
    //                completion(nil, error)
    //                return
    //            }
    //
    //            guard let configuration = configuration else {
    //                return
    //            }
    //            completion(configuration, error)
    //
    //        }
    //    }
    func performAuthorizationRedirect(metadata: OIDServiceConfiguration,clientID: String,
                                      viewController: UIViewController, completion: @escaping CompletionBlock) {
        let (redirectUri, parseError) = self.config.getRedirectUri()
        guard let redirectUri = redirectUri else {
            print(parseError!)
            return
        }
        self.completionBlock  =  completion
        let extraParams = [String: String]()
        let scopesArray = self.config.scope.components(separatedBy: " ")
        let request = OIDAuthorizationRequest(
            configuration: metadata,
            clientId: clientID,
            clientSecret: nil,
            scopes: scopesArray,
            redirectURL: redirectUri,
            responseType: OIDResponseTypeCode,
            additionalParameters: extraParams)
        self.authorizationRequest = request
        self.loadJAWebViewForAuthentication(request: request, controller: viewController)
        
        
    }
    private func isUserCancellationErrorCode(ex: Error) -> Bool {
        let error = ex as NSError
        return error.domain == OIDGeneralErrorDomain && error.code == OIDErrorCode.userCanceledAuthorizationFlow.rawValue
    }
    
    func makeAuthTokenRequest( clientID: String,authResponse: OIDAuthorizationResponse,  completion: @escaping (OIDTokenResponse?, Error?) -> Void) {
        let extraParams = [String: String]()
        let request = authResponse.tokenExchangeRequest(withAdditionalParameters: extraParams)
        OIDAuthorizationService.perform(request!, originalAuthorizationResponse: authResponse) { tokenResponse, err in
            if tokenResponse != nil {
                completion(tokenResponse!, nil)
                
            }
            completion(nil, err)
            
        }
        
    }
    
    func performEndSessionRedirect(metadata: OIDServiceConfiguration,
                                   idToken: String,
                                   viewController: UIViewController, completion: @escaping (OIDEndSessionResponse?, Error?) -> Void) {
        
        
        let (postLogoutRedirectUri, parseError) = self.config.getPostLogoutRedirectUri()
        let extraParams = [String: String]()
        if postLogoutRedirectUri == nil {
            completion(nil, parseError)
        }
        let request = OIDEndSessionRequest(
            configuration: metadata,
            idTokenHint: idToken,
            postLogoutRedirectURL: postLogoutRedirectUri!,
            additionalParameters: extraParams)
        
        let userAgent = OIDExternalUserAgentIOS(presenting: viewController)
        self.userAgentSession = OIDAuthorizationService.present(request, externalUserAgent: userAgent!) { response, ex in
            
            if ex != nil {
                
                if self.isUserCancellationErrorCode(ex: ex!) {
                    completion(response, parseError)
                    
                } else {
                    completion(response, parseError)
                }
                
            } else {
                completion(response, parseError)
            }
            
            self.userAgentSession = nil
        }
    }
    public func loadJAWebViewForAuthentication(request:OIDAuthorizationRequest  ,controller:UIViewController)  {
        let webview  =  JAWebView(frame: controller.view.bounds)
        webview.baseUrl =   request.authorizationRequestURL()
        webview.delegate = self
        controller.view.addSubview(webview)
    }
    
    public func removeWebView(controller:UIViewController) {
        for view in controller.view.subviews {
            view.removeFromSuperview()
        }
    }
}


extension FSAppAuthHandler: FSWebViewControllerDelegate {
    func webviewQueryItemsResponse(dictQueryItems: [String : String]) {
        let res = OIDAuthorizationResponse(request: authorizationRequest!, parameters: dictQueryItems as [String : NSCopying & NSObjectProtocol])
        makeAuthTokenRequest(clientID: self.config.clientID, authResponse:res) { respose, err in
            guard let res =  respose else {
                return
            }
            self.completionBlock?(res, nil)
            print("AccToken:\(String(describing: respose?.accessToken))")
            print("refreshToken:\(String(describing: respose?.refreshToken))")
            print("refreshToken:\(String(describing: respose?.idToken))")
            
        }
    }
    
}

