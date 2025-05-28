//
//  MainViewModel.swift
//  GroceriesShop
//
//  Created by Kevin Cuadros on 19/05/25.
//

import SwiftUI

class MainViewModel: ObservableObject {
    static var shared: MainViewModel = MainViewModel()
    
    @Published var textEmail: String = "test@gmail.com"
    @Published var textPassword: String = "123456"
    @Published var isShowPassword: Bool = false
    
    //MARK: ServiceCall
    func serviceCallLogin() {
        
        ServiceCall.post(
            parameters: [
                "email": textEmail,
                "password": textPassword,
                "dervice_token": ""
            ],
            path: Globs.SV_LOGIN,
            withSuccess: { responseObj in
                
                if let response = responseObj as? NSDictionary {
                    if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                        
                    } else {
                        
                    }
                }
                
            },
            failure: { err in
                print("ERROR")
            }
        )
    }
    
}


// MARK: - UserModel
struct UserModel: Codable {
    let status: String
    let payload: Payload
    let message: String
}

// MARK: - Payload
struct Payload: Codable {
    let userID: Int
    let username, name, email, mobile: String
    let mobileCode, authToken: String
    let status: Int
    let createdDate: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case username, name, email, mobile
        case mobileCode = "mobile_code"
        case authToken = "auth_token"
        case status
        case createdDate = "created_date"
    }
}
