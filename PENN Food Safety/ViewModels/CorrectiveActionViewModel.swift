//
//  CorrectiveActionViewModel.swift
//  JASafeDemoV
//
//  Created by Varun Shukla on 11/11/22.
//

import Foundation

class CorrectiveActionViewModel {
    
    
    var actionIDDescription: Int?
    
    var actionTextDescription: String?
    
    var reasonIDDescription: Int?
    
    var clientIDDescription: Int?
    
    var createdByDescription: String?
    
    var createdByIDDescription:Int?
    
    var createdOnDescription:String?
    
    var modifiedByDescription:String?
    
    var modifiedByIDDescription:Int?
    
    var modifiedOnDescription:String?
    
    // Dependency Injection (DI)
    
    init(correctiveActionModel: Datumm) {
        
        self.actionIDDescription = correctiveActionModel.actionID
        
        self.actionTextDescription = correctiveActionModel.actionText
        
        self.reasonIDDescription = correctiveActionModel.reasonID
        
        self.clientIDDescription = correctiveActionModel.clientID
        
        self.createdByDescription = correctiveActionModel.createdBy
        
        self.createdByIDDescription = correctiveActionModel.createdByID
        
        self.createdOnDescription = correctiveActionModel.createdOn
        
        self.modifiedByDescription = correctiveActionModel.modifiedBy
        
        self.modifiedByIDDescription = correctiveActionModel.modifiedByID
        
        self.modifiedOnDescription = correctiveActionModel.modifiedOn

        
        
    }
    
}
