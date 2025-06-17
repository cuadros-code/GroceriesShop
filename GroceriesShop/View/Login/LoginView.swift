//
//  LoginView.swift
//  GroceriesShop
//
//  Created by Kevin Cuadros on 14/05/25.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var loginVM = MainViewModel.shared;
    
    var body: some View {
        ZStack {
            Image(.bottomBg)
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack{
                
                Image(.colorLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .padding(.bottom, .screenWidth * 0.1)
                
                
                Text("Login")
                    .font(.customFont(.semibold, fontSize: 26))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 4)
                
                Text("Enter your emails and password")
                    .font(.customFont(.semibold, fontSize: 16))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, .screenWidth * 0.1)
                
                LineTextField(
                    text: $loginVM.textEmail,
                    title: "Email",
                    placeholder: "Enter your email address",
                    keyboardType: .emailAddress
                )
                    .padding(.bottom, .screenWidth * 0.07)
                
                
                LineSecureField(
                    text: $loginVM.textPassword,
                    isShowPassword: $loginVM.isShowPassword, title: "Password",
                    placeholder: "Enter your password"
                )
                    .padding(.bottom, .screenWidth * 0.02)
                
                
                NavigationLink {
                    // Forgot Password
                } label: {
                    Text("Forgot Password?")
                        .font(.customFont(.medium, fontSize: 14))
                        .foregroundColor(.primaryText)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .padding(.bottom, .screenWidth * 0.03)
                
                RoundedButton(title: "Log In") {
                    loginVM.serviceCallLogin()
                }
                .padding(.bottom, .screenWidth * 0.05)
                
                
                NavigationLink {
                    // Sigup
                } label: {
                    HStack{
                        Text("Don’t have an account?")
                            .font(.customFont(.semibold, fontSize: 14))
                            .foregroundColor(.primaryText)
                        
                        Text("Signup")
                            .font(.customFont(.semibold, fontSize: 14))
                            .foregroundColor(.primary)
                    }
                }
                
                
                
                Spacer()
            }
            .padding(.top, .topInsets + 64)
            .padding(.horizontal, 20)
            .padding(.bottom, .bottomInsets)
            
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    
                    Spacer()
                }
                Spacer()
                
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
            
            
        }
        .alert(isPresented: $loginVM.showError) {
            Alert(
                title: Text(Globs.AppName),
                message: Text(loginVM.errorMessage),
                dismissButton: .default(Text("OK"))
            )
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView()
}
