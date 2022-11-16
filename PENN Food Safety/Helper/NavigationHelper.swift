//
//  NavigationHelper.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 21/09/22.
//

import Foundation
import UIKit

class NavigationHelper: NSObject {
    
    static let helper = NavigationHelper()
    var currentViewController: UIViewController? {
        return contentNavController?.viewControllers.last!
    }
    var navController: UINavigationController!
    var headerViewController: HeaderViewController?
    
    var contentNavController: ContentNavigationViewController?
    var mainContainerViewController: MainViewController?
    var menuView = UIView()
    var mainView = UIView()
    var menuWidth: CGFloat?
    var didOpen: ((_ open: Bool) -> ())?
    var isOpen = false
    
    //Initializer access level change now
    fileprivate override init() {
    }
    
    internal func navigateToViewController(_ isSpeciality: Bool, index: Int) {
        navController.popViewController(animated: true)
    }
}
extension NavigationHelper {
    func setUpSideMenu(_ view: UIView, mainContainer:UIView, menuWidth: CGFloat) {
        menuView = view
        mainView = mainContainer
        self.menuWidth = menuWidth
        view.translatesAutoresizingMaskIntoConstraints = true
        view.frame = CGRect(x: -(self.menuView.bounds.width), y: 64, width: self.menuView.bounds.width, height: UIScreen.main.bounds.height - 64)
        mainView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action:  #selector(self.panDidMoved(_:))))
    }
    func openSidePanel(_ open: Bool) {
        NavigationHelper.helper.mainContainerViewController?.view.bringSubviewToFront(menuView)
        if open {
            
            UIView.animate(withDuration: 0.3, animations: {
               self.menuView.frame = CGRect(x: 0, y: 64, width: self.menuView.bounds.width, height: self.menuView.bounds.height)
                }, completion: { (completed) in
                if self.didOpen != nil && !self.isOpen {
                    self.didOpen!(true)
                }
                self.isOpen = true
            })
        } else {

            UIView.animate(withDuration: 0.3, animations: {
                self.menuView.frame = CGRect(x: -(self.menuView.bounds.width), y: 64, width: self.menuView.bounds.width, height: self.menuView.bounds.height)
                }, completion: { (completed) in
                if self.didOpen != nil && self.isOpen {
                    self.didOpen!(false)
                }
                self.isOpen = false
            })
        }
    }
    @objc func panDidMoved(_ gesture: UIPanGestureRecognizer) {
        openSidePanel(false)
    }
}
