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
            
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(.back)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    Spacer()
                }
                .padding(.top, .topInsets )
                .padding(.bottom, .bottomInsets)
                
                Image(.colorLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .padding(.bottom, 60)
                
                
                HStack {
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Login")
                        
                            .font(.customFont(.semibold, fontSize: 26))
                        Text("Enter your emails and password")
                            .font(.customFont(.medium, fontSize: 16))
                            .foregroundColor(.textTitle)
                    }
                    Spacer()
                }
                .padding(.bottom, 40)
                
                VStack(alignment: .leading) {
                    Text("Email")
                        .font(.customFont(.semibold, fontSize: 16))
                        .foregroundColor(.textTitle)
                        .padding(.bottom, 5)
                    
                    TextField("Enter your email", text: $loginVM.textEmail)
                        .keyboardType(.emailAddress)
                        .padding(.bottom, 5)
                    
                    Divider()
                        .padding(.bottom, 40)
                    
                    
                    VStack(alignment: .leading) {
                        Text("Password")
                            .font(.customFont(.semibold, fontSize: 16))
                            .foregroundColor(.textTitle)
                            .padding(.bottom, 5)
                        
                        HStack {
                            Group {
                                if loginVM.isShowPassword {
                                    TextField(
                                        "Enter your password",
                                        text: $loginVM.textPassword
                                    )
                                    .padding(.bottom, 5)
                                    .frame(height: 30)
                                    
                                } else {
                                    SecureField(
                                        "Enter your password",
                                        text: $loginVM.textPassword
                                    )
                                    .textContentType(.password)
                                    .padding(.bottom, 5)
                                    .frame(height: 30)
                                }
                            }.animation(.easeInOut(duration: 0.2), value: loginVM.isShowPassword)
                            
                            Button {
                                loginVM.isShowPassword.toggle()
                            } label: {
                                Image(
                                    systemName: loginVM.isShowPassword ? "eye.slash.fill" : "eye.fill"
                                )
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.gray)
                            }
                        }
                    }
                    Divider()
                        .padding(.bottom, 10)
                                        
                    HStack {
                        Spacer()
                        Text("Forgot Password?")
                            .font(.customFont(.medium, fontSize: 15))
                            .foregroundColor(.black.opacity(0.8))
                    }
                    .padding(.bottom, 30)
                    
                    RoundedButton(title: "Log in") {
                        
                    }
                    .padding(.bottom, 30)
                    
                    HStack(alignment: .center) {
                        Spacer()
                        Text("Don’t have an account?")
                            .font(.customFont(.semibold, fontSize: 15))
                            .foregroundColor(.black)
                        Text("Singup")
                            .font(.customFont(.semibold, fontSize: 15))
                            .foregroundColor(Color.primary)
                        Spacer()
                    }
                    
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
            
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
