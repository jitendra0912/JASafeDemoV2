//
//  CorrectiveActionModel.swift
//  JASafeDemoV
//
//  Created by Varun Shukla on 09/11/22.
//

import Foundation

struct CorrectiveActionModel: Codable {
    let isSuccess: Bool
    let returnMessage: String
    let data: [Datumm]
    let count: Int

    enum CodingKeys: String, CodingKey {
        case isSuccess = "IsSuccess"
        case returnMessage = "ReturnMessage"
        case data = "Data"
        case count
    }
}

// MARK: - Datum
struct Datumm: Codable {
    let actionID: Int
    let actionText: String
    let reasonID, clientID: Int
    let createdBy: String
    let createdByID: Int
    let createdOn: String
    let modifiedBy: String
    let modifiedByID: Int
    let modifiedOn: String

    enum CodingKeys: String, CodingKey {
        case actionID = "ActionID"
        case actionText = "ActionText"
        case reasonID = "ReasonID"
        case clientID = "ClientID"
        case createdBy = "CreatedBy"
        case createdByID = "CreatedByID"
        case createdOn = "CreatedOn"
        case modifiedBy = "ModifiedBy"
        case modifiedByID = "ModifiedByID"
        case modifiedOn = "ModifiedOn"
    }
}
