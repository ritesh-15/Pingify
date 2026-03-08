import SwiftUI
import Infra
import InfraUI

#if DEBUG
import PreviewKit
#endif

public struct UsernameInputScreen: View {

    @Environment(AppRouter.self) var appRouter
    @Environment(RegisterScreenViewModel.self) var viewModel
    @Environment(\.appTheme) var theme

    init() {}

    public var body: some View {
        @Bindable var vm = viewModel

        VStack(alignment: .leading, spacing: Spacing.lg) {
            VStack(alignment: .leading, spacing: Spacing.xs) {
                Text("Username")
                    .textStyle(.bodyL)

                TextField(
                    "",
                    text: $vm.emailAddress,
                    prompt: Text("Enter unique username")
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
                .textContentType(.username)
                .textInputAutocapitalization(.never)
            }
        }
    }
}

#if DEBUG
#Preview {
    PreviewContainer {
        UsernameInputScreen()
    }
}
#endif
