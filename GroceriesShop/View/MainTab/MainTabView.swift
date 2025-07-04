//
//  MainTabView.swift
//  GroceriesShop
//
//  Created by Kevin Cuadros on 4/07/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        ZStack {
            
            VStack {
                HStack {
                    Button {
                        MainViewModel.shared.logout()
                    } label: {
                        Text("Logout")
                    }
                }
                
            }
            
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    MainTabView()
}
