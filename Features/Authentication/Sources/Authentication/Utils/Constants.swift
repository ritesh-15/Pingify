import Foundation
import SwiftUI
import InfraUI

struct Constants {
    static func getAttributedString(_ theme: AppTheme) -> AttributedString {
        var string = AttributedString("By continuing, you agree to our Terms of Service and Privacy Policy.")

        if let range = string.range(of: "Terms of Service") {
            string[range].foregroundColor = UIColor(theme.colors.brandPrimary)
            string[range].link = URL(string: "https://pingify.com/terms")
        }

        if let range = string.range(of: "Privacy Policy") {
            string[range].foregroundColor = UIColor(theme.colors.brandPrimary)
            string[range].link = URL(string: "https://pingify.com/privacy")
        }

        return string
    }
}
