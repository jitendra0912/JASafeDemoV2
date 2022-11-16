//
//  RequestHandler+Extension.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 10/08/22.
//

import Foundation

// MARK: Request Handler Supporting methods

extension RequestHandler {
    
    func setQueryParams(parameters:[String: Any], url: URL) -> URL {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = parameters.map { element in URLQueryItem(name: element.key, value: String(describing: element.value) ) }
        return components?.url ?? url
    }
    
    func setDefaultHeaders(request: inout URLRequest) {
        request.setValue(FSConstants.APIHeaders.contentTypeValue, forHTTPHeaderField: FSConstants.APIHeaders.kContentType)
        if let authToken = OBJ_FOR_KEY(FSConstants.UserDefault.accessToken){
            request.setValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        }
    }
}
