//
//  ContentNavigationViewController.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 21/09/22.
//

import UIKit

class ContentNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NavigationHelper.helper.contentNavController = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
