import SwiftUI
import Infra
import InfraUI

#if DEBUG
import PreviewKit
#endif

public struct RegisterationCoordinator: View {

    @Environment(AppRouter.self) private var appRouter
    @Environment(\.appTheme) private var theme
    @State private var viewModel = RegisterScreenViewModel()

    public init() {}

    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: Spacing.xl) {
                StepProgressView(progress: viewModel.currentStep.progress)
                
                Text("\(viewModel.currentStep.title)")
                    .textStyle(.headingXL)

                Group {
                    switch viewModel.currentStep {
                    case .username: UsernameInputScreen()
                    case .email:    EmailInputScreen()
                    case .password: PasswordInputScreen()
                    case .profile:  ProfileDetailsScreen()
                    }
                }
                .id(viewModel.currentStep)
                .transition(
                    viewModel.navigationDirection == .forward
                    ? .asymmetric(
                        insertion: .move(edge: .trailing),
                        removal: .move(edge: .leading)
                    )
                    : .asymmetric(
                        insertion: .move(edge: .leading),
                        removal: .move(edge: .trailing)
                    )
                )

                VStack {
                    Button(viewModel.currentStep == .profile ? "Create an account" : "Continue") {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            viewModel.nextStep()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, Spacing.lg)
                    .padding(.vertical, Spacing.lg)
                    .background(
                        viewModel.isCurrentStepValid
                            ? theme.colors.brandPrimary
                            : theme.colors.borderDefault
                    )
                    .foregroundStyle(theme.colors.textPrimary)
                    .clipShape(.buttonBorder)
                    .disabled(!viewModel.isCurrentStepValid)
                    .textStyle(.bodyL)

                    if viewModel.currentStep == .username {
                        HStack(alignment: .center, spacing: Spacing.xs) {
                            Text("Already have an account?")
                                .textStyle(.bodyS)

                            Button("Sign In") {
                                appRouter.navigate(to: .register)
                            }
                            .foregroundStyle(theme.colors.brandPrimary)
                            .textStyle(.labelL)
                            .bold()
                        }
                        .frame(maxWidth: .infinity)
                    }

                    if viewModel.currentStep.rawValue > 0 {
                        Button("Previous") {
                            withAnimation(.easeInOut(duration: 0.25)) {
                                viewModel.previousStep()
                            }
                        }
                        .foregroundStyle(theme.colors.brandPrimary)
                        .textStyle(.labelL)
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
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
        .environment(viewModel)
        .containerRelativeFrame(.horizontal)
        .background(theme.colors.backgroundBase)
    }
}

#if DEBUG
#Preview {
    PreviewContainer {
        RegisterationCoordinator()
    }
}
#endif


