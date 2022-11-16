//
//  UIViewController+PENN.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 06/09/22.
//


import Foundation
import UIKit

extension UIViewController {

    func showAlertController(_ message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(okayAction)
        present(alertController, animated: true, completion: nil)
    }
}
