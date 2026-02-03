import SwiftData
import Foundation

@Model
public final class WorkoutSession {
    @Attribute(.unique) public var id: UUID
    public var startTime: Date
    public var endTime: Date?
    public var status: WorkoutSessionStatusEnum
    @Relationship(deleteRule: .cascade, inverse: \ExerciseSet.session)
    public var exerciseSet: [ExerciseSet] = []
    @Relationship(deleteRule: .cascade, inverse: \WorkoutSummary.session)
    public var workoutSummary: WorkoutSummary?
    public var workoutTemplate: WorkoutTemplate?
    
    init(id: UUID = UUID(), startTime: Date, endTime: Date? = nil, status: WorkoutSessionStatusEnum, exerciseSet: [ExerciseSet], workoutSummary: WorkoutSummary? = nil, workoutTemplate: WorkoutTemplate? = nil) {
        self.id = id
        self.startTime = startTime
        self.endTime = endTime
        self.status = status
        self.exerciseSet = exerciseSet
        self.workoutSummary = workoutSummary
        self.workoutTemplate = workoutTemplate
    }
}

