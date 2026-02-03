import SwiftUI

struct DashboardGraphCard: View {
    let title: String
    let value: String
    let data: [ChartPoint]
    let isDetailed: Bool
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .font(.interFont(weight: .semibold, size: isDetailed ? 32 : 24))
                    Text(value)
                        .font(.interFont(weight: .medium, size: isDetailed ? 24 : 18))
                }
                Spacer()
            }
            MiniChartView(data: data, color: Color.AppColors.mainColor, isDetailed: false)
        }
        .padding(16)
        .background(
            Color.AppColors.whiteGraphColor
        )
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

#Preview {
    DashboardGraphCard(title: "Вес тела", value: "80.5", data: [
        .init(date: .now, value: 80),
        .init(date: .now.addingTimeInterval(86400), value: 40),
        .init(date: .now.addingTimeInterval(86400*2), value: 80.5),
        .init(date: .now.addingTimeInterval(86400*3), value: 82),
        .init(date: .now.addingTimeInterval(86400*4), value: 90)], isDetailed: false)
}
