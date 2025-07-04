//
//  GroceriesShopApp.swift
//  GroceriesShop
//
//  Created by Kevin Cuadros on 12/05/25.
//

import SwiftUI

@main
struct GroceriesShopApp: App {
    
    @StateObject var mainVM = MainViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if mainVM.isUserLogin {
                    MainTabView()
                } else {
                    WelcomeView()
                }
            }
        }
    }
}
