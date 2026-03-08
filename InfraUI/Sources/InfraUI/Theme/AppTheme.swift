import SwiftUI

// MARK: - App Theme
// The single source of truth for the current visual theme.
// Access via @Environment(\.appTheme) in any view.

public struct AppTheme: Sendable {
    public let colors: SemanticColors
    public let colorScheme: ColorScheme

    public init(colorScheme: ColorScheme) {
        self.colorScheme = colorScheme
        self.colors = colorScheme == .dark ? .dark : .light
    }
}

// MARK: - Convenience
extension AppTheme {
    public var isDark: Bool { colorScheme == .dark }
}
