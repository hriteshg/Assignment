import UIKit

class Styles {
    static let shared = Styles()
    
    let primaryColor = UIColor(hex: "#0D3880")
    let secondaryColor = UIColor(hex: "#EFF3FB")
    let cardBackgroundColor = UIColor(hex: "#FFFFFF")
    let primaryTextColor = UIColor(hex: "#333A49")
    let secondaryTextColor = UIColor(hex: "#69768C")
    let reveresedTextColor = UIColor(hex: "#0D3880")
    let primaryButtonColor = UIColor(hex: "#2765CF")

    let smallFontSize: CGFloat = 14.0
    let mediumFontSize: CGFloat = 16.0
    let largeFontSize: CGFloat = 18.0

    let regularFontWeight: UIFont.Weight = .regular
    let mediumFontWeight: UIFont.Weight = .medium
    let boldFontWeight: UIFont.Weight = .bold
    
    private init() {}
}
