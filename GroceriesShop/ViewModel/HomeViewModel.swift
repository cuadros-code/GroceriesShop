//
//  HomeViewModel.swift
//  GroceriesShop
//
//  Created by Kevin Cuadros on 4/07/25.
//
import SwiftUI

class HomeViewModel: ObservableObject {
    
    static var shared: HomeViewModel = HomeViewModel()
    
    @State var selectedTab: Int = 0
    
}
