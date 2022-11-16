//
//  Application Error.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 08/07/22.
//

import Foundation

class ApplicationError: Error {
    
    var title: String
    var description: String
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}
