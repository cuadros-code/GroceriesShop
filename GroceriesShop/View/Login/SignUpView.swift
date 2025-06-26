//
//  SignUpView.swift
//  GroceriesShop
//
//  Created by Kevin Cuadros on 26/06/25.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var loginVM = MainViewModel.shared
    
    
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
                
                
                Text("Sign Up")
                    .font(.customFont(.semibold, fontSize: 26))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 4)
                
                
                Text("Enter your credentials to continue")
                    .font(.customFont(.semibold, fontSize: 16))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, .screenWidth * 0.1)
                
                LineTextField(
                    text: $loginVM.textEmail,
                    title: "Username",
                    placeholder: "Enter your username",
                    keyboardType: .default
                )
                .padding(.bottom, .screenWidth * 0.07)
                
                LineTextField(
                    text: $loginVM.textEmail,
                    title: "Email",
                    placeholder: "Enter your email address",
                    keyboardType: .emailAddress
                )
                .padding(.bottom, .screenWidth * 0.07)
                
                
                LineSecureField(
                    text: $loginVM.textPassword,
                    isShowPassword: $loginVM.isShowPassword,
                    title: "Password",
                    placeholder: "Enter your password"
                )
                .padding(.bottom, .screenWidth * 0.02)
                
                
                NavigationLink {
                    // Term
                } label: {
                    VStack{
                        
                        Text("By continuing you agree to our ")
                            .font(.customFont(.semibold, fontSize: 14))
                            .foregroundColor(.secondary) +
                        Text("Terms of Service ")
                            .font(.customFont(.semibold, fontSize: 14))
                            .foregroundColor(.primary) +
                        Text("and ")
                            .font(.customFont(.semibold, fontSize: 14))
                            .foregroundColor(.secondary) +
                        Text("Privacy Policy.")
                            .font(.customFont(.semibold, fontSize: 14))
                            .foregroundColor(.primary)
                    }
                    .multilineTextAlignment(.leading)
                    
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, .screenWidth * 0.03)
                
                RoundedButton(title: "Sign Up") {                }
                    .padding(.bottom, .screenWidth * 0.05)
                
                
                Button {
                    dismiss()
                } label: {
                    HStack{
                        Text("Already have a account?")
                            .font(.customFont(.semibold, fontSize: 14))
                            .foregroundColor(.primaryText)
                        
                        Text("Login")
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
    SignUpView()
}
