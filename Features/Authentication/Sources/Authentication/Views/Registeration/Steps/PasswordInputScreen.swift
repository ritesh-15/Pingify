import SwiftUI
import Infra
import InfraUI

#if DEBUG
import PreviewKit
#endif

struct PasswordInputScreen: View {

    @Environment(AppRouter.self) var appRouter
    @Environment(RegisterScreenViewModel.self) var viewModel
    @Environment(\.appTheme) var theme

    var body: some View {
        @Bindable var vm = viewModel

        VStack(alignment: .leading, spacing: Spacing.lg) {
            VStack(alignment: .leading, spacing: Spacing.xs) {
                Text("Password")
                    .textStyle(.bodyL)

                SecureField(
                    "",
                    text: $vm.password,
                    prompt: Text("********")
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
                .textContentType(.password)
                .textInputAutocapitalization(.never)
            }

            VStack(alignment: .leading, spacing: Spacing.xs) {
                Text("Confirm Password")
                    .textStyle(.bodyL)

                SecureField(
                    "",
                    text: $vm.password,
                    prompt: Text("********")
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
                .textContentType(.password)
                .textInputAutocapitalization(.never)
            }
        }
    }
}

#if DEBUG
#Preview {
    PreviewContainer {
        PasswordInputScreen()
            .environment(RegisterScreenViewModel())
    }
}
#endif

