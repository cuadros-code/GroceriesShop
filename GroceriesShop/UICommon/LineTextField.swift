//
//  LineTextField.swift
//  GroceriesShop
//
//  Created by Kevin Cuadros on 19/05/25.
//

import SwiftUI

struct LineTextField: View {
    
    @Binding var text: String
    @State var title: String = "Title"
    @State var placeholder: String = "Placeholder"
    @State var keyboardType: UIKeyboardType = .default
    @State var isPassword: Bool = false
    
    var body: some View {
        VStack {
            Text(title)
                .font(.customFont(.semibold, fontSize: 16))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            
            TextField(placeholder, text: $text)
                .autocorrectionDisabled()
                .keyboardType(keyboardType)
                .frame(height: 35)
            
            Divider()
        }
    }
}

struct LineSecureField: View {
    
    @Binding var text: String
    @Binding var isShowPassword: Bool
    
    @State var title: String = "Title"
    @State var placeholder: String = "Placeholder"
    
    
    var body: some View {
        VStack {
            Text(title)
                .font(.customFont(.semibold, fontSize: 16))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            if isShowPassword {
                TextField(placeholder, text: $text)
                    .autocorrectionDisabled()
                    .modifier(ShowButton(isShow: $isShowPassword))
                    .frame(height: 35)
                
            } else {
                SecureField(placeholder, text: $text)
                    .autocorrectionDisabled()
                    .modifier(ShowButton(isShow: $isShowPassword))
                    .frame(height: 35)
            }
            Divider()
        }
    }
}

#Preview {
    LineTextField(text: .constant(""))
    LineSecureField(text: .constant(""), isShowPassword: .constant(true))
}
