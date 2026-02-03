import SwiftData
import Foundation

@Model
public final class UserProfile {
    @Attribute(.unique) public var id: UUID
    public var name: String
    public var gender: UserGenderEnum
    public var height: Int
    public var birthday: Date
    
    public init(id: UUID, name: String, gender: UserGenderEnum, height: Int, birthday: Date) {
        self.id = id
        self.name = name
        self.gender = gender
        self.height = height
        self.birthday = birthday
    }
}
