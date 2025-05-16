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
            Image(.welcomBg)
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
                
            VStack {
                Spacer()
                Image(.appLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .padding(.bottom, 0)
                
                Text("Welcome\nto our store")
                    .font(.customFont(.semibold, fontSize: 48))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                
                Text("Get your groceries in as fast as one hour")
                    .font(.customFont(.medium, fontSize: 16))
                    .foregroundStyle(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                
                NavigationLink {
//                    SignInView()
                    LoginView()
                } label: {
                    RoundedButton(title: "Get Started") {}
                }

                Spacer()
                    .frame(height: 100)
                
                
            }
            .padding(.horizontal, 20)
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        WelcomeView()
    }
}
