import SwiftUI

struct GeneralButtonStyle: ButtonStyle {
    let fontSize: CGFloat
    let backgroundColor: Color
    let textColor: Color
    init(fontSize: CGFloat, backgroundColor: Color = .white, textColor: Color = .black.opacity(0.8)) {
        self.fontSize = fontSize
        self.backgroundColor = backgroundColor
        self.textColor = textColor
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.interFont(weight: .semibold, size: fontSize))
            .foregroundStyle(textColor)
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .foregroundStyle(backgroundColor)
                    .opacity(0.8)
            )
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}
