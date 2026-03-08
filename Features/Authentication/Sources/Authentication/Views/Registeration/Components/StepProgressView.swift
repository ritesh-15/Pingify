import SwiftUI
import InfraUI

struct StepProgressView: View {
    @Environment(\.appTheme) private var theme
    let progress: Double

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: Radius.full)
                    .fill(theme.colors.borderDefault)
                    .frame(height: 4)

                RoundedRectangle(cornerRadius: Radius.full)
                    .fill(theme.colors.brandPrimary)
                    .frame(width: geo.size.width * progress, height: 4)
                    .animation(.spring, value: progress)
            }
        }
        .frame(height: 4)
    }
}
