import Foundation

public struct ExerciseDTO: Decodable {
    let id: UUID
    let name: String
    let descript: String
    let muscleGroup: String
    let imageRef: String?
}
