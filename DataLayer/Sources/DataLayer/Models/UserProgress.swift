import SwiftData
import Foundation

@Model
public final class UserProgress {
    @Attribute(.unique) public var id: UUID
    public var date: Date
    public var weight: Decimal
    public var bodyFat: Decimal
    public var bodyMuscles: Decimal
    
    init(id: UUID, date: Date, weight: Decimal, bodyFat: Decimal, bodyMuscles: Decimal) {
        self.id = id
        self.date = date
        self.weight = weight
        self.bodyFat = bodyFat
        self.bodyMuscles = bodyMuscles
    }
}

