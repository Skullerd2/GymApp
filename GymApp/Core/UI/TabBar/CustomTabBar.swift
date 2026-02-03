import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: AppTabEnum
    var body: some View {
        HStack {
            ForEach(AppTabEnum.allCases) { tab in
                Button {
                    withAnimation(.easeInOut(duration: 0.1)) {
                        selectedTab = tab
                    }
                } label: {
                    Image(systemName: tab.icon)
                        .resizable()
                        .scaledToFit()
                }
                .buttonStyle(TabButtonStyle(isSelected: selectedTab == tab))
                .padding(.leading, tab.id == 0 ? 30 : 0)
                .padding(.trailing, tab.id == AppTabEnum.allCases.count - 1 ? 30 : 0)
                if tab.id != AppTabEnum.allCases.count - 1 {
                    Spacer()
                }
            }
        }
        .frame(height: 60)
        .background(
            Color.AppColors.mainColor.opacity(0.9)
                .blur(radius: 3)
        )
        .shadow(color: Color.AppColors.whiteGraphColor, radius: 10)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(AppTabEnum.coach))
}
