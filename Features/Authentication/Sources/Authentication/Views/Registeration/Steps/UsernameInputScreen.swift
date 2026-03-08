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
            AppTextField(
                "Enter username",
                text: $vm.username,
                label: "Username",
                errorMessage: !vm.username.isEmpty && !vm.isUsernameValid
                    ? "Please enter a valid username"
                    : nil,
                keyboardType: .default,
                textContentType: .username
            )
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
