//
//  MainViewModel.swift
//  GroceriesShop
//
//  Created by Kevin Cuadros on 19/05/25.
//

import SwiftUI

class MainViewModel: ObservableObject {
    static var shared: MainViewModel = MainViewModel()
    
    @Published var textEmail: String = ""
    @Published var textPassword: String = ""
    @Published var isShowPassword: Bool = false
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    init() {
        #if DEBUG
        textEmail = "cuadros@gmail.com"
        textPassword = "123456"
        #endif
    }
    
    //MARK: ServiceCall
    func serviceCallLogin() {
        
        if !textEmail.isValidEmail {
            self.errorMessage = "Please enter valid email address"
            self.showError = true
            return
        }
        
        if textPassword.isEmpty {
            self.errorMessage = "Please enter valid password"
            self.showError = true
            return
        }
        
        ServiceCall.post(
            parameters: [
                "email": textEmail,
                "password": textPassword,
                "dervice_token": ""
            ],
            path: Globs.SV_LOGIN,
            withSuccess: { responseObj in
                
                if let data = responseObj {
                    guard let statusCode = try? JSONDecoder().decode(Status.self, from: data) else {
                        print("error data")
                        return
                    }
                    
                    switch statusCode.status {
                    case .success:
                        guard let userJson = try? JSONDecoder().decode(UserModel.self, from: data) else {
                            self.errorMessage = "Error"
                            self.showError = true
                            return
                        }
                        self.errorMessage = userJson.message
                        self.showError = true
                        
                    case .failure:
                        guard let error = try? JSONDecoder().decode(UserModelError.self, from: data) else {
                            self.errorMessage = "Error"
                            self.showError = true
                            return
                        }
                        self.errorMessage = error.message
                        self.showError = true
                    }
                    
                }
                
            },
            failure: { err in
                self.errorMessage = err?.localizedDescription ?? "Fail"
                self.showError = true
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

// MARK: - UserModelError
struct UserModelError: Codable {
    let status, message: String
}

// MARK: - StatusCode
enum StatusCode: String, Decodable {
    case success = "1"
    case failure = "0"
}

struct Status: Decodable {
    let status: StatusCode
}
