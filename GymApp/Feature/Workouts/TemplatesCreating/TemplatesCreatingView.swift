import SwiftUI

struct TemplatesCreatingView: View {
    @ObservedObject var viewModel: TemplatesCreatingViewModel
    
    var body: some View {
        GeometryReader { geometry in
            GeneralBackground(title: "Create Template"){
                NavigationTopButton(title: "Save") {
                    print(1)
                }
            } content: {
                VStack {
                    HStack {
                        Text("Days")
                            .font(.interFont(weight: .semibold, size: 24))
                        Spacer()
                    }.padding()
                    WeekListView()
                        .padding(.horizontal, 8)
                    HStack {
                        Text("Exercises")
                            .font(.interFont(weight: .semibold, size: 24))
                        Spacer()
                        addExerciseButton(size: calculateCellSize(width: geometry.size.width))
                    }.padding()
                    VStack {
                        if viewModel.exercises.isEmpty {
                            Spacer()
                            Text("There is no exercises \nin this day yet")
                                .font(.interFont(weight: .medium, size: 24))
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 120)
                        }
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
    }
    
    @ViewBuilder
    private func addExerciseButton(size: CGFloat) -> some View {
        Button {
            print(1)
        } label: {
            Text("+")
                .foregroundStyle(.black)
                .frame(width: size, height: size)
                .font(Font.interFont(weight: .medium, size: 24))
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(Color.AppColors.whiteGraphColor)
                )
        }
        
    }
    
    private func calculateCellSize(width: CGFloat) -> CGFloat {
        let totalHorizontalPadding: CGFloat = 64
        
        let spacingBetweenCells: CGFloat = 8
        let numberOfSpacings: CGFloat = 6
        let totalSpacing = spacingBetweenCells * numberOfSpacings
        
        let availableWidth = width - totalHorizontalPadding - totalSpacing
        return availableWidth / 7
    }
}

#Preview {
    TemplatesCreatingView(viewModel: TemplatesCreatingViewModel())
}
