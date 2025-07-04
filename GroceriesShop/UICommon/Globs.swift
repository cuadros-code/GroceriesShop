//
//  Globs.swift
//  GroceriesShop
//
//  Created by Kevin Cuadros on 27/05/25.
//

import Foundation

struct Globs {
    
    static let AppName = "Online Groceries"
    
    static let BASE_URL = "http://localhost:3001/api/app"
    
    static let userPayload = "userPayload"
    
    static let userLogin = "userLogin"
    
    static let SV_LOGIN = BASE_URL + "/login"
    
    static let SV_SIGNUP = BASE_URL + "/sign_up"
    
}

struct KKey {
    static let status = "status"
    static let message = "message"
    static let payload = "payload"
}

class Utils {
    class func UDSet(data: Encodable, key: String) {
        if let encoded = try? JSONEncoder().encode(data) {
            UserDefaults.standard.set(encoded, forKey: key)
            UserDefaults.standard.synchronize()
        }
    }
    
    class func UDValue(key: String) -> Any {
        return UserDefaults.standard.value(forKey: key) as Any
    }
    
    class func UDValueBool(key: String) -> Bool {
        return UserDefaults.standard.value(forKey: key) as? Bool ?? false
    }
    
    class func UDValueTrueBool(key: String) -> Bool {
        return UserDefaults.standard.value(forKey: key) as? Bool ?? true
    }
    
    class func UDRemove(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
}
