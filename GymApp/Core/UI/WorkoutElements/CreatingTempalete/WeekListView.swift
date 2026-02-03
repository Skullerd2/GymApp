import SwiftUI

struct WeekListView: View {
    let days: [WeekDayModel] = [
        WeekDayModel(name: "Пн", status: .selected),
        WeekDayModel(name: "Вт", status: .standard),
        WeekDayModel(name: "Ср", status: .active),
        WeekDayModel(name: "Чт", status: .standard),
        WeekDayModel(name: "Пт", status: .standard),
        WeekDayModel(name: "Сб", status: .standard),
        WeekDayModel(name: "Вс", status: .standard)
    ]
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(days) { day in
                WeekDayCell(day: day)
                    .frame(maxWidth: .infinity, maxHeight: .infinity) 
                    .aspectRatio(1, contentMode: .fit)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundStyle(day.status.backgroundColor)
                    )
            }
        }
    }
}

#Preview {
    WeekListView()
}
