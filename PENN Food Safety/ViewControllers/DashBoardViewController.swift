//
//  DashBoardViewController.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 23/08/22.
//

import UIKit

class DashBoardViewController: UIViewController {
    @IBOutlet var sideMenuBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.sideMenuBtn.target = revealViewController()
//        self.view.backgroundColor = UIColor.lightGray
//        self.sideMenuBtn.action = #selector(self.revealViewController()?.revealSideMenu)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // self.revealViewController()?.gestureEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       // self.revealViewController()?.gestureEnabled = true
    }
}
