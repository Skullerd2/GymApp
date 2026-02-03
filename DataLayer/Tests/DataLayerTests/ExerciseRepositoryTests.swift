import Testing
import SwiftData
import Foundation
@testable import DataLayer

@Suite("Exercise Repository Tests")
@MainActor
struct ExerciseRepositoryTests {
    
    private let db: GymDatabase
    private let repository: ExerciseRepository
    
    init() async throws {
        self.db = GymDatabase(isInMemory: true)
        self.repository = ExerciseRepository(context: db.context)
    }
    
    @Test func fetchAllExercises() async throws {
        let exercises: Exercise = Exercise(name: "Жим", descript: "...", muscleGroup: .chest)
        db.context.insert(exercises)
        try db.context.save()
        let results = try repository.fetchAll()
        
        #expect(results.count == 1)
        #expect(results.first?.name == "Жим")
    }
}
