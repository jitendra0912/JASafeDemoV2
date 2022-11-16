//
//  FSHelper.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 08/07/22.
//

import Foundation
import AppAuth

class FSHelper : NSObject {
  
    static let share = FSHelper()
    var alertDataM: DataM?
    
    private override init() {}
    
    func padBase64Encoded(_ base64Encoded: String) -> String {
        let remainder = base64Encoded.count % 4
        if remainder > 0 {
            return base64Encoded.padding(toLength: base64Encoded.count + 4 - remainder, withPad: "=", startingAt: 0)
        }
        return base64Encoded
    }
    
   func loadSlideMenu(forResource resourceName : String)-> NSArray?  {
      // Load menu from Plist
        if let path = Bundle.main.path(forResource: resourceName, ofType: "plist") {
            let items: NSArray = NSArray(contentsOfFile: path)!
            return items

        }
     return nil
    }
    func classFromString(_ className: String) -> AnyClass! {

        /// get namespace
        let namespace = Bundle.main.infoDictionary!["CFBundleName"] as! String

        /// get 'anyClass' with classname and namespace
        let cls: AnyClass = NSClassFromString("\(namespace).\(className)")!

        // return AnyClass!
        return cls
    }
    
    
    func setAlermData(modelData:DataM?){
        self.alertDataM =  modelData
        
    }
    
       
}
