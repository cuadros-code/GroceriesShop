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
                Button {
                    
                } label: {
                    VStack {
                        Image(.storeTab)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        
                        Text("Shop")
                            .font(.customFont(.semibold, fontSize: 14))
                    }
                }
                .foregroundColor(
                    homeVM.selectedTab == 0 ? .primary : .primaryText
                )
                .frame(minWidth: 0, maxWidth: .infinity)
                
                Button {
                    
                } label: {
                    VStack {
                        Image(.exploreTab)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        
                        Text("Explore")
                            .font(.customFont(.semibold, fontSize: 14))
                    }
                }
                .foregroundColor(
                    homeVM.selectedTab == 1 ? .primary : .primaryText
                )
                .frame(minWidth: 0, maxWidth: .infinity)
                
                Button {
                    
                } label: {
                    VStack {
                        Image(.cartTab)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        
                        Text("Car")
                            .font(.customFont(.semibold, fontSize: 14))
                    }
                }
                .foregroundColor(
                    homeVM.selectedTab == 2 ? .primary : .primaryText
                )
                .frame(minWidth: 0, maxWidth: .infinity)
                
                Button {
                    
                } label: {
                    VStack {
                        Image(.favTab)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        
                        Text("Favorite")
                            .font(.customFont(.semibold, fontSize: 14))
                    }
                }
                .foregroundColor(
                    homeVM.selectedTab == 3 ? .primary : .primaryText
                )
                .frame(minWidth: 0, maxWidth: .infinity)
                
                Button {
                    
                } label: {
                    VStack {
                        Image(.accountTab)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        
                        Text("Account")
                            .font(.customFont(.semibold, fontSize: 14))
                    }
                }
                .foregroundColor(
                    homeVM.selectedTab == 4 ? .primary : .primaryText
                )
                .frame(minWidth: 0, maxWidth: .infinity)
            }
            .padding(.bottom, .bottomInsets)
            .padding(.horizontal, 10)
            
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
