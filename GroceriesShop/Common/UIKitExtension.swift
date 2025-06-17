//
//  UIKitExtension.swift
//  GroceriesShop
//
//  Created by Kevin Cuadros on 17/06/25.
//

import Foundation


extension String {
    
    var isValidEmail: Bool {
        let emailRegEx = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}"
        let emailTest = try! NSRegularExpression(
            pattern: emailRegEx,
            options: [.caseInsensitive]
        )
        
        return emailTest
            .firstMatch(
                in: self,
                range: NSRange(location: 0, length: self.utf16.count)
            ) != nil
    }
    
}
