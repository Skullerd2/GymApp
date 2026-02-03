import SwiftUI

struct GeneralButton: View {
    let fontSize: CGFloat
    let text: String
    let action: (() -> Void)
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(text)
                .font(.interFont(weight: .medium, size: fontSize))
                .foregroundStyle(.black.opacity(0.9))
        })
        .background(.white.opacity(0.9))
    }
}


#Preview {
    GeneralButton(fontSize: 24, text: "Begin") {
        print(1)
    }
}
