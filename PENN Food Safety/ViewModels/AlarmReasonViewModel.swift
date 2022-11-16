//
//  ResolveAlarmModel.swift
//  JASafeDemoV
//
//  Created by Varun Shukla on 09/11/22.
//

import Foundation
import UIKit

class AlarmReasonViewModel {
    
    
    var reasonIDDescription: Int?
    
    var reasonTextDescription: String?
    
    var clientIDDescription: Int?
    
    var createdByDescription: String?
    
    var createdByIDDescription: Int?
    
    var createdOnDescription:String?
    
    var modifiedByDescription:String?
    
    var modifiedByIDDescription:Int?
    
    var modifiedOnDescription:String?
    
    
    // Dependency Injection (DI)
    
    init(resolvedReasonModel: Datum) {
        
        self.reasonIDDescription = resolvedReasonModel.reasonID
        
        self.reasonTextDescription = resolvedReasonModel.reasonText
        
        self.clientIDDescription = resolvedReasonModel.clientID
        
        self.createdByDescription = resolvedReasonModel.createdBy
        
        self.createdByIDDescription = resolvedReasonModel.createdByID
        
        self.createdOnDescription = resolvedReasonModel.createdOn
        
        self.modifiedByDescription = resolvedReasonModel.modifiedBy
        
        self.modifiedByIDDescription = resolvedReasonModel.modifiedByID
        
        self.modifiedOnDescription = resolvedReasonModel.modifiedOn
        
        
    }
    
}
