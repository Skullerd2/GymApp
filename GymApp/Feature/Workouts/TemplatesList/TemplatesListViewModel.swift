import DataLayer
import SwiftUI
import Combine

@MainActor
public final class TemplatesListViewModel: ObservableObject {
    @Published var exercises: [Exercise] = []
    private let repository: ExerciseRepository
    
    init(repository: ExerciseRepository) {
        self.repository = repository
    }
    
    private func loadData() {
        do {
            exercises = try repository.fetchAll()
        } catch {
            print("Failed to fetch exercises: \(error)")
        }
    }
}
