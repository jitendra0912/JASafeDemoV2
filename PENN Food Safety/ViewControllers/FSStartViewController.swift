//
//  FSStartViewController.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 08/07/22.
//

import UIKit
import AppAuth

class FSStartViewController: UIViewController {
    
    private var model: FSStartViewModel?
    private var metadata: OIDServiceConfiguration? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        configAppAuthentication()
    }
    
    @IBAction func startBtnClicked(_ sender: Any) {
        LoadingView.show()
        loginAppAuth()
    }
}

// MARK:- User Define Function
extension FSStartViewController {
    private func configAppAuthentication() {
        self.model  =  FSStartViewModel(config: try! FSApplicationConfigLoader.load())
        
    }
    private func moveToDashboardController() {
        self.model?.appauth?.removeWebView(controller: self)
        let mainViewController = FSConstants.Storyboard.mainStoryboard.instantiateViewController(withIdentifier: "MainNavigationController") as! UINavigationController
        let leftViewController = FSConstants.Storyboard.mainStoryboard.instantiateViewController(withIdentifier: "SideMenuID") as! SideMenuViewController
        let slideMenuController =   SlideMenuController(mainViewController: mainViewController, leftMenuViewController: leftViewController)
       
        NavigationHelper.helper.navController = mainViewController
        UIApplication.shared.windows.first!.rootViewController = slideMenuController
    }
    
    private func loginAppAuth() {
        self.model?.appauth?.discoverOIDServiceConfiguration(completion: { configuration, err in
            guard let metaData =  configuration else {
                return
            }
            self.model?.appauth?.performAuthorizationRedirect(metadata: metaData, clientID: self.model!.config.clientID, viewController: self, completion: { [weak self] res, err in
//                                if let respose =  res {
                if let weakSelf =  self{
                    weakSelf.model?.state?.metadata =  metaData
                    weakSelf.model?.state?.saveTokens(accessToken: res.accessToken!, refreshToken: res.refreshToken!)
                    weakSelf.moveToDashboardController()
                    
                }
//                                }
            })
        })
    }
    
}

