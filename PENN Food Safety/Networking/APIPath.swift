//
//  APIPath.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 10/08/22.
//

import Foundation

#if DEBUG
let environment = APIEnvironment.development
#else
let environment = APIEnvironment.production
#endif

let baseURL = environment.baseURL()

var siteID = String(OBJ_FOR_KEY(FSConstants.UserDefault.siteID) as! Int)
var clientID = String(OBJ_FOR_KEY(FSConstants.UserDefault.clientID) as! Int)


struct APIPath {
    
//    var siteID: String
//    var clientID: String

    var refrigeration: String { return "\(baseURL)/refrigerationapi/Location/GetAllLocationDetailsBySiteID/" + (siteID)}
    
    var alarm: String { return "\(baseURL)/NotificationAPI/Notification/GetAllNotificationsBySiteID/" + (siteID)}
    
    var resolveReason: String { return "\(baseURL)/RefrigerationAPI/Reason/GetAllReasonsByClientID/" + (clientID)}
    
    var correctiveAction: String { return "\(baseURL)/RefrigerationAPI/CorrectiveAction/GetAllCorrectiveActionsByClientID/" + (clientID)}

    var postAlarm: String { return "\(baseURL)/NotificationAPI/Notification/SaveNotification"}
    
}
