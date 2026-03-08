import SwiftUI

public struct AppTextField: View {
    @Environment(\.appTheme) private var theme

    // MARK: - Config
    
    let placeholder: String
    @Binding var text: String
    var label: String? = nil
    var errorMessage: String? = nil
    var keyboardType: UIKeyboardType = .default
    var textContentType: UITextContentType? = nil
    var isSecure: Bool = false

    // MARK: - Internal State

    @State private var isSecureVisible: Bool = false
    @FocusState private var isFocused: Bool

    public init(
        _ placeholder: String,
        text: Binding<String>,
        label: String? = nil,
        errorMessage: String? = nil,
        keyboardType: UIKeyboardType = .default,
        textContentType: UITextContentType? = nil,
        isSecure: Bool = false
    ) {
        self.placeholder = placeholder
        self._text = text
        self.label = label
        self.errorMessage = errorMessage
        self.keyboardType = keyboardType
        self.textContentType = textContentType
        self.isSecure = isSecure
    }

    // MARK: - Computed
    private var borderColor: Color {
        if errorMessage != nil {
            return theme.colors.errorDefault
        }
        return isFocused ? theme.colors.brandPrimary : theme.colors.borderDefault
    }

    private var showingSecure: Bool {
        isSecure && !isSecureVisible
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: Spacing.xs) {

            // MARK: - Label
            if let label {
                Text(label)
                    .textStyle(.labelM)
                    .foregroundStyle(theme.colors.textSecondary)
            }

            // MARK: - Input
            ZStack(alignment: .leading) {
                // Placeholder
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundStyle(theme.colors.textTertiary)
                        .textStyle(.bodyM)
                        .padding(.horizontal, Spacing.md)
                }

                HStack(spacing: Spacing.xs) {
                    // Field
                    Group {
                        if showingSecure {
                            SecureField("", text: $text)
                        } else {
                            TextField("", text: $text)
                        }
                    }
                    .foregroundStyle(theme.colors.textPrimary)
                    .tint(theme.colors.brandPrimary)
                    .textStyle(.bodyM)
                    .keyboardType(keyboardType)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .focused($isFocused)
                    .if(textContentType != nil) {
                        $0.textContentType(textContentType!)
                    }

                    // Secure toggle
                    if isSecure {
                        Button {
                            isSecureVisible.toggle()
                        } label: {
                            Image(systemName: isSecureVisible ? "eye.slash" : "eye")
                                .foregroundStyle(theme.colors.textTertiary)
                                .frame(width: IconSize.md, height: IconSize.md)
                        }
                    }
                }
                .padding(.vertical, Spacing.md)
                .padding(.horizontal, Spacing.md)
            }
            .background(theme.colors.backgroundSunken)
            .clipShape(RoundedRectangle(cornerRadius: Radius.md))
            .overlay {
                RoundedRectangle(cornerRadius: Radius.md)
                    .strokeBorder(borderColor, lineWidth: isFocused ? 1.5 : 1)
                    .animation(.easeInOut(duration: 0.2), value: isFocused)
                    .animation(.easeInOut(duration: 0.2), value: errorMessage)
            }

            // MARK: - Error
            if let errorMessage {
                HStack(spacing: Spacing.xs) {
                    Image(systemName: "exclamationmark.circle.fill")
                        .foregroundStyle(theme.colors.errorDefault)
                        .frame(width: IconSize.sm, height: IconSize.sm)

                    Text(errorMessage)
                        .textStyle(.captionM)
                        .foregroundStyle(theme.colors.errorDefault)
                }
                .transition(.opacity.combined(with: .move(edge: .top)))
                .animation(.easeInOut(duration: 0.2), value: errorMessage)
            }
        }
    }
}

// MARK: - Conditional Modifier

extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition { transform(self) } else { self }
    }
}
