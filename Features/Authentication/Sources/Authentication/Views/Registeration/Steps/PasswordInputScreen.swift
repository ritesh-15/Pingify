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
            AppTextField(
                "Min. 8 characters",
                text: $vm.password,
                label: "Password",
                textContentType: .newPassword,
                isSecure: true
            )

            AppTextField(
                "Repeat your password",
                text: $vm.confirmPassword,
                label: "Confirm Password",
                errorMessage: !vm.confirmPassword.isEmpty && vm.password != vm.confirmPassword
                    ? "Passwords do not match"
                    : nil,
                textContentType: .newPassword,
                isSecure: true,
            )
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

