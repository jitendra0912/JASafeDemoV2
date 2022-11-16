//
//  FSApplicationConfigLoader.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 05/09/22.
//

import Foundation
struct FSApplicationConfigLoader {
    
    static func load() throws -> FSApplicationConfig {
        
        let configFilePath = Bundle.main.path(forResource: "config", ofType: "json")
        let jsonText = try String(contentsOfFile: configFilePath!)
        let jsonData = jsonText.data(using: .utf8)!
        let decoder = JSONDecoder()
        let data =  try decoder.decode(FSApplicationConfig.self, from: jsonData)
        return data
    }
}
