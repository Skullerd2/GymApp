import SwiftUI
import DataLayer

struct DashboardView: View {
    @ObservedObject var viewModel: DashboardViewModel
    
    var body: some View {
        GeneralBackground(title: "Dashboard") {
            NavigationTopButton(title: String(viewModel.amountOfWorkouts), imageName: "figure.walk.treadmill.circle.fill") {
                print(1)
            }
        } content: {
            VStack(spacing: 16) {
                DashboardCardTabs(viewModel: viewModel)
                DashboardGrid(isDetailed: false)
                    .padding(.bottom, 100)
                Spacer()
            }
        }
        
    }
}

#Preview {
    let mockDB = GymDatabase.preview
    let vm = DashboardViewModel(database: mockDB)
    return DashboardView(viewModel: vm)
}

