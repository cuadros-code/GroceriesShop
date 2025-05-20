//
//  MainViewModel.swift
//  GroceriesShop
//
//  Created by Kevin Cuadros on 19/05/25.
//

import SwiftUI

class MainViewModel: ObservableObject {
    static var shared: MainViewModel = MainViewModel()
    
    @Published var textEmail: String = ""
    @Published var textPassword: String = ""
    @Published var isShowPassword: Bool = false
}
