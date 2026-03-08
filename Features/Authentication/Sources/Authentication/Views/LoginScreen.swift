import SwiftUI
import Infra
import InfraUI

#if DEBUG
import PreviewKit
#endif

public struct LoginScreen: View {

    @Environment(AppRouter.self) var appRouter
    @Environment(\.appTheme) var theme

    @State private var viewModel = LoginScreenViewModel()

    public init () {

    }

    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: Spacing.xl) {
                Text("Log in to Pingify")
                    .textStyle(.headingXL)

                VStack(alignment: .leading, spacing: Spacing.lg) {
                    VStack(alignment: .leading, spacing: Spacing.xs) {
                        Text("Email")
                            .textStyle(.bodyL)

                        TextField(
                            "",
                            text: $viewModel.emailAddress,
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

                    VStack(alignment: .leading, spacing: Spacing.xs) {
                        Text("Password")
                            .textStyle(.bodyL)

                        SecureField(
                            "",
                            text: $viewModel.password,
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

                    Button("Forgot Password?") {

                    }
                    .foregroundStyle(theme.colors.brandPrimary)
                    .textStyle(.labelL)
                    .frame(alignment: .leading)

                    Button("Login") {
                        appRouter.navigate(to: .login)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, Spacing.lg)
                    .padding(.vertical, Spacing.lg)
                    .background(theme.colors.brandPrimary)
                    .foregroundStyle(theme.colors.textPrimary)
                    .clipShape(.buttonBorder)
                    .textStyle(.bodyL)

                    HStack(alignment: .center, spacing: Spacing.xs) {
                        Text("Don't have an account?")
                            .textStyle(.bodyS)

                        Button("Sign Up") {
                            appRouter.navigate(to: .register)
                        }
                        .foregroundStyle(theme.colors.brandPrimary)
                        .textStyle(.labelL)
                        .bold()
                    }
                    .frame(maxWidth: .infinity)
                }

                Spacer()

                Text(Constants.getAttributedString(theme))
                    .textStyle(.captionM)
                    .foregroundStyle(theme.colors.textSecondary)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, Spacing.xl)
            .containerRelativeFrame([.horizontal, .vertical])
        }
        .containerRelativeFrame(.horizontal)
        .background(theme.colors.backgroundBase)
    }
}

#if DEBUG
#Preview {
    PreviewContainer {
        LoginScreen()
    }
}
#endif

