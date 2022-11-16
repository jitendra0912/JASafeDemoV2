//
//  SideMenuModel.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 23/08/22.
//

import UIKit

struct SideMenuModel {
    var icon: String
    var title: String
    var storyboard: String
    var controller: String
    
    init(icon: String, title: String, storyboard: String, controller: String) {
        self.icon = icon
        self.title = title
        self.storyboard = storyboard
        self.controller = controller
    }
    
}
