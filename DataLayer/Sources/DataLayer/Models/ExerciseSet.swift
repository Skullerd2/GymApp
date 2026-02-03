import SwiftData
import Foundation

@Model
public final class ExerciseSet {
    @Attribute(.unique) public var id: UUID
    public var weight: Int
    public var reps: Int
    public var isCompleted: Bool
    public var rest: Int
    public var type: SetType
    public var session: WorkoutSession?
    public var exercise: Exercise?
    
    public init(id: UUID = UUID(), weight: Int, reps: Int, isCompleted: Bool, rest: Int, type: SetType, session: WorkoutSession? = nil, exersise: Exercise? = nil) {
        self.id = id
        self.weight = weight
        self.reps = reps
        self.isCompleted = isCompleted
        self.rest = rest
        self.type = type
        self.session = session
        self.exercise = exersise
    }
}

