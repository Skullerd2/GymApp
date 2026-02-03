import SwiftUI
import Charts

struct MiniChartView: View {
    let data: [ChartPoint]
    let color: Color
    let isDetailed: Bool
    var body: some View {
        Chart {
            ForEach(data) { point in
                LineMark(x: .value("Month", point.date), y: .value("Weight", point.value))
                    .foregroundStyle(color)
                    .lineStyle(StrokeStyle(lineWidth: isDetailed ? 3 : 2))
                AreaMark(x: .value("Month", point.date), y: .value("Weight", point.value))
                    .foregroundStyle(color.opacity(0.3))
            }
        }
        .chartXAxis(isDetailed ? .visible : .hidden)
        .chartYAxis(isDetailed ? .visible : .hidden)

        
    }
}

#Preview {
    MiniChartView(
        data: [
            .init(date: .now, value: 80),
            .init(date: .now.addingTimeInterval(86400), value: 40),
            .init(date: .now.addingTimeInterval(86400*2), value: 80.5),
            .init(date: .now.addingTimeInterval(86400*3), value: 82),
            .init(date: .now.addingTimeInterval(86400*4), value: 90)        ],
        color: Color.AppColors.mainColor, isDetailed: false
    )
    .frame(height: 200)
    .padding()
}
