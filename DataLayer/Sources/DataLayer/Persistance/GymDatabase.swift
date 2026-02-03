import SwiftData
import Foundation

public protocol GymDatabaseProtocol{
    var container: ModelContainer {
        get
    }
    @MainActor var context: ModelContext {
        get
    }
}

public final class GymDatabase: GymDatabaseProtocol, @unchecked Sendable  {
    public var container: ModelContainer
    @MainActor
    public var context: ModelContext {
        container.mainContext
    }
    
    public init(isInMemory: Bool = false) {
        let schema = Schema([Exercise.self,
                             ExerciseSet.self,
                             ExerciseWorkoutTemplate.self,
                             UserProgress.self,
                             WorkoutSession.self,
                             WorkoutSummary.self,
                             WorkoutTemplate.self,
                             UserProfile.self])
        let config = ModelConfiguration(isStoredInMemoryOnly: isInMemory)
        
        do {
            container = try ModelContainer(for: schema, configurations: [config])
            Task { @MainActor in
                self.seedInitialDataForExercises()
                self.seedInintialUserData()
            }
        } catch {
            fatalError("Failed to initialize ModelContainer: \(error)")
        }
    }
}

extension GymDatabase {
    @MainActor
    public func seedInitialDataForExercises() {
        let descriptor = FetchDescriptor<Exercise>()
        guard let count = try? context.fetchCount(descriptor), count == 0 else {
            return
        }
        
        guard let url = Bundle.module.url(forResource: "RawContent", withExtension: "json") else {
            print("Couldn't find RawContent.json")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let dtos = try JSONDecoder().decode([ExerciseDTO].self, from: data)
            
            for dto in dtos {
                let exercise = Exercise(id: dto.id, name: dto.name, descript: dto.descript, muscleGroup: MuscleGroupEnum(rawValue: dto.muscleGroup) ?? .chest, imageRef: URL(string: dto.imageRef ?? ""))
                context.insert(exercise)
            }
            
            try context.save()
            print("Successfully seeded initial data")
        } catch {
            print("Failed to seed initial data: \(error)")
        }
    }
    
    @MainActor
    public func seedInintialUserData() {
        let descriptor = FetchDescriptor<UserProfile>()
        guard let count = try? context.fetchCount(descriptor), count == 0 else {
            return
        }
        
        var dateComponents = DateComponents()
        dateComponents.year = 2007
        dateComponents.month = 12
        dateComponents.day = 15
        let user = UserProfile(id: UUID(), name: "Илюша", gender: .male, height: 170, birthday: Calendar.current.date(from: dateComponents) ?? Date.now)
        context.insert(user)
        let progress = UserProgress(id: UUID(), date: .now, weight: 80500, bodyFat: 15.0, bodyMuscles: 45.0)
        context.insert(progress)
        do {
            try context.save()
        } catch {
            print("Failed to seed initial user data: \(error)")
        }
    }
}

extension GymDatabase {
    @MainActor
    public static var preview: GymDatabase {
        let db = GymDatabase(isInMemory: true)
        db.seedInitialDataForExercises()
        db.seedInintialUserData()
        return db
    }
}
