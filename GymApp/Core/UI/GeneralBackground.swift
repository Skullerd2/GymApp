import SwiftUI

struct GeneralBackground<Content: View, HeaderItem: View>: View {
    let title: String
    let navigationButton: HeaderItem
    let content: Content
    init(title: String, @ViewBuilder navigationButton: () -> HeaderItem, @ViewBuilder content: () -> Content) {
        self.title = title
        self.navigationButton = navigationButton()
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ScrollView(showsIndicators: false) {
                    VStack {
                        HStack(alignment: .top) {
                            Text(title)
                                .font(.interFont(weight: .semibold, size: 32))
                                .foregroundStyle(Color.white)
                                .shadow(color: .black, radius: 60, x: 4, y: 4)
                            Spacer()
                            navigationButton
                                .padding(.trailing, 16)
                        }
                        .padding(.top, 32)
                        .padding(.leading, 16)
                        VStack(spacing: 16) {
                            content
                        }
                        .padding(.top, 16)
                        .padding(.horizontal, 8)
                        .frame(maxWidth: geometry.size.width)
                        .background(.white)
                        .clipShape(
                            .rect(
                                topLeadingRadius: 30,
                                bottomLeadingRadius: 0,
                                bottomTrailingRadius: 0,
                                topTrailingRadius: 30
                            )
                        )
                    }.frame(minHeight: geometry.size.height)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.AppColors.mainColor.opacity(0.8))
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

extension GeneralBackground where HeaderItem == EmptyView {
    init (title: String, @ViewBuilder content: () -> Content) {
        self.init(
            title: title,
            navigationButton: { EmptyView() },
            content: content
        )
    }
}

#Preview {
    var navigationButton: NavigationTopButton {
        NavigationTopButton(title: String(2), imageName: "figure.walk.treadmill.circle.fill") {
            print(1)
        }
    }
    GeneralBackground(title: "Title") {
        Text("121")
    } content: {
        VStack(spacing: 16) {
            Spacer()
            CreateTemplateMainView(imageSize: 280 / 2)
                .padding(.bottom, 120)
            Spacer()
        }
    }
}
