import SwiftUI
import DataLayer

struct DashboardCardTabs: View {
    @ObservedObject var viewModel: DashboardViewModel
    var body: some View {
        TabView {
            if !viewModel.workouts.isEmpty {
                ForEach(viewModel.workouts) { workout in
                    DashboardWorkoutCard(workoutImageURL: workout.imageURL, workoutName: workout.name, dayOfWeek: "Сегодня", isChill: false)
                }
            } else {
                DashboardWorkoutCard(workoutImageURL: nil, workoutName: "Сегодня без тренировок", dayOfWeek: "Сегодня", isChill: true)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .automatic))
        .frame(height: 250)
    }
}


#Preview {
    let mockDB = GymDatabase.preview
    DashboardCardTabs(viewModel: DashboardViewModel(database: mockDB))
}
