//////
//////  RefrigerationCabinetViewModel.swift
//////  PENN Food Safety
//////
//////  Created by Varun Shukla on 22/09/22.
//////
////
////
//import Foundation
//
//protocol RefrigeratorModelDelegte: AnyObject {
//    func didSuccess(response: RefrigerationCabinetModel?, error: ServiceError?)
//}
//
//class RefrigerationCabinetViewModel {
//
//    weak var delegate: RefrigeratorModelDelegte?
//    
////        
////        self.getAPIData(siteID: OBJ_FOR_KEY(FSConstants.UserDefault.siteID))
//        
//    
//     func getAPIData(siteID: Int) {
//  
//          let request = RefrigerationAPI()
//          let apiLoader = APILoader(apiHandler: request)
//          apiLoader.loadAPIRequest(requestData: String(siteID)) { (model, err) in
//              if let _ = err {
//                  self.delegate?.didSuccess(response: nil, error: err)
//              } else {
//                  self.delegate?.didSuccess(response: model, error: err)
//              }
//          }
//      }
//    
////    private func getAPIData(siteID: Int, completion: @escaping (RefrigerationCabinetModel?, ServiceError?) -> ()) {
////
////        let request = RefrigerationAPI()
////        let apiLoader = APILoader(apiHandler: request)
////        apiLoader.loadAPIRequest(requestData: param) { (model, error) in
////            if let _ = error {
////                completion(nil, error)
////            } else {
////                completion(model, nil)
////            }
////        }
////    }
//    
//
//}
