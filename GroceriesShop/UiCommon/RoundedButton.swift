//
//  RoundedButton.swift
//  GroceriesShop
//
//  Created by Kevin Cuadros on 13/05/25.
//

import SwiftUI

struct RoundedButton: View {
    
    @State var title: String = "Title"
    var action: () -> Void?
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.customFont(.semibold, fontSize: 18))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 60,
            maxHeight: 60
        )
        .background(Color.primary)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    RoundedButton {
        
    }
        .padding(20)
}
