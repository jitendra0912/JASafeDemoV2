//
//  FSStartViewModel.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 05/09/22.
//

import Foundation
import AppAuth

class FSStartViewModel {
    var config: FSApplicationConfig
    var state: FSApplicationStateManager?
    var appauth: FSAppAuthHandler?
    
    init(config: FSApplicationConfig) {
        self.config = config
        self.state = FSApplicationStateManager()
        self.appauth = FSAppAuthHandler(config: self.config)
        
    }
    
}
