//
//  SyncViewController.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 23/08/22.
//

import UIKit

class SyncViewController: BaseViewController {
    
    @IBOutlet var sideMenuBtn: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationTitle("SynController")
        self.updateMenuButton(type: .back)

    }
 
    
    
}
