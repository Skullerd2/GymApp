import SwiftUI

struct CreateTemplateMainView: View {
    let imageSize: CGFloat
    var body: some View {
        VStack {
            Image(.listMascot)
                .resizable()
                .frame(width: imageSize, height: imageSize)
            Text("No templates yet")
                .font(.interFont(weight: .medium, size: 24))
            Button {
                print(1)
            } label: {
                Text("Create")
                    .padding(.horizontal, 32)
                    .padding(.vertical, 8)
                    .shadow(color: .black, radius: 60, x: 2, y: 2)
            }
            .buttonStyle(GeneralButtonStyle(fontSize: 24, backgroundColor: Color.AppColors.mainColor, textColor: Color(uiColor: #colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 1))))
        }
    }
}

#Preview {
    CreateTemplateMainView(imageSize: 240)
}
