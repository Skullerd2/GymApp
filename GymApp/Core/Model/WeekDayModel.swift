import Foundation
import SwiftUI

struct WeekDayModel: Identifiable {
    let id = UUID()
    let name: String
    let status: WeekDayStatus
}

enum WeekDayStatus {
    case selected
    case active
    case standard
    
    var backgroundColor: Color {
        switch self {
        case .selected:
            return Color.AppColors.greenSelectedColor
        case .active:
            return Color.AppColors.mainColor
        case .standard:
            return Color.AppColors.whiteGraphColor
        }
    }
    
    var textColor: Color {
        switch self {
        case .standard: return .black
        default: return .white
        }
    }
    
}
