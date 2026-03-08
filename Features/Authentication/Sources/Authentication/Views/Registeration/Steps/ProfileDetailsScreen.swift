import SwiftUI
import InfraUI

#if DEBUG
import PreviewKit
#endif

struct ProfileDetailsScreen: View {

    @Environment(RegisterScreenViewModel.self) var viewModel
    @Environment(\.appTheme) var theme

    var body: some View {
        @Bindable var vm = viewModel

        VStack(alignment: .leading, spacing: Spacing.lg) {
            VStack(alignment: .leading, spacing: Spacing.xs) {
                Text("Display name")
                    .textStyle(.bodyL)

                TextField(
                    "",
                    text: $vm.displayName,
                    prompt: Text("What others will call you")
                        .foregroundStyle(theme.colors.textTertiary)
                        .font(FontFamily.Poppins.light.size(14))
                )
                .padding(.vertical, Spacing.md)
                .padding(.horizontal, Spacing.sm)
                .overlay {
                    RoundedRectangle(cornerRadius: Radius.full)
                        .strokeBorder(theme.colors.borderDefault, lineWidth: 1)
                }
                .textFieldStyle(.automatic)
                .tint(theme.colors.brandPrimary)
                .textStyle(.bodyL)
                .keyboardType(.default)
                .autocorrectionDisabled()
                .textContentType(.name)
                .textInputAutocapitalization(.never)
            }
        }
    }
}

#if DEBUG
#Preview {
    PreviewContainer {
        ProfileDetailsScreen()
    }
}
#endif


