//
//  ServiceCall.swift
//  GroceriesShop
//
//  Created by Kevin Cuadros on 27/05/25.
//
import UIKit

enum ParametersEncodingError: Error {
    case string
}

class ServiceCall {
    
    static let baseUrl = "http://localhost:3001/api/app"
    
    class func post(
        parameters: NSDictionary,
        path: String,
        isToken: Bool = false,
        withSuccess: @escaping ((_ responseObj: Data?) -> ()),
        failure: @escaping ((_ responseObj: Error?) -> ())
    ) {
        
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                
                let parametersData = try ServiceCall.covertDictionaryToString(
                    parameter: parameters
                )
                
                var request = URLRequest(
                    url: URL(string: path)!,
                    timeoutInterval: 20 // seconds
                )
                request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
                
                request.httpMethod = "POST"
                request.httpBody = parametersData
                
                let task = URLSession.shared.dataTask(with: request) {
                    data,
                    response,
                    error in
                    
                    if let error = error {
                        DispatchQueue.main.async {
                            failure(error)
                        }
                        return
                    }
                    if let data = data {
                        DispatchQueue.main.async {
                            withSuccess(data)
                        }
                        return
                    }
                }
                
                task.resume()
                
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    
    static func covertDictionaryToString(parameter: NSDictionary) throws -> Data {
        var components = [String]()
        
        for (key, value) in parameter {
            if let keyString = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
               let valueString = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                components.append("\(keyString)=\(valueString)")
            }
        }
        
        guard let data = components.joined(separator: "&").data(using: .utf8) else {
            throw ParametersEncodingError.string
        }
        
        return data
    }
    
    
    
}
