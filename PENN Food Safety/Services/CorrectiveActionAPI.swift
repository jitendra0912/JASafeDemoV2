//
//  CorrectiveAction.swift
//  JASafeDemoV
//
//  Created by Varun Shukla on 11/11/22.
//

import Foundation

struct CorrectiveActionAPI: APIHandler {
    
    func makeRequest(from param: String) -> URLRequest? {
        let urlString =  APIPath().correctiveAction
        if let url = URL(string: urlString) {
            var urlRequest = URLRequest(url: url)
            setDefaultHeaders(request: &urlRequest)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            return urlRequest
        }
        return nil
    }
    
    func parseResponse(data: Foundation.Data?, response: HTTPURLResponse) throws -> CorrectiveActionModel {
        return try defaultParseResponse(data: data,response: response)
    }
}
