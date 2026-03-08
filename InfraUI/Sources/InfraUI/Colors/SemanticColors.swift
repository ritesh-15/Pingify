import SwiftUI

// MARK: - Semantic Colors
// These are the ONLY colors features should reference.
// Each role has a light and dark variant — resolved by Theme.

public struct SemanticColors: Sendable {

    // MARK: - Primary / Brand
    public let brandPrimary: Color
    public let brandPrimaryHover: Color
    public let brandPrimarySubtle: Color
    public let brandOnPrimary: Color        // text/icon on top of brandPrimary

    // MARK: - Background & Surface
    public let backgroundBase: Color        // page/screen background
    public let backgroundSurface: Color     // cards, sheets
    public let backgroundElevated: Color    // modals, popovers
    public let backgroundSunken: Color      // inputs, wells

    // MARK: - Border
    public let borderDefault: Color
    public let borderSubtle: Color
    public let borderStrong: Color

    // MARK: - Text Hierarchy
    public let textPrimary: Color
    public let textSecondary: Color
    public let textTertiary: Color
    public let textDisabled: Color
    public let textInverse: Color           // text on dark surfaces

    // MARK: - Error
    public let errorDefault: Color
    public let errorSubtle: Color
    public let errorOnError: Color

    // MARK: - Success
    public let successDefault: Color
    public let successSubtle: Color
    public let successOnSuccess: Color

    // MARK: - Warning
    public let warningDefault: Color
    public let warningSubtle: Color
    public let warningOnWarning: Color
}

// MARK: - Light Theme Colors
extension SemanticColors {
    public static let light = SemanticColors(
        // Brand
        brandPrimary:       ColorPalette.Brand.primary500,
        brandPrimaryHover:  ColorPalette.Brand.primary600,
        brandPrimarySubtle: ColorPalette.Brand.primary100,
        brandOnPrimary:     ColorPalette.Neutral.n900,  // dark text on light green

        // Background
        backgroundBase:     ColorPalette.Neutral.n50,
        backgroundSurface:  ColorPalette.Neutral.n0,
        backgroundElevated: ColorPalette.Neutral.n0,
        backgroundSunken:   ColorPalette.Neutral.n100,

        // Border
        borderDefault:      ColorPalette.Neutral.n200,
        borderSubtle:       ColorPalette.Neutral.n100,
        borderStrong:       ColorPalette.Neutral.n400,

        // Text
        textPrimary:        ColorPalette.Neutral.n900,
        textSecondary:      ColorPalette.Neutral.n600,
        textTertiary:       ColorPalette.Neutral.n400,
        textDisabled:       ColorPalette.Neutral.n300,
        textInverse:        ColorPalette.Neutral.n0,

        // Error
        errorDefault:       ColorPalette.Error.main,
        errorSubtle:        ColorPalette.Error.light,
        errorOnError:       ColorPalette.Neutral.n0,

        // Success
        successDefault:     ColorPalette.Success.main,
        successSubtle:      ColorPalette.Success.light,
        successOnSuccess:   ColorPalette.Neutral.n0,

        // Warning
        warningDefault:     ColorPalette.Warning.main,
        warningSubtle:      ColorPalette.Warning.light,
        warningOnWarning:   ColorPalette.Neutral.n0
    )
}

// MARK: - Dark Theme Colors
extension SemanticColors {
    public static let dark = SemanticColors(
        // Brand
        brandPrimary:       ColorPalette.Brand.primary400,
        brandPrimaryHover:  ColorPalette.Brand.primary300,
        brandPrimarySubtle: ColorPalette.Brand.primary900,
        brandOnPrimary:     ColorPalette.Neutral.n900,  // dark text on light green

        // Background
        backgroundBase:     ColorPalette.Neutral.n950,
        backgroundSurface:  ColorPalette.Neutral.n900,
        backgroundElevated: ColorPalette.Neutral.n800,
        backgroundSunken:   Color(hex: "#0a0a0f"),

        // Border
        borderDefault:      ColorPalette.Neutral.n700,
        borderSubtle:       ColorPalette.Neutral.n800,
        borderStrong:       ColorPalette.Neutral.n500,

        // Text
        textPrimary:        ColorPalette.Neutral.n50,
        textSecondary:      ColorPalette.Neutral.n400,
        textTertiary:       ColorPalette.Neutral.n600,
        textDisabled:       ColorPalette.Neutral.n700,
        textInverse:        ColorPalette.Neutral.n950,

        // Error
        errorDefault:       ColorPalette.Error.main,
        errorSubtle:        Color(hex: "#2D1515"),
        errorOnError:       ColorPalette.Neutral.n0,

        // Success
        successDefault:     ColorPalette.Success.main,
        successSubtle:      Color(hex: "#0D2B20"),
        successOnSuccess:   ColorPalette.Neutral.n0,

        // Warning
        warningDefault:     ColorPalette.Warning.main,
        warningSubtle:      Color(hex: "#2B1F0A"),
        warningOnWarning:   ColorPalette.Neutral.n950
    )
}
