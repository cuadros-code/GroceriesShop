//
//  TabButton.swift
//  GroceriesShop
//
//  Created by Kevin Cuadros on 9/07/25.
//

import SwiftUI

enum Tag: Int {
    case shop = 0
    case explore = 1
    case cart = 2
    case favorite = 3
    case account = 4
}

struct TabButton: View {
    
    @State var title: String = "Title"
    @State var icon: ImageResource
    @State var tag: Tag
    @Binding var selectedTab: Int
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                
                Text("\(title)")
                    .font(.customFont(.semibold, fontSize: 14))
            }
        }
        .foregroundColor(
            selectedTab == tag.rawValue ? .primary : .primaryText
        )
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

#Preview {
    TabButton(
        title: "",
        icon: .accountTab,
        tag: Tag.explore,
        selectedTab: .constant(1)
    ) { }
}
