import SwiftUI

// MARK: - Theme Injection Modifier
// Automatically reads the system color scheme and injects the
// correct AppTheme into the environment.
//
// Usage: apply once at the root of your app.
//
//   WindowGroup {
//       ContentView()
//           .withAppTheme()
//   }

struct AppThemeModifier: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme

    func body(content: Content) -> some View {
        content
            .environment(\.appTheme, AppTheme(colorScheme: colorScheme))
    }
}

extension View {
    public func withAppTheme() -> some View {
        modifier(AppThemeModifier())
    }
}

// MARK: - Preview Helper
// Quickly preview a view in both light and dark themes.
//
// Usage in previews:
//   #Preview { MyView().previewThemes() }

extension View {
    public func previewThemes() -> some View {
        Group {
            self
                .withAppTheme()
                .preferredColorScheme(.light)
                .previewDisplayName("Light")

            self
                .withAppTheme()
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark")
        }
    }
}
