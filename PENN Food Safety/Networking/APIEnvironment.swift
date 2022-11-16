//
//  APIEnvironment.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 10/08/22.
//

import Foundation

enum APIEnvironment {
    case development
    case staging
    case production
    
    func baseURL () -> String {
//        return "https://\(subdomain()).\(domain())"
        return "https://\(domain())"

    }
    
    func domain() -> String {
        switch self {
        case .development:
            return "pcfsgateway-dev.azurewebsites.net"
        case .staging:
            return "pcfsgateway-dev.azurewebsites.net"
        case .production:
            return "pcfsgateway-dev.azurewebsites.net"
        }
    }
    
    func subdomain() -> String {
        switch self {
        case .development, .production, .staging:
            return "api"
        }
    }
    
    func route() -> String {
        return "/api/v1"
    }
}
