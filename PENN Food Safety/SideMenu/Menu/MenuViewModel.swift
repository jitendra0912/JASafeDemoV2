//
//  MenuViewModel.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 24/09/22.
//

import Foundation
class MenuViewModel {
    var slideMenu =  [SideMenuModel]()
    
    init(arrMenu:[AnyObject]) {
        for dict in arrMenu {
            
            let objSidemenu =  SideMenuModel(icon: dict["IconeImage"] as? String ?? "", title: dict["name"] as? String ?? "", storyboard: dict["storyboard"] as? String ?? "", controller: dict["Controller"] as? String ?? "")
            slideMenu.append(objSidemenu)
            }
      
        
    }

    
    

    
}
