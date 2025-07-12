//
//  HomeView.swift
//  GroceriesShop
//
//  Created by Kevin Cuadros on 7/07/25.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeVM = HomeViewModel.shared
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    Image(.colorLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    
                    HStack {
                        Image(.location)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                        Text("Buga, Colombia")
                            .font(.customFont(.semibold, fontSize: 18))
                            .foregroundColor(.darkGray)
                    }
                    
                    SearchTextField(text: $homeVM.textSearch)
                        .padding(20)
                }
                .padding(.top, .topInsets)
                
                Image(.bannerTop)
                    .resizable()
                    .scaledToFill()
                
                
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
