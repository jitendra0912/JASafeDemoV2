//
//  FSApplicationStateManager.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 07/09/22.
//

import Foundation
import AppAuth
import JWTDecode

class FSApplicationStateManager {
    
    private var authState: OIDAuthState
    private var metadataValue: OIDServiceConfiguration? = nil
    var idToken: String? = nil
    
    var siteID: Int? {
        return OBJ_FOR_KEY(FSConstants.UserDefault.siteID) as? Int
    }
    var roleID: Int? {
        return OBJ_FOR_KEY(FSConstants.UserDefault.roleID) as? Int
    }
    
    init() {
        self.authState = OIDAuthState(authorizationResponse: nil, tokenResponse: nil, registrationResponse: nil)
    }
    
    //    func saveTokens(tokenResponse: OIDTokenResponse) {
    //        if (tokenResponse.idToken != nil) {
    //            self.idToken = tokenResponse.idToken
    //        }
    //        self.authState.update(with: tokenResponse, error: nil)
    //    }
    
    func saveTokens(accessToken: String, refreshToken: String){
        SET_OBJ_FOR_KEY(accessToken, key: FSConstants.UserDefault.accessToken)
        SET_OBJ_FOR_KEY(refreshToken, key: FSConstants.UserDefault.refreshToken)
        do  {
            let jwt = try decode(jwt: accessToken)
            if let siteID = jwt.body[FSConstants.UserDefault.siteID] {
                SET_OBJ_FOR_KEY(siteID, key: FSConstants.UserDefault.siteID)
                print(siteID)
            }
            if let roleID = jwt.body[FSConstants.UserDefault.roleID] {
                SET_OBJ_FOR_KEY(roleID, key: FSConstants.UserDefault.roleID)

                print(roleID)
            }
            if let clientID = jwt.body[FSConstants.UserDefault.clientID] {
                SET_OBJ_FOR_KEY(clientID, key: FSConstants.UserDefault.clientID)
                print(clientID)
            }
            print(jwt)
        } catch let error as NSError {
            print(error)
            return
        }
        
    }
    
    func clearTokens() {
        self.authState = OIDAuthState(authorizationResponse: nil, tokenResponse: nil, registrationResponse: nil)
        self.idToken = nil
    }
    
    var metadata: OIDServiceConfiguration? {
        get {
            return self.metadataValue
        }
        set(value) {
            self.metadataValue = value
        }
    }
    
    var tokenResponse: OIDTokenResponse? {
        get {
            return self.authState.lastTokenResponse
        }
    }
}
