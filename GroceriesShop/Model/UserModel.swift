//
//  UserModel.swift
//  GroceriesShop
//
//  Created by Kevin Cuadros on 3/07/25.
//

import Foundation

struct UserModel: Codable, Identifiable, Equatable {
    
    let id: Int
    let username, name, email, mobile: String
    let mobileCode, authToken: String
    let status: Int
    let password: String! = ""
    let createdDate: String
    
    enum CodingKeys: String, CodingKey {
        case id = "user_id"
        case username, name, email, mobile
        case mobileCode = "mobile_code"
        case authToken = "auth_token"
        case status
        case password
        case createdDate = "created_date"
    }
    
    static func == (lhs: UserModel, rhs: UserModel) -> Bool {
        return lhs.id == rhs.id
    }
    
}
