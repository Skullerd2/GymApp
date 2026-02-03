import SwiftUI
import DataLayer

@MainActor
final class ViewFactory {
    private let database: GymDatabaseProtocol
    
    init(database: GymDatabaseProtocol) {
        self.database = database
    }
    
    @ViewBuilder
    func makeView(for route: AppRoute) -> some View {
        switch route {
        case .exerciseList:
            Image("")
        case .activeWorkout:
            Text("lala")
        case .createTemplate:
            Text("haha")
        }
    }
}
