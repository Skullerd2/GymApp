import SwiftData
import Foundation

@Model
public final class WorkoutSummary {
    @Attribute(.unique) public var id: UUID
    public var duration: Int
    public var score: Int
    public var session: WorkoutSession?
    
    public init(id: UUID = UUID(), duration: Int, score: Int, session: WorkoutSession? = nil) {
        self.id = id
        self.duration = duration
        self.score = score
        self.session = session
    }
}

