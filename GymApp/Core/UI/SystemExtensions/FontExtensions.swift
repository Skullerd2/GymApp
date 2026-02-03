import SwiftUI

extension Font {
    
    enum FontWeight: String {
        case regular = "Inter-Regular"
        case medium = "Inter-Medium"
        case bold = "Inter-Bold"
        case semibold = "Inter-SemiBold"
    }
    
    static func interFont(weight: FontWeight, size : CGFloat) -> Font {
        return .custom(weight.rawValue, size: size)
    }
    
}
