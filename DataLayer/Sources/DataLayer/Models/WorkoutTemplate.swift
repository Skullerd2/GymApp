import SwiftData
import Foundation

@Model
public final class WorkoutTemplate {
    @Attribute(.unique) public var id: UUID
    public var name: String
    public var imageRef: URL?
    @Relationship(deleteRule: .nullify, inverse: \WorkoutSession.workoutTemplate)
    public var sessions: [WorkoutSession] = []
    @Relationship(deleteRule: .cascade, inverse: \ExerciseWorkoutTemplate.template)
    public var exerciseWorkoutTemp: [ExerciseWorkoutTemplate] = []
    public var weekDays: [Int] = [] 
    
    public init(id: UUID = UUID(), name: String, imageRef: URL? = nil, sessions: [WorkoutSession], exerciseWorkoutTemp: [ExerciseWorkoutTemplate]) {
        self.id = id
        self.name = name
        self.imageRef = imageRef
        self.sessions = sessions
        self.exerciseWorkoutTemp = exerciseWorkoutTemp
    }
}

