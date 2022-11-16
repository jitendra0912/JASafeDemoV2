//
//  AuthenticationResponse.swift
//  PENN Food Safety
//
//  Created by Varun Shukla on 17/08/22.
//

import Foundation

/**
 Container for JSON callbacks expected from the authentication endpoint.
 */
struct AuthenticationResponse: Codable {
    struct Callback: Codable {
        let type: String?
    }

    let authId: String?
    var callbacks: [Callback] = []
}
