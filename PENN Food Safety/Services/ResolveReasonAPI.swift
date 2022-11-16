//
//  ResolveReasonAPI.swift
//  JASafeDemoV
//
//  Created by Varun Shukla on 09/11/22.
//

import Foundation

struct ResolveReasonAPI: APIHandler {
    
    func makeRequest(from param: String) -> URLRequest? {
        let urlString =  APIPath().resolveReason
        if let url = URL(string: urlString) {
            var urlRequest = URLRequest(url: url)
            setDefaultHeaders(request: &urlRequest)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            return urlRequest
        }
        return nil
    }
    
    func parseResponse(data: Foundation.Data?, response: HTTPURLResponse) throws -> ResolvedReasonModel {
        return try defaultParseResponse(data: data,response: response)
    }
}
