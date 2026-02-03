import SwiftUI

struct TabButtonStyle: ButtonStyle {
    let isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 24, height: 24)
            .foregroundStyle(Color(uiColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
            .opacity(isSelected ? 0.8 : 0.5)
            .background(
                ZStack{
                    RoundedRectangle(cornerRadius: 24)
                        .frame(width: 64, height: 48)
                        .foregroundStyle(Color.white)
                        .opacity(isSelected ? 0.8 : 0)
                }
            )
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}
