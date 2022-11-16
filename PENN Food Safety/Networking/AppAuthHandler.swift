////
////  AppAuthHandler.swift
////  PENN Food Safety
////
////  Created by Varun Shukla on 24/08/22.
////
//
//import AppAuth
//
//
//public struct AppAuthHandler {
//
//    static var userAgentSession: OIDExternalUserAgentSession?
//    static var authorizationCompletion: ((OIDAuthState?, Error?) -> Void)? = nil
//    static var indicatorView: UIActivityIndicatorView!
//    static  var showWebView: ( (OIDAuthorizationRequest)->())?
//    static var oidAuthorizationRequest: OIDAuthorizationRequest? = nil
//
//    
//
//    /**
//     Returns OIDC Provider configuration.
//     In this method the OP's endpoints are retrieved from the issuer's well-known OIDC configuration document location (asynchronously). The response is handled then with the passed in escaping callback.
//     */
//
//
//static func discoverOIDServiceConfiguration(_ issuerUrl: String, completion: @escaping (OIDServiceConfiguration?, Error?) -> Void) {
//    // Checking if the issuer's URL can be constructed.
//    guard let issuer = URL(string: issuerUrl) else {
//        print("Error creating issuer URL for: \(issuerUrl)")
//        
//        return
//    }
//    print("Retrieving configuration for: \(issuer.absoluteURL)")
//    
//    // Discovering endpoints with AppAuth's convenience method.
//    OIDAuthorizationService.discoverConfiguration(forIssuer: issuer) {
//        configuration, error in
//        if let error = error  {
//            print("Error retrieving discovery document: \(error.localizedDescription)")
//            return
//        }
//        
//        guard let configuration = configuration else {
//            print("Error retrieving discovery document. Error & Configuration both are NIL!")
//            return
//        }
//        
//        // Completing with the caller's callback.
//        completion(configuration, error)
//        print("Got configuration: \(configuration)")
//        
//    }
//}
//
//    /**
//     Authorizes the Relying Party with an OIDC Provider.
//
//     - Parameter issuerUrl: The OP's `issuer` URL to use for OpenID configuration discovery
//     - Parameter configuration: Ready to go OIDServiceConfiguration object populated with the OP's endpoints
//     - Parameter completion: (Optional) Completion handler to execute after successful authorization.
//     */
//    static func authorizeRp(issuerUrl: String?, configuration: OIDServiceConfiguration?, completion: (() -> Void)? = nil) {
//    /**
//     Performs authorization with an OIDC Provider configuration.
//     A nested function to complete the authorization process after the OP's configuration has became available.
//     - Parameter configuration: Ready to go OIDServiceConfiguration object populated with the OP's endpoints
//     */
//        func authorize(configuration: OIDServiceConfiguration) {
//        print("Authorizing with configuration: \(configuration)")
//        
//        authorizeWithWebView(
//            configuration: configuration,
//            clientId: FSConstants.AppAuthConfiguration.clientId,
//            redirectionUri: FSConstants.AppAuthConfiguration.redirectionUri
//        ) {
//            authState, error in
////            self.indicatorView.startAnimating()
//            if let authState = authState {
////                self.setAuthState(authState)
//                DataManager.sharedManager.setAccessToken(authState.lastTokenResponse?.accessToken)
////                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
////                    let mainVC = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
////                    UIApplication.shared.windows.first?.rootViewController? = mainVC
////                    UIApplication.shared.windows.first?.makeKeyAndVisible()
//                
//                print("Successful authorization.")
//                
////                self.showState()
//                
//                
//                if let completion = completion {
//                    completion()
//                }
//            } else {
//                print("Authorization error: \(error?.localizedDescription ?? "")")
//                
////                self.setAuthState(nil)
//            }
//        }
//    }
//    
//    if let issuerUrl = issuerUrl {
//        // Discovering OP configuration
//        discoverOIDServiceConfiguration(issuerUrl) {
//            configuration, error in
//            guard let configuration = configuration else {
//                print("Error retrieving discovery document for \(issuerUrl): \(error?.localizedDescription ?? "")")
////                self.setAuthState(nil)
//                return
//            }
//            authorize(configuration: configuration)
//        }
//    } else if let configuration = configuration {
//        // Accepting passed-in OP configuration
//        authorize(configuration: configuration)
//    }
//}
//
//    /**
//     Performs the authorization code flow using a web view.
//
//     Attempts to make a request to the authorization endpoint by utilizing a web view.
//     Allows the web view to handle the redirection.
//     */
//    static func authorizeWithWebView(
//    configuration: OIDServiceConfiguration,
//    clientId: String,
//    redirectionUri: String,
//    scopes: [String] = [OIDScopeOpenID, OIDScopeProfile, "openid"],
//    completion: @escaping (OIDAuthState?, Error?) -> Void
//) {
//    // Checking if the redirection URL can be constructed.
//    guard let redirectURI = URL(string: redirectionUri) else {
//        print("Error creating redirection URL for : \(redirectionUri)")
//        
//        return
//    }
//    
//    // Building authorization request.
//    let request = OIDAuthorizationRequest(
//        configuration: configuration,
//        clientId: clientId,
//        clientSecret: nil,
//        scopes: scopes,
//        redirectURL: redirectURI,
//        responseType: OIDResponseTypeCode,
//        additionalParameters: nil
//    )
//    
//    // Making authorization request.
//    print("Initiating authorization request with scopes: \(request.scope ?? "no scope requested")")
//    
//    // Using web view instead of built in AppAuth methods invoking an external user-agent.
//    /**
//     Reference to the completion handler to be called on successful authorization.
//     
//     The redirection URI will be processed in the web view navigation event. The code will be exchanged for tokens using the `makeTokenRequest()` method, which will need to follow by the completion callback passed in here from the `authorizeRp()` method. Since the navigation event will be handled in a different context, we need to preserve the completion block.
//     */
//    
//    
//    authorizationCompletion = completion
//    
//    /**
//     The request object reference accessible from other methods.
//     
//     AppAuth methods will be used to complete the authorization flow after redirection from the authorization endpoint and need the original request details.
//     */
//    
//    
//    oidAuthorizationRequest = request
//    
//    showWebView!(oidAuthorizationRequest!)
//
//    
//    // Dismissing any existing subview.
////    view.viewWithTag(webViewTag)?.removeFromSuperview()
////
////    // Dismissing any existing web view controller.
////    webViewController = nil
////
////    // Configuring the web view for JavaScript interactions.
////
////    let userContentController = WKUserContentController()
////    userContentController.add(self, name: "callback")
////
////    let configuration = WKWebViewConfiguration()
////    configuration.userContentController = userContentController
////
////    // Providing the web view class with initial parameters.
////    webViewController = WebViewController.init(
////        appGroup: FSConstants.AppAuthConfiguration.appGroup,
////        appGroupCookies: FSConstants.AppAuthConfiguration.appGroupCookies,
////        webViewFrame: view.bounds,
////        webViewConfiguration: configuration
////    )
////
////    // Setting this controller as the web view navigation delegate.
////    webViewController.wkNavigationDelegate = self
////
////    // Loading the view with the authorization URL.
////    webViewController.loadWebView() {
////        webView in
////
////        // Tracking the view by its tag.
////        webView.tag = self.webViewTag
////
////        self.view.addSubview(webView)
////
////        // Loading the authorization endpoint URL obtained from the AppAuth authorization request object.
////        webView.load(URLRequest(url: URL(string: request.authorizationRequestURL().absoluteString)!))
////    }
//}
//
//    /**
//     Makes token exchange request.
//
//     The code obtained from the authorization request is exchanged at the token endpoint.
//     */
////    func makeTokenRequest(completion: @escaping (OIDAuthState?, Error?) -> Void) {
////        guard let tokenExchangeRequest = self.state.authState.lastAuthorizationResponse.tokenExchangeRequest() else {
////            print("Error creating access token request.")
////            return
////        }
////
////        print("Making token request with: ", tokenExchangeRequest)
////
////        OIDAuthorizationService.perform(tokenExchangeRequest) {
////            response, error in
////
////            if let response = response {
////                print("Received token response with access token: ", response.accessToken ?? "")
////            } else {
////                print("Error making token request: \(error?.localizedDescription ?? "")")
////            }
////
////            self.authState?.update(with: response, error: error)
////            self.indicatorView.stopAnimating()
////            completion(self.authState, error)
////        }
////    }
//    
//}
//
//
