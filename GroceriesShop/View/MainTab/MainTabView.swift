//
//  MainTabView.swift
//  GroceriesShop
//
//  Created by Kevin Cuadros on 4/07/25.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject var homeVM = HomeViewModel.shared
    
    var body: some View {
        VStack {
            TabView(selection: $homeVM.selectedTab) {
                HomeView().tag(0)
                ExploreView().tag(1)
                ExploreView().tag(2)
                ExploreView().tag(3)
                ExploreView().tag(4)
            }
            .onAppear {
                UIScrollView.appearance().isScrollEnabled = false
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .onChange(of: homeVM.selectedTab) { oldValue, newValue in
                debugPrint(newValue)
            }
            
            HStack {
                
                TabButton(
                    title: "Shop",
                    icon: .storeTab,
                    tag: .shop,
                    selectedTab: $homeVM.selectedTab
                ) {
                    homeVM.selectedTab = 0
                }
                
                TabButton(
                    title: "Explore",
                    icon: .exploreTab,
                    tag: .explore,
                    selectedTab: $homeVM.selectedTab
                ) {
                    homeVM.selectedTab = 1
                }
                
                TabButton(
                    title: "Car",
                    icon: .cartTab,
                    tag: .cart,
                    selectedTab: $homeVM.selectedTab
                ) {
                    homeVM.selectedTab = 2
                }
                
                TabButton(
                    title: "Favorite",
                    icon: .favTab,
                    tag: .favorite,
                    selectedTab: $homeVM.selectedTab
                ) {
                    homeVM.selectedTab = 3
                }
                
                TabButton(
                    title: "Account",
                    icon: .accountTab,
                    tag: .account,
                    selectedTab: $homeVM.selectedTab
                ) {
                    homeVM.selectedTab = 4
                }
            }
            .padding(.top, 10)
            .padding(.bottom, .bottomInsets)
            .padding(.horizontal, 10)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: Color.black.opacity(0.10), radius: 3, x: 0, y: -2)
            
            
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
