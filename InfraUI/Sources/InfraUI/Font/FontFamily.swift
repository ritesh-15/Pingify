import SwiftUI
import CoreText

// MARK: - Font Family
// Defines all Poppins weights used in the app.
// Call FontFamily.registerFonts() once at app startup.

public enum FontFamily {

    public enum Poppins: String, CaseIterable {
        case thin         = "Poppins-Thin"
        case extraLight   = "Poppins-ExtraLight"
        case light        = "Poppins-Light"
        case regular      = "Poppins-Regular"
        case medium       = "Poppins-Medium"
        case semiBold     = "Poppins-SemiBold"
        case bold         = "Poppins-Bold"
        case extraBold    = "Poppins-ExtraBold"
        case black        = "Poppins-Black"

        // Italics
        case thinItalic       = "Poppins-ThinItalic"
        case lightItalic      = "Poppins-LightItalic"
        case regularItalic    = "Poppins-Italic"
        case mediumItalic     = "Poppins-MediumItalic"
        case semiBoldItalic   = "Poppins-SemiBoldItalic"
        case boldItalic       = "Poppins-BoldItalic"

        public func size(_ size: CGFloat) -> Font {
            .custom(rawValue, size: size)
        }

        public func fixedSize(_ size: CGFloat) -> Font {
            .custom(rawValue, fixedSize: size)
        }
    }

    // MARK: - Registration
    // Call once in your @main App init or AppDelegate
    public static func registerFonts() {
        Poppins.allCases.forEach { register(fontName: $0.rawValue) }
    }

    private static func register(fontName: String) {
        guard
            let url = Bundle.module.url(forResource: fontName, withExtension: "ttf"),
            let fontDataProvider = CGDataProvider(url: url as CFURL),
            let font = CGFont(fontDataProvider)
        else {
            // Font file not found — check the file is added to the bundle
            assertionFailure("⚠️ InfraUI: Could not load font '\(fontName).ttf'. Make sure it's included in the InfraUI bundle resources.")
            return
        }

        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            // Font may already be registered — safe to ignore in most cases
            print("⚠️ InfraUI: Font '\(fontName)' may already be registered: \(String(describing: error))")
        }
    }
}
