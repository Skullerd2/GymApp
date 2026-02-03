import SwiftUI

public enum AppTabEnum: Int, CaseIterable, Identifiable {
    case dashboard = 0
    case workouts = 1
    case history = 2
    case coach = 3
    
    public var id: Int {
        rawValue
    }
    
    var title: String {
        switch self {
        case .dashboard:
            return "Главная"
        case .workouts:
            return "Тренировки"
        case .history:
            return "История тренировок"
        case .coach:
            return "ИИ-тренер"
        }
    }
    
    var icon: String {
        switch self {
        case .dashboard:
            "house.fill"
        case .workouts:
            "dumbbell.fill"
        case .history:
            "clock.arrow.trianglehead.counterclockwise.rotate.90"
        case .coach:
            "figure.strengthtraining.traditional"
        }
    }
}
