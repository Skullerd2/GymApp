import SwiftUI
import DataLayer
public struct MainTabView: View {
    let viewFactory: ViewFactory
    @StateObject private var router = AppRouter()
    @State var selectedTab: AppTabEnum = .dashboard
    public var body: some View {
        ZStack(alignment: .bottom) {
            tabView(for: selectedTab)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(edges: .bottom)
            CustomTabBar(selectedTab: $selectedTab)
                .padding(.bottom, 8)
                .padding(.horizontal, 32)
        }
    }
    
    @ViewBuilder
    private func tabView(for tab: AppTabEnum) -> some View {
        let gymDatabase = GymDatabase()
        let repo = ExerciseRepository(context: gymDatabase.context)
        switch tab {
        case .dashboard:
            DashboardView(viewModel: DashboardViewModel(database: gymDatabase))
        case .workouts:
            TemplatesListView(viewModel: TemplatesListViewModel(repository: repo))
        case .history:
            Text("dashboard")
        case .coach:
            Text("dashboard")
        }
    }
}


#Preview {
    let mockDB = GymDatabase.preview
    MainTabView(viewFactory: ViewFactory(database: mockDB))
}
