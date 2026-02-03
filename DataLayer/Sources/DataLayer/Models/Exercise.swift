import SwiftData
import Foundation

@Model
public final class Exercise {
    @Attribute(.unique) public var id: UUID
    public var name: String
    public var descript: String
    public var muscleGroup: MuscleGroupEnum
    public var imageRef: URL?
    @Relationship(deleteRule: .cascade, inverse: \ExerciseSet.exercise)
    public var exerciseSet: [ExerciseSet] = []
    
    public init(id: UUID = UUID(), name: String, descript: String, muscleGroup: MuscleGroupEnum, imageRef: URL? = nil) {
        self.id = id
        self.name = name
        self.descript = descript
        self.muscleGroup = muscleGroup
        self.imageRef = imageRef
    }
}
