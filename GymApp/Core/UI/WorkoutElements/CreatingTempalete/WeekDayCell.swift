import SwiftUI

struct WeekDayCell: View {
    let day: WeekDayModel
    var body: some View {
        Text(day.name)
            .foregroundStyle(day.status.textColor)
            .font(.interFont(weight: .medium, size: 18))
    }
}

#Preview {
    WeekDayCell(day: WeekDayModel(name: "Пн", status: .active))
        .frame(width: 50, height: 50)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(Color.AppColors.whiteGraphColor)
        )
}
