//
//  CorrectiveActionModel.swift
//  JASafeDemoV
//
//  Created by Varun Shukla on 09/11/22.
//

import Foundation

struct ResolvedReasonModel: Codable {
    let isSuccess: Bool
    let returnMessage: String
    let data: [Datum]
    let count: Int

    enum CodingKeys: String, CodingKey {
        case isSuccess = "IsSuccess"
        case returnMessage = "ReturnMessage"
        case data = "Data"
        case count
    }
}

// MARK: - Datum
struct Datum: Codable {
    let reasonID: Int
    let reasonText: String
    let clientID: Int
    let createdBy: String
    let createdByID: Int
    let createdOn: String
    let modifiedBy: String
    let modifiedByID: Int
    let modifiedOn: String

    enum CodingKeys: String, CodingKey {
        case reasonID = "ReasonID"
        case reasonText = "ReasonText"
        case clientID = "ClientID"
        case createdBy = "CreatedBy"
        case createdByID = "CreatedByID"
        case createdOn = "CreatedOn"
        case modifiedBy = "ModifiedBy"
        case modifiedByID = "ModifiedByID"
        case modifiedOn = "ModifiedOn"
    }
}
