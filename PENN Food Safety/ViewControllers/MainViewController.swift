//
//  MainViewController.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 23/08/22.
//

import SafariServices
import UIKit

class MainViewController: UIViewController {
    private var sideMenuViewController: SideMenuViewController!
    
    @IBOutlet weak var mainViewContainer: UIView!
    
    @IBOutlet weak var menuViewContainer: UIView!
    
    @IBOutlet weak var headerViewContainer: UIView!
    
    private var sideMenuShadowView: UIView!
    var model: FSStartViewModel?
    private var sideMenuRevealWidth: CGFloat = 260
    private let paddingForRotation: CGFloat = 150
    private var isExpanded: Bool = false
    private var draggingIsEnabled: Bool = false
    private var panBaseLocation: CGFloat = 0.0
    
    // Expand/Collapse the side menu by changing trailing's constant
    private var sideMenuTrailingConstraint: NSLayoutConstraint!
    
    private var revealSideMenuOnTop: Bool = true
    
    var gestureEnabled: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.003563273698, green: 0.340511024, blue: 0.603417933, alpha: 1)
        
        NavigationHelper.helper.mainContainerViewController = self
//        NavigationHelper.helper.setUpSideMenu(menuViewContainer, menuWidth: self.view.bounds.width)
        NavigationHelper.helper.setUpSideMenu(menuViewContainer, mainContainer: mainViewContainer, menuWidth: self.view.bounds.width)
    }
}
        

