import CoreFoundation

// MARK: - Spacing Scale
// Use these constants instead of raw CGFloat values for all padding,
// margins, gaps, and layout spacing throughout the app.

public enum Spacing {
    /// 2pt
    public static let xxs: CGFloat = 2
    /// 4pt
    public static let xs: CGFloat  = 4
    /// 8pt
    public static let sm: CGFloat  = 8
    /// 12pt
    public static let md: CGFloat  = 12
    /// 16pt
    public static let lg: CGFloat  = 16
    /// 20pt
    public static let xl: CGFloat  = 20
    /// 24pt
    public static let xxl: CGFloat = 24
    /// 32pt
    public static let xxxl: CGFloat = 32
    /// 40pt
    public static let xxxxl: CGFloat = 40
    /// 48pt
    public static let huge: CGFloat  = 48
    /// 64pt
    public static let giant: CGFloat = 64
}

// MARK: - Border Radius Scale

public enum Radius {
    /// 4pt
    public static let xs: CGFloat   = 4
    /// 8pt
    public static let sm: CGFloat   = 8
    /// 12pt
    public static let md: CGFloat   = 12
    /// 16pt
    public static let lg: CGFloat   = 16
    /// 24pt
    public static let xl: CGFloat   = 24
    /// 9999pt — pill shape
    public static let full: CGFloat = 9999
}

// MARK: - Icon Size Scale

public enum IconSize {
    /// 16pt
    public static let sm: CGFloat   = 16
    /// 20pt
    public static let md: CGFloat   = 20
    /// 24pt
    public static let lg: CGFloat   = 24
    /// 32pt
    public static let xl: CGFloat   = 32
    /// 48pt
    public static let xxl: CGFloat  = 48
}
