//
//  SearchTextField.swift
//  GroceriesShop
//
//  Created by Kevin Cuadros on 11/07/25.
//

import SwiftUI

struct SearchTextField: View {
    
    @Binding var text: String
    
    @State var placeholder: String = "Search Store"
    
    var body: some View {
        HStack {
            Image(.search)
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
            
            TextField(
                placeholder,
                text: $text,
                prompt: Text(placeholder).foregroundStyle(.black.opacity(0.7))
            )
                .autocorrectionDisabled()
                .frame(height: 35)
                .accentColor(.black)
        }
        .padding(10)
        .background(.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    SearchTextField(text: .constant(""))
        .padding()
}
