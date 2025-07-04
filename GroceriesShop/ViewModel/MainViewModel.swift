//
//  MainViewModel.swift
//  GroceriesShop
//
//  Created by Kevin Cuadros on 19/05/25.
//

import SwiftUI

class MainViewModel: ObservableObject {
    static var shared: MainViewModel = MainViewModel()
    
    @Published var textUsername: String = ""
    @Published var textEmail: String = ""
    @Published var textPassword: String = ""
    @Published var isShowPassword: Bool = false
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var isUserLogin = false
    @Published var userObj: UserModel!
    
    init() {
        #if DEBUG
        textUsername = "user4"
        textEmail = "cuadros@gmail.com"
        textPassword = "123456"
        #endif
        
        self.validateUserAuth()
    }
    
    func validateUserAuth() {
        guard let data = Utils.UDValue(key: Globs.userPayload) as? Data else { return }
        
        guard let decodeUser = try? JSONDecoder().decode(UserModel.self, from: data ) else {
            return
        }
        
        self.userObj = decodeUser
        self.isUserLogin = true
    }
    
    func saveAuthState(_ userPayload: UserModel){
        Utils.UDSet(data: userPayload, key: Globs.userPayload)
        Utils.UDSet(data: true, key: Globs.userLogin)
        
        userObj = userPayload
        isUserLogin = true
        
        isShowPassword = false
        showError = false
        errorMessage = ""
    }
    
    func logout() {
        userObj = nil
        isUserLogin = false
        Utils.UDRemove(key: Globs.userPayload)
        Utils.UDSet(data: false, key: Globs.userLogin)
    }
    
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
                        guard let userJson = try? JSONDecoder().decode(AuthModel.self, from: data) else {
                            self.errorMessage = "Error"
                            self.showError = true
                            return
                        }
                        self.saveAuthState(userJson.payload)
                        
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
    
    func serviceCallSignup() {
        
        if textUsername.isEmpty {
            self.errorMessage = "Please enter a username"
            self.showError = true
            return
        }
        
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
                "username": textUsername,
                "email": textEmail,
                "password": textPassword,
                "dervice_token": ""
            ],
            path: Globs.SV_SIGNUP,
            withSuccess: { responseObj in
                
                if let data = responseObj {
                    guard let statusCode = try? JSONDecoder().decode(Status.self, from: data) else {
                        print("error data")
                        return
                    }
                    
                    switch statusCode.status {
                    case .success:
                        guard let userJson = try? JSONDecoder().decode(AuthModel.self, from: data) else {
                            self.errorMessage = "Error"
                            self.showError = true
                            return
                        }
                        self.saveAuthState(userJson.payload)
                        
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


// MARK: - AuthModel
struct AuthModel: Codable {
    let status: String
    let payload: UserModel
    let message: String
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
