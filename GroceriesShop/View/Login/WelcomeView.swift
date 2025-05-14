//
//  WelcomeView.swift
//  GroceriesShop
//
//  Created by Kevin Cuadros on 13/05/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            Image("welcom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
                
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WelcomeView()
}
