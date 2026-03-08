import SwiftUI
import Infra
import InfraUI

#if DEBUG
import PreviewKit
#endif

public struct LandingScreen: View {

    @Environment(AppRouter.self) private var appRouter
    @Environment(\.appTheme) private var theme

    public init() {}
    
    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: Spacing.xl) {
                VStack(alignment: .center, spacing: Spacing.md) {
                    Image("welcome")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .containerRelativeFrame(.horizontal) { length, _ in
                            return length * 0.7
                        }

                    Text("Pingify")
                        .font(FontFamily.Poppins.extraBold.fixedSize(23))

                    Text("Chat with your faviourite people!")
                }

                Spacer()

                VStack(spacing: Spacing.lg) {
                    Button("Getting started") {
                        appRouter.navigate(to: .login)
                    }
                    .containerRelativeFrame(.horizontal) { length, _ in
                        return length * 0.7
                    }
                    .padding(.horizontal, Spacing.lg)
                    .padding(.vertical, Spacing.lg)
                    .background(theme.colors.brandPrimary)
                    .foregroundStyle(theme.colors.textPrimary)
                    .clipShape(.buttonBorder)
                    .textStyle(.bodyL)

                    Button("Login") {
                        appRouter.navigate(to: .login)
                    }
                    .containerRelativeFrame(.horizontal) { length, _ in
                        return length * 0.7
                    }
                    .padding(.horizontal, Spacing.lg)
                    .padding(.vertical, Spacing.lg)
                    .background(theme.colors.backgroundSurface)
                    .foregroundStyle(theme.colors.textPrimary)
                    .clipShape(.buttonBorder)
                    .shadow(radius: 2)
                    .textStyle(.bodyL)

                    HStack(alignment: .center, spacing: Spacing.xs) {
                        Text("New around here?")
                            .textStyle(.bodyS)

                        Button("Sign Up") {
                            appRouter.navigate(to: .register)
                        }
                        .foregroundStyle(theme.colors.brandPrimary)
                        .textStyle(.labelL)
                        .bold()
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, Spacing.xl)
            .containerRelativeFrame([.horizontal, .vertical])
        }
        .padding(.horizontal, Spacing.xl)
        .containerRelativeFrame(.horizontal)
        .background(theme.colors.backgroundBase)
    }
}

#if DEBUG
#Preview {
    PreviewContainer {
        LandingScreen()
    }
}
#endif
