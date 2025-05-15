//
//  CountryPicker.swift
//  GroceriesShop
//
//  Created by Kevin Cuadros on 14/05/25.
//

import SwiftUI
import CountryPicker

struct CountryPicker: UIViewControllerRepresentable {
    
    let countryPicker = CountryPickerViewController()
    
    @Binding var country: Country?
    
    func makeUIViewController(context: Context) -> CountryPickerViewController {
        countryPicker.selectedCountry = country?.isoCode ?? ""
        countryPicker.delegate = context.coordinator
        return countryPicker
    }
    
    func updateUIViewController(
        _ uiViewController: CountryPickerViewController,
        context: Context
    ) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject, CountryPickerDelegate {
        var parent: CountryPicker
        init(_ parent: CountryPicker) {
            self.parent = parent
        }
        func countryPicker(didSelect country: Country) {
            parent.country = country
        }
    }
}
