//
//  AlarmModel.swift
//  PENNFoodSafety
//
//  Created by Varun Shukla on 15/10/22.
//

import Foundation

struct AlarmModel : Codable {
    let isSuccess : Bool?
    let returnMessage : String?
    let errorMessage : String?
    let data : [DataM]?
    let next : String?
    let previous : String?
    let count : Int?

    enum CodingKeys: String, CodingKey {

        case isSuccess = "IsSuccess"
        case returnMessage = "ReturnMessage"
        case errorMessage = "ErrorMessage"
       case data = "Data"
        case next = "next"
        case previous = "previous"
        case count = "count"
    }

}

struct DataM : Codable {
    let notificationID : Int?
    let notificationText : String?
    let notificationTypeID : Int?
    let notificationType : String?
    let siteID : Int?
    let clientID : Int?
    let areaID : Int?
    let roleID : Int?
    let isDismissed : Bool?
    let onClick : String?
    let raisedBy : String?
    let raisedOn : String?
    let reasonID : Int?
    var reasonText : String?
    let actionID : Int?
    var actionText : String?
    var remarks : String?
    let zetoAlarmID : Int?
    let cabinetID : String?
    let cabinetName : String?
    let sensorDescription : String?
    let sensorKey : String?
    let alarmType : String?
    let dismissedBy : String?
    let dismmisedOn : String?
    let comments : String?
    let isVerified : String?
    let title : String?

    enum CodingKeys: String, CodingKey {

        case notificationID = "NotificationID"
        case notificationText = "NotificationText"
        case notificationTypeID = "NotificationTypeID"
        case notificationType = "NotificationType"
        case siteID = "SiteID"
        case clientID = "ClientID"
        case areaID = "AreaID"
        case roleID = "RoleID"
        case isDismissed = "IsDismissed"
        case onClick = "OnClick"
        case raisedBy = "RaisedBy"
        case raisedOn = "RaisedOn"
        case reasonID = "ReasonID"
        case reasonText = "ReasonText"
        case actionID = "ActionID"
        case actionText = "ActionText"
        case remarks = "Remarks"
        case zetoAlarmID = "ZetoAlarmID"
        case cabinetID = "CabinetID"
        case cabinetName = "CabinetName"
        case sensorDescription = "SensorDescription"
        case sensorKey = "SensorKey"
        case alarmType = "AlarmType"
        case dismissedBy = "DismissedBy"
        case dismmisedOn = "DismmisedOn"
        case comments = "Comments"
        case isVerified = "IsVerified"
        case title = "Title"
    }

}
