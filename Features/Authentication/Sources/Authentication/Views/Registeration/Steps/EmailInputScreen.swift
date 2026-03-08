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
            AppTextField(
                "hello@example.com",
                text: $vm.emailAddress,
                label: "Email",
                errorMessage: !vm.emailAddress.isEmpty && !vm.isEmailValid
                    ? "Please enter a valid email address"
                    : nil,
                keyboardType: .emailAddress,
                textContentType: .emailAddress
            )
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
