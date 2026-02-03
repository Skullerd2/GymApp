import SwiftUI

struct DashboardGrid: View {
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    let isDetailed: Bool
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            DashboardGraphCard(title: "Масса тела", value: "80.5", data: [
                .init(date: .now, value: 80),
                .init(date: .now.addingTimeInterval(86400), value: 40),
                .init(date: .now.addingTimeInterval(86400*2), value: 80.5),
                .init(date: .now.addingTimeInterval(86400*3), value: 82),
                .init(date: .now.addingTimeInterval(86400*4), value: 90)],
                               isDetailed: isDetailed)
            DashboardGraphCard(title: "Масса мышц", value: "80.5", data: [
                .init(date: .now, value: 80),
                .init(date: .now.addingTimeInterval(86400), value: 40),
                .init(date: .now.addingTimeInterval(86400*2), value: 80.5),
                .init(date: .now.addingTimeInterval(86400*3), value: 82),
                .init(date: .now.addingTimeInterval(86400*4), value: 90)],
                               isDetailed: isDetailed)
            DashboardGraphCard(title: "Масса жира", value: "80.5", data: [
                .init(date: .now, value: 80),
                .init(date: .now.addingTimeInterval(86400), value: 40),
                .init(date: .now.addingTimeInterval(86400*2), value: 80.5),
                .init(date: .now.addingTimeInterval(86400*3), value: 82),
                .init(date: .now.addingTimeInterval(86400*4), value: 90)],
                               isDetailed: isDetailed)
            DashboardGraphCard(title: "ИМТ", value: "80.5", data: [
                .init(date: .now, value: 80),
                .init(date: .now.addingTimeInterval(86400), value: 40),
                .init(date: .now.addingTimeInterval(86400*2), value: 80.5),
                .init(date: .now.addingTimeInterval(86400*3), value: 82),
                .init(date: .now.addingTimeInterval(86400*4), value: 90)],
                               isDetailed: isDetailed)
        }
    }
}
