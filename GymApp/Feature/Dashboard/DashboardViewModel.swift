import Foundation
import DataLayer
import Combine
import SwiftData
import Kingfisher

@MainActor
class DashboardViewModel: ObservableObject {
    
    @Published var amountOfWorkouts: Int = 0
    @Published var workouts: [WorkoutDisplayData] = []
    
    @Published var bmi: [ChartPoint] = []
    @Published var bodyFat: [ChartPoint] = []
    @Published var weight: [ChartPoint] = []
    @Published var muscleWeight: [ChartPoint] = []
    
    @Published var currentWeight: String = "—"
    @Published var currentFat: String = "—"
    @Published var currentMuscle: String = "—"
    @Published var currentBMI: String = "—"
    
    private let db: GymDatabase
    private let context: ModelContext
    
    init(database: GymDatabase) {
        self.db = database
        self.context = db.context
    }
    
    func loadData() {
        fetchUserData()
    }
    
    private func fetchUserData() {
        let progressDescriptor = FetchDescriptor<UserProgress>(sortBy: [SortDescriptor(\.date)])
        let userDescriptor = FetchDescriptor<UserProfile>()
        do {
            let history = try context.fetch(progressDescriptor)
            let users = try context.fetch(userDescriptor)
            
            guard let user = users.first else {
                print("User is not created yet")
                print(URL.applicationSupportDirectory.path(percentEncoded: false))
                return
            }
            
            let heightInMeters: Double = Double(user.height) / 100.0
            let heightSquared: Double = heightInMeters * heightInMeters
            
            if let last = history.last {
                currentWeight = String(format: "%.1f", Double(truncating: last.weight as NSNumber))
                currentFat =  String(format: "%.1f", Double(truncating: last.bodyFat as NSNumber))
                currentMuscle = String(format: "%.1f", Double(truncating: last.bodyMuscles as NSNumber))
                let weightInKg = Double(truncating: last.weight as NSNumber)
                let currentBMIValue = weightInKg / heightSquared
                currentBMI = String(format: "%.1f", currentBMIValue)
                
                weight = history.map { ChartPoint(date: $0.date, value: Double(truncating: $0.weight as NSNumber)) }
                bodyFat = history.map { ChartPoint(date: $0.date, value: Double(truncating: $0.bodyFat as NSNumber)) }
                muscleWeight = history.map { ChartPoint(date: $0.date, value: Double(truncating: $0.bodyMuscles as NSNumber)) }
                bmi = history.map { item in
                    let historicalWeight = Double(truncating: item.weight as NSNumber)
                    let historicalBMI = historicalWeight / heightSquared
                    return ChartPoint(date: item.date, value: historicalBMI)
                }
            }
            
            
        } catch {
            print("Failed to fetch user progress: \(error)")
        }
    }
    
    private func fetchWorkout() {
        let descriptor = FetchDescriptor<WorkoutTemplate>()
        let todayIndex = Calendar.current.component(.weekday, from: Date())
        let allTemplates = (try? context.fetch(descriptor)) ?? []
        
        let templatesForToday = allTemplates.filter { $0.weekDays.contains(todayIndex) }
        workouts = templatesForToday.map({ template in
            WorkoutDisplayData(id: template.id, name: template.name, day: "Сегодня", imageURL: template.imageRef)
        })
    }
    
    private func completedWorkoutSessions() {
        let descriptor = FetchDescriptor<WorkoutSession>()
        let amount = try? context.fetch(descriptor).filter { $0.status == .completed }.count
        
    }
}
