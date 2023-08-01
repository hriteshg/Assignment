import Foundation
import UIKit

extension UIColor {
    convenience init?(hex: String) {
        var formattedHex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var alpha: CGFloat = 1.0
        
        if formattedHex.count == 8 {
            let alphaHex = formattedHex.prefix(2)
            formattedHex = String(formattedHex.dropFirst(2))
            
            if let alphaValue = UInt8(alphaHex, radix: 16) {
                alpha = CGFloat(alphaValue) / 255.0
            } else {
                return nil
            }
        }
        
        if formattedHex.count == 6 {
            var rgbValue: UInt64 = 0
            Scanner(string: formattedHex).scanHexInt64(&rgbValue)
            
            let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
            let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
            let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
            
            self.init(red: red, green: green, blue: blue, alpha: alpha)
        } else {
            return nil
        }
    }
}
