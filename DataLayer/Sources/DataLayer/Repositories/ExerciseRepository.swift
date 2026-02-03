import SwiftData
import Foundation

@MainActor
public final class ExerciseRepository {
    
    private let context: ModelContext
    
    public init(context: ModelContext) {
        self.context = context
    }
    
    public func fetchAll() throws -> [Exercise] {
        let descriptor = FetchDescriptor<Exercise>(sortBy: [SortDescriptor(\.name)])
        return try context.fetch(descriptor)
    }
}
