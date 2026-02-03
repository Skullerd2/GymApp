import Foundation
import UIKit

struct WorkoutDisplayData: Identifiable {
    let id: UUID
    let name: String
    let day: String
    let imageURL: URL?
}
