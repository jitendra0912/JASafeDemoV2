//
//  HeaderViewController.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 21/09/22.
//

import UIKit

enum EMenuButtonType : String {
    
    case menu = "menu"
    case back = "HeaderBack"
    case none = "None"
}

class HeaderViewController: UIViewController {

    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var btnNotification: UIButton!
    var menuType: EMenuButtonType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NavigationHelper.helper.headerViewController = self
        btnNotification.addTarget(self, action: #selector(actionNotification(_:)), for: .touchUpInside)
        btnMenu.addTarget(self, action: #selector(self.actionMenu(_:)), for: .touchUpInside)
        menuType = .menu
        
    }
    
}

extension HeaderViewController

{
    @objc private func actionMenu(_ sender: UIButton?) {
        if menuType == .menu {
            NavigationHelper.helper.openSidePanel(!NavigationHelper.helper.isOpen)
        } else {
            print("back")
            NavigationHelper.helper.contentNavController?.popViewController(animated: true)
            menuType = .menu
            var imageBtn = UIImage()
            imageBtn = UIImage(named: menuType?.rawValue ?? "")!
            NavigationHelper.helper.headerViewController?.btnMenu.setImage(imageBtn, for: UIControl.State())
        }
    }
    
    @objc private func actionNotification(_ sender: UIButton?) {
       print("Notification Action")
        
    }
    
}
