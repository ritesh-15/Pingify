import SwiftUI
import InfraUI

#if DEBUG
import PreviewKit
#endif

struct EmailInputScreen: View {

    @Environment(RegisterScreenViewModel.self) var viewModel
    @Environment(\.appTheme) var theme

    var body: some View {
        @Bindable var vm = viewModel

        VStack(alignment: .leading, spacing: Spacing.lg) {
            VStack(alignment: .leading, spacing: Spacing.xs) {
                Text("Email")
                    .textStyle(.bodyL)

                TextField(
                    "",
                    text: $vm.emailAddress,
                    prompt: Text("Enter email address")
                        .foregroundStyle(theme.colors.textTertiary)
                        .font(FontFamily.Poppins.light.size(14))
                )
                .padding(.vertical, Spacing.md)
                .padding(.horizontal, Spacing.sm)
                .overlay {
                    RoundedRectangle(cornerRadius: Radius.full)
                        .strokeBorder(theme.colors.borderDefault, lineWidth: 1)
                }
                .textFieldStyle(.plain)
                .tint(theme.colors.brandPrimary)
                .textStyle(.bodyL)
                .keyboardType(.emailAddress)
                .autocorrectionDisabled()
                .textContentType(.emailAddress)
                .textInputAutocapitalization(.never)
            }
        }
    }
}

#if DEBUG
#Preview {
    PreviewContainer {
        EmailInputScreen()
    }
}
#endif
