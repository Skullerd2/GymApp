import SwiftUI
import DataLayer
struct TemplatesListView: View {
    @ObservedObject var viewModel: TemplatesListViewModel
    
    var body: some View {
        GeometryReader { geometry in
            GeneralBackground(title: "Templates") {
                if viewModel.exercises.isEmpty {
                    Spacer()
                    CreateTemplateMainView(imageSize: geometry.size.width / 2)
                        .padding(.bottom, 120)
                    Spacer()
                }
            }
        }
        
    }
}

#Preview {
    let mockDB = GymDatabase(isInMemory: true)
    let mockRepo = ExerciseRepository(context: mockDB.context)
    TemplatesListView(viewModel: TemplatesListViewModel(repository: mockRepo))
}
