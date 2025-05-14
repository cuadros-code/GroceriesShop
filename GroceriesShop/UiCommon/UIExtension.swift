//
//  UIExtension.swift
//  GroceriesShop
//
//  Created by Kevin Cuadros on 13/05/25.
//
import SwiftUI

enum Gilroy: String {
    case regular = "Gilroy-Regular"
    case medium = "Gilroy-Medium"
    case semibold = "Gilroy-SemiBold"
    case bold = "Gilroy-Bold"
}

extension Font {
    
    static func customFont(_ font: Gilroy, fontSize: CGFloat) -> Font {
        custom(font.rawValue, size: fontSize)
    }
}

extension CGFloat {
    
    static var screenWidth: Double {
        return UIScreen.main.bounds.size.width
    }
    
    static var screenHeight: Double {
        return UIScreen.main.bounds.size.height
    }
    
    static func widthPer(per: Double) -> Double {
        return screenWidth * per
    }
    
    static func heightPer(per: Double) -> Double {
        return screenHeight * per
    }
    
    static var topInsets: Double {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let keyWindow = windowScene.windows.first(
                where: { $0.isKeyWindow
                }) {
                return keyWindow.safeAreaInsets.top
            }
        }
        return 0.0
    }
    
    static var bottomInsets: Double {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let keyWindow = windowScene.windows.first(
                where: { $0.isKeyWindow
                }) {
                return keyWindow.safeAreaInsets.bottom
            }
        }
        return 0.0
    }
    
    static var horizontalInsets: Double {
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let keyWindow = windowScene.windows.first( where: { $0.isKeyWindow }) {
                return keyWindow.safeAreaInsets.left + keyWindow.safeAreaInsets.right
            }
        }
        return 0.0
    }
    
    static var verticalInsets: Double {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let keyWindow = windowScene.windows.first( where: { $0.isKeyWindow }) {
                return keyWindow.safeAreaInsets.top + keyWindow.safeAreaInsets.bottom
            }
        }
        return 0.0
    }
    
}

extension Color {
    
    static var primary: Color {
        return Color(hex: "53B175")
    }
    
    static var primaryText: Color {
        return Color(hex: "030303")
    }
    
    static var secondaryText: Color {
        return Color(hex: "828282")
    }
    
    static var textTitle: Color {
        return Color(hex: "7C7C7C")
    }
    
    static var placeholder: Color {
        return Color(hex: "B1B1B1")
    }
    
    static var darkGray: Color {
        return Color(hex: "4C4F4D")
    }
    
    
    init(hex: String) {
        let hex = hex.replacingOccurrences(of: "#", with: "")
    
        let int = UInt64(hex, radix: 16) ?? 0x000000
        
        let r, g, b, a: Double
        
        if hex.count == 6 {
            r = Double((int >> 16) & 0xFF) / 255
            g = Double((int >> 8) & 0xFF) / 255
            b = Double(int & 0xFF) / 255
            a = 1.0
        } else if hex.count == 8 {
            a = Double((int >> 24) & 0xFF) / 255
            r = Double((int >> 16) & 0xFF) / 255
            g = Double((int >> 8) & 0xFF) / 255
            b = Double(int & 0xFF) / 255
        } else {
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(.sRGB, red: r, green: g, blue: b, opacity: a)
    }
    
}
