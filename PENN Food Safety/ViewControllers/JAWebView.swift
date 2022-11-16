//
//  JAWebView.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 25/08/22.
//

import Foundation
import WebKit

@objc protocol FSWebViewControllerDelegate:AnyObject {
    @objc optional func webviewQueryItemsResponse(dictQueryItems : [String:String])
}
open class JAWebView: UIView {
    
    open var webViewConfiguration: WKWebViewConfiguration?
    weak var delegate:FSWebViewControllerDelegate?
    var webViewHeightConstraint: NSLayoutConstraint!
    typealias CompletionBlock = ( _ queryItems : [String : String]) -> ()
    
    public var baseUrl:URL? = nil {
        didSet {
            let request = URLRequest(url: baseUrl!)
            webView.load(request)
            LoadingView.hide()
        }
    }
    
    public var webView: WKWebView! {
        didSet {
            addSubview(webView)
            webView.isOpaque = false
            webView.translatesAutoresizingMaskIntoConstraints = false
            webView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            webView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            webView.topAnchor.constraint(equalTo: topAnchor).isActive = true
            webView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            webViewHeightConstraint = webView.heightAnchor.constraint(equalToConstant: self.bounds.height)
            webViewHeightConstraint.isActive = true
            webView.scrollView.isScrollEnabled = false
            webView.allowsBackForwardNavigationGestures = false
            webView.contentMode = .scaleToFill
            webView.navigationDelegate = self
            webView.uiDelegate = self
            webView.scrollView.delaysContentTouches = false
            webView.scrollView.decelerationRate = .normal
            webView.scrollView.delegate = self
        }
    }
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    convenience init(frame: CGRect, completion: @escaping CompletionBlock){
        self.init(frame: frame)
        
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        let controller = WKUserContentController()
        let config = WKWebViewConfiguration()
        config.userContentController = controller
        
        webView = WKWebView(frame: CGRect.zero, configuration: config)
    }
}

extension JAWebView: WKNavigationDelegate {
    
    open func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        completionHandler(.performDefaultHandling, nil)
    }
    
    open func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        webView.scrollView.refreshControl?.endRefreshing()
    }
    
    open func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        webView.scrollView.refreshControl?.endRefreshing()
    }
    
    open func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.scrollView.refreshControl?.endRefreshing()
    }
    
    open func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        webView.reload()
    }
    
    open func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let url = navigationAction.request.url {
            if !WKWebView.handlesURLScheme(url.scheme ?? "") && UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
        if navigationAction.request.url?.absoluteString.starts(with: FSConstants.AppAuthConfiguration.redirectionUri) ?? false {
            print("Redirection URI: ", navigationAction.request.url?.absoluteString ?? "")
            var parameters: [String : String] = [:]
            if let urlComponents = URLComponents(url: navigationAction.request.url!, resolvingAgainstBaseURL: false) {
                let queryItems: [URLQueryItem]? = urlComponents.queryItems
                if let queryItems = queryItems {
                    parameters = queryItems.reduce(into: parameters) {result, queryItem in
                        result[queryItem.name] = queryItem.value
                    }
                }
            }
            self.delegate?.webviewQueryItemsResponse?(dictQueryItems: parameters)
            
        }
        
        if navigationAction.request.url?.host == (URL(string: FSConstants.AppAuthConfiguration.issuerUrl))?.host {
            decisionHandler(.allow)
            return
        }
        
        decisionHandler(.allow)
    }
}
extension JAWebView: WKUIDelegate {
    
    open func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if !(navigationAction.targetFrame?.isMainFrame ?? false) {
            webView.load(navigationAction.request)
        }
        return nil
    }
    
    open func webViewDidClose(_ webView: WKWebView) {
        guard let url = URL(string: "about:blank") else { return }
        webView.load(URLRequest(url: url))
    }
}
extension JAWebView: UIScrollViewDelegate {
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return nil
    }
    public func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        scrollView.pinchGestureRecognizer?.isEnabled = false
    }
}



