import SwiftUI
import Kingfisher
struct DashboardWorkoutCard: View {
    let workoutImageURL: URL?
    let workoutName: String
    let dayOfWeek: String
    let isChill: Bool
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 16){
                    Text(workoutName)
                        .foregroundStyle(.white)
                        .font(.interFont(weight: .semibold, size: 32))
                    Text(dayOfWeek)
                        .foregroundStyle(.white)
                        .font(.interFont(weight: .medium, size: 18))
                    Spacer()
                }.padding(16)
                Spacer()
            }
            if !isChill {
                Button {
                    print(1)
                } label: {
                    Text("Начать")
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
                .buttonStyle(GeneralButtonStyle(fontSize: 24))
            }
        }
        .background(
            ZStack {
                if let imageURL = workoutImageURL {
                    KFImage(imageURL)
                        .resizable()
                        .scaledToFill()
                        .clipped()
                } else {
                    Color.white
                }
                LinearGradient(colors:
                                [Color.AppColors.mainColor,
                                 Color.AppColors.mainColor.opacity(0.5)],
                               startPoint: .leading,
                               endPoint: .trailing)
            }
        )
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

#Preview {
    DashboardWorkoutCard(workoutImageURL: URL(string: ""), workoutName: "День ног", dayOfWeek: "Пятница", isChill: false)
}
