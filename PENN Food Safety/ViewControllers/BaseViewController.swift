//
//  BaseViewController.swift
//  PENNFoodSafety
//
//  Created by Varun Shukla on 28/09/22.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK:- Crete NavigationTitle
    func setNavigationTitle(_ title: String) {
        NavigationHelper.helper.headerViewController?.labelTitle.text =  title
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       }
    
    func updateMenuButton(type:EMenuButtonType) {
        var imageBtn = UIImage()
        imageBtn = UIImage(named: type.rawValue)!
        NavigationHelper.helper.headerViewController?.menuType =  type
        NavigationHelper.helper.headerViewController?.btnMenu.setImage(imageBtn, for: UIControl.State())
        
    }
    
}
