//
//  NotificationViewController.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 23/08/22.
//

import UIKit

class NotificationViewController: BaseViewController {
    
    @IBOutlet var sideMenuBtn: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationTitle("Notification")
      //  UIApplication.shared.st?.backgroundColor = UIColor.red
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
