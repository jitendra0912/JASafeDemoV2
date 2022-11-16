////
////  RefrigerationAPI.swift
////  PENN Food Safety
////
////  Created by Varun Shukla on 22/09/22.
////
//
import Foundation

struct RefrigerationAPI: APIHandler {
    
    func makeRequest(from param: String) -> URLRequest? {
        let urlString =  APIPath().refrigeration
        if let url = URL(string: urlString) {
            var urlRequest = URLRequest(url: url)
            setDefaultHeaders(request: &urlRequest)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            return urlRequest
        }
        return nil
    }
    
    func parseResponse(data: Foundation.Data?, response: HTTPURLResponse) throws -> CabinetsModel {
        return try defaultParseResponse(data: data,response: response)
    }
}
