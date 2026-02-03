
public enum SetType: String, Codable, CaseIterable {
    case warmup = "Warm-up"
    case normal = "Normal"
    case failure = "Failure"
    case dropSet = "Drop Set"
}
