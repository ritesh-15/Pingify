import SwiftUI

// MARK: - Raw Color Palette
// These are raw values — never reference these directly in features.
// Always use SemanticColors instead.

enum ColorPalette {

    // MARK: - Brand
    // Base: #95C541 — yellow-green, energetic and fresh
    enum Brand {
        static let primary100 = Color(hex: "#F4FAE8") // lightest tint
        static let primary200 = Color(hex: "#E2F3C4")
        static let primary300 = Color(hex: "#C9E897")
        static let primary400 = Color(hex: "#AADB68")
        static let primary500 = Color(hex: "#95C541") // main brand
        static let primary600 = Color(hex: "#7AAD2F")
        static let primary700 = Color(hex: "#5E8E22")
        static let primary800 = Color(hex: "#456918")
        static let primary900 = Color(hex: "#2E4710") // darkest shade
    }

    // MARK: - Neutral
    enum Neutral {
        static let n0   = Color(hex: "#FFFFFF")
        static let n50  = Color(hex: "#F9FAFB")
        static let n100 = Color(hex: "#F3F4F6")
        static let n200 = Color(hex: "#E5E7EB")
        static let n300 = Color(hex: "#D1D5DB")
        static let n400 = Color(hex: "#9CA3AF")
        static let n500 = Color(hex: "#6B7280")
        static let n600 = Color(hex: "#4B5563")
        static let n700 = Color(hex: "#374151")
        static let n800 = Color(hex: "#1F2937")
        static let n900 = Color(hex: "#111827")
        static let n950 = Color(hex: "#030712")
    }

    // MARK: - Semantic States
    enum Success {
        static let light = Color(hex: "#D1FAE5")
        static let main  = Color(hex: "#10B981")
        static let dark  = Color(hex: "#065F46")
    }

    enum Error {
        static let light = Color(hex: "#FEE2E2")
        static let main  = Color(hex: "#EF4444")
        static let dark  = Color(hex: "#991B1B")
    }

    enum Warning {
        static let light = Color(hex: "#FEF3C7")
        static let main  = Color(hex: "#F59E0B")
        static let dark  = Color(hex: "#92400E")
    }
}

// MARK: - Hex Initializer
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b, a: UInt64
        switch hex.count {
        case 6:
            (r, g, b, a) = (int >> 16, int >> 8 & 0xFF, int & 0xFF, 255)
        case 8:
            (r, g, b, a) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b, a) = (0, 0, 0, 255)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
