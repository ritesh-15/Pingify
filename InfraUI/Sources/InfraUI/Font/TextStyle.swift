import SwiftUI

// MARK: - Text Style
// The canonical type scale for the app.
// Use these instead of raw Font values anywhere in features.

public enum TextStyle {

    // MARK: - Display

    /// 40pt / SemiBold — hero headlines, splash screens
    case displayLarge
    /// 32pt / SemiBold — section heroes
    case displayMedium
    /// 28pt / SemiBold
    case displaySmall

    // MARK: - Heading

    /// 24pt / SemiBold
    case headingXL
    /// 20pt / SemiBold
    case headingL
    /// 18pt / Medium
    case headingM
    /// 16pt / Medium
    case headingS
    /// 14pt / Medium
    case headingXS

    // MARK: - Body

    /// 16pt / Regular
    case bodyL
    /// 14pt / Regular
    case bodyM
    /// 12pt / Regular
    case bodyS

    // MARK: - Label

    /// 14pt / Medium — buttons, tabs
    case labelL
    /// 12pt / Medium
    case labelM
    /// 11pt / Medium
    case labelS

    // MARK: - Caption

    /// 12pt / Regular — helper text, timestamps
    case captionM
    /// 11pt / Regular
    case captionS

    // MARK: - Code / Mono (fallback to system mono if needed)

    /// 13pt / Regular
    case code
}

// MARK: - Font Resolution
extension TextStyle {
    public var font: Font {
        switch self {
        // Display
        case .displayLarge:   return FontFamily.Poppins.semiBold.size(40)
        case .displayMedium:  return FontFamily.Poppins.semiBold.size(32)
        case .displaySmall:   return FontFamily.Poppins.semiBold.size(28)

        // Heading
        case .headingXL:      return FontFamily.Poppins.semiBold.size(24)
        case .headingL:       return FontFamily.Poppins.semiBold.size(20)
        case .headingM:       return FontFamily.Poppins.medium.size(18)
        case .headingS:       return FontFamily.Poppins.medium.size(16)
        case .headingXS:      return FontFamily.Poppins.medium.size(14)

        // Body
        case .bodyL:          return FontFamily.Poppins.regular.size(16)
        case .bodyM:          return FontFamily.Poppins.regular.size(14)
        case .bodyS:          return FontFamily.Poppins.regular.size(12)

        // Label
        case .labelL:         return FontFamily.Poppins.medium.size(14)
        case .labelM:         return FontFamily.Poppins.medium.size(12)
        case .labelS:         return FontFamily.Poppins.medium.size(11)

        // Caption
        case .captionM:       return FontFamily.Poppins.regular.size(12)
        case .captionS:       return FontFamily.Poppins.regular.size(11)

        // Code
        case .code:           return .system(size: 13, design: .monospaced)
        }
    }

    /// Recommended line spacing for each style
    public var lineSpacing: CGFloat {
        switch self {
        case .displayLarge:   return 4
        case .displayMedium:  return 4
        case .displaySmall:   return 4
        case .headingXL:      return 4
        case .headingL:       return 4
        case .headingM:       return 3
        case .headingS:       return 3
        case .headingXS:      return 2
        case .bodyL:          return 6
        case .bodyM:          return 5
        case .bodyS:          return 4
        case .labelL:         return 3
        case .labelM:         return 2
        case .labelS:         return 2
        case .captionM:       return 2
        case .captionS:       return 1
        case .code:           return 4
        }
    }
}

// MARK: - View Modifier
public struct TextStyleModifier: ViewModifier {
    let style: TextStyle

    public func body(content: Content) -> some View {
        content
            .font(style.font)
            .lineSpacing(style.lineSpacing)
    }
}

extension View {
    public func textStyle(_ style: TextStyle) -> some View {
        modifier(TextStyleModifier(style: style))
    }
}
