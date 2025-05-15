//
//  SignInView.swift
//  GroceriesShop
//
//  Created by Kevin Cuadros on 13/05/25.
//

import SwiftUI
import CountryPicker

struct SignInView: View {
    
    @State private var txtMobile = ""
    @State private var country: Country?
    @State private var isShowPicker: Bool = false
    
    var body: some View {
        ZStack {
            
            Image(.bottomBg)
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack {
                Image(.signInTop)
                    .resizable()
                    .scaledToFill()
                    .frame(width: .screenWidth, height: .screenWidth)
                
                Spacer()
                
            }
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Get your groceries\nwith nectar")
                        .font(.customFont(.semibold, fontSize: 26))
                        .foregroundColor(.primaryText)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 25)
                    
                    HStack {
                        Button {
                            isShowPicker.toggle()
                        } label: {
                            if let country = country {
                                Text(country.isoCode.getFlag())
                                    .font(.customFont(.semibold, fontSize: 28))
                                
                                Text("+\(country.phoneCode)")
                                    .font(.customFont(.semibold, fontSize: 18))
                                    .foregroundColor(.primaryText)
                            }
                        }
                        
                        TextField("Enter Mobile", text: $txtMobile)
                            .keyboardType(.numberPad)
                            .frame(minWidth: 0, maxWidth: .infinity)
                        
                    }
                    Divider()
                        .padding(.bottom, 30)
                    
                    Text("Or connect with social media")
                        .font(.customFont(.semibold, fontSize: 14))
                        .foregroundColor(.secondaryText)
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity,
                            alignment: .center
                        )
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 25)
                    
                    Button {
                        
                    } label: {
                        Image(.googleLogo)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        Text("Continue with Google")
                            .font(.customFont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                    }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 60,
                        maxHeight: 60
                    )
                    .background(Color(hex: "5383EC"))
                    .clipShape(RoundedRectangle(cornerRadius: 19))
                    .padding(.bottom, 8)
                    
                    Button {
                        
                    } label: {
                        Image(.fbLogo)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        Text("Continue with Facebook")
                            .font(.customFont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 60,
                        maxHeight: 60
                    )
                    .background(Color(hex: "4A66AC"))
                    .clipShape(RoundedRectangle(cornerRadius: 19))
                }
                .padding(.horizontal, 20)
                .frame(width: .screenWidth, alignment: .leading)
                .padding(.top, .topInsets + .screenWidth)
                
                
                
            }
            
        }
        .onAppear {
            self.country = Country(phoneCode: "57", isoCode: "CO")
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
        .sheet(isPresented: $isShowPicker) {
            CountryPicker(country: $country)
        }
    }
}

#Preview {
    SignInView()
}
