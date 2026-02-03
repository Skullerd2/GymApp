import SwiftUI
import SwiftData
import DataLayer

@main
struct GymApp: App {
    
    let database: GymDatabaseProtocol = GymDatabase()

    var body: some Scene {
        WindowGroup {
            MainTabView(viewFactory: ViewFactory(database: database))
        }
        .modelContainer(database.container)
    }
}
