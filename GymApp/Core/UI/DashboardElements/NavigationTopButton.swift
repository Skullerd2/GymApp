import SwiftUI

struct NavigationTopButton: View {
    let title: String
    var imageName: String? = nil
    let action: (() -> Void)
    var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack(spacing: 6) {
                if let imageName = imageName {
                    Image(systemName: imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                Text("\(title)")
                    .font(.interFont(weight: .semibold, size: 22))
                    
            }
            .foregroundStyle(Color.black.opacity(0.8))
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
        })
        .background(
            Color.white.opacity(0.8)
        )
        .frame(height: 36)
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

#Preview {
    NavigationTopButton(title: "0") {
        print(1)
    }
}
