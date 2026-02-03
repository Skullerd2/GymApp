import Testing
import SwiftData
import Foundation
@testable import DataLayer

@Suite("Core Data Base testing")
@MainActor
struct GymDatabaseTests {
    
    private let db: GymDatabase
    private let repository: ExerciseRepository
    
    init() async throws {
        self.db = GymDatabase(isInMemory: true)
        self.repository = ExerciseRepository(context: db.context)
    }
    
    @Test func seedInitialData() async throws {
        let url = try #require(Bundle.module.url(forResource: "RawContent", withExtension: "json"),
                           "Файл RawContent.json не найден в ресурсах пакета")
        let data = try Data(contentsOf: url)
        let dtos = try JSONDecoder().decode([ExerciseDTO].self, from: data)
        db.seedInitialData()
        let result = try repository.fetchAll()
        #expect(result.count == dtos.count)
        for dto in dtos {
            let exists = result.contains(where: { $0.name == dto.name })
            #expect(exists, "Упражнение '\(dto.name)' должно присутствовать в базе")
        }
    }
}
