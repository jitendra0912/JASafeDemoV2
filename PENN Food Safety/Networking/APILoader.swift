//
//  APILoader.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 10/08/22.
//

import Foundation

struct APILoader<T: APIHandler> {
    var apiHandler: T
    var urlSession: URLSession
    
    init(apiHandler: T, urlSession: URLSession = .shared) {
        self.apiHandler = apiHandler
        self.urlSession = urlSession
    }
    
    func postNotificationAPI(model: DataM,  success: @escaping (  _ response: [String: Any]) -> (), failure: @escaping (  _ error: NSError?) -> ())
        {
            
            
            let urlString =  APIPath().postAlarm
            if let url = URL(string: urlString) {
            var urlRequest = URLRequest(url: url)
                urlRequest.setValue(FSConstants.APIHeaders.contentTypeValue, forHTTPHeaderField: FSConstants.APIHeaders.kContentType)
                if let authToken = OBJ_FOR_KEY(FSConstants.UserDefault.accessToken){
                    urlRequest.setValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
                }
            urlRequest.httpMethod = HTTPMethod.post.rawValue
            let jsonData = try? JSONEncoder().encode(model)
            urlRequest.httpBody = jsonData
            
            
            
            let session = URLSession(configuration: URLSessionConfiguration.default)
                print("THIS LINE IS PRINTED")
                let task = session.dataTask(with: urlRequest, completionHandler: {(data, response, error) -> Void in
                    if let data = data {
                        print("THIS ONE IS NOT PRINTED")
                        let json = try? JSONSerialization.jsonObject(with: data, options: [])
                        if let response = response as? HTTPURLResponse , 200...299 ~= response.statusCode {
                           // taskCallback(true, json as AnyObject?)
                        } else {
                           // taskCallback(false, json as AnyObject?)
                        }
                    }
                })
                task.resume()
            
            
            
            
               
                    
            
        }
            
    }
    
    func loadAPIRequest(requestData: T.RequestDataType, completionHandler: @escaping (T.ResponseDataType?, ServiceError?) -> ()) {
        if let urlRequest = apiHandler.makeRequest(from: requestData) {
            urlSession.dataTask(with: urlRequest) { (data, response, error) in
                
                if let httpResponse = response as? HTTPURLResponse {
                    
                    guard error == nil else {
                        completionHandler(nil, ServiceError(httpStatus: httpResponse.statusCode, message: "ServiceError : \(error?.localizedDescription ?? "Unknown Error")"))
                        return
                    }
                    
                    guard let responseData = data else {
                        completionHandler(nil, ServiceError(httpStatus: httpResponse.statusCode, message: "ServiceError : \(error?.localizedDescription ?? "Unknown Error")"))
                        return
                    }
                    
                    do {
                        let parsedResponse = try self.apiHandler.parseResponse(data: responseData, response: httpResponse)
                         completionHandler(parsedResponse, nil)
                    } catch {
                         completionHandler(nil, ServiceError(httpStatus:  httpResponse.statusCode, message: "ServiceError : \(error.localizedDescription)"))
                    }
                }
               
            }.resume()
        }
    }
}
