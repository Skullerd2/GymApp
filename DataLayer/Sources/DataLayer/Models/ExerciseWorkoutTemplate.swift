
import SwiftData
import Foundation

@Model
public final class ExerciseWorkoutTemplate {
    @Attribute(.unique) public var id: UUID
    public var exercise: Exercise?
    public var template: WorkoutTemplate?
    public var order: Int
    
    init(id: UUID = UUID(), exercise: Exercise? = nil, template: WorkoutTemplate? = nil, order: Int) {
        self.id = id
        self.exercise = exercise
        self.template = template
        self.order = order
    }
}

