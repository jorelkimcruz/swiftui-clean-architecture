import SwiftUI

public protocol Theme {
    // Colors
    var primary: Color { get }
    var secondary: Color { get }
    var background: Color { get }
    var surface: Color { get }
    var error: Color { get }
    var text: ThemeText { get }

    // Typography
    var typography: ThemeTypography { get }

    // Spacing
    var spacing: ThemeSpacing { get }
}

public struct ThemeText {
    public let primary: Color
    public let secondary: Color
    public let disabled: Color

    public init(
        primary: Color,
        secondary: Color,
        disabled: Color
    ) {
        self.primary = primary
        self.secondary = secondary
        self.disabled = disabled
    }
}

public struct ThemeTypography {
    public let px102: Font
    public let px37: Font
    public let px24: Font
    public let px21: Font
    public let px18: Font

    public init(
        px102: Font = .system(size: 102),
        px37: Font = .system(size: 37),
        px24: Font = .system(size: 24),
        px21: Font = .system(size: 21),
        px18: Font = .system(size: 18)
    ) {
        self.px102 = px102
        self.px37 = px37
        self.px24 = px24
        self.px21 = px21
        self.px18 = px18
    }
}

public struct ThemeSpacing {
    public let px2: CGFloat
    public let px4: CGFloat
    public let px8: CGFloat
    public let px12: CGFloat
    public let px16: CGFloat
    public let px24: CGFloat
    public let px32: CGFloat
    public let px40: CGFloat
    public let px48: CGFloat
    public let px100: CGFloat

    public init(
        px2: CGFloat = 2,
        px4: CGFloat = 4,
        px8: CGFloat = 8,
        px12: CGFloat = 12,
        px16: CGFloat = 16,
        px24: CGFloat = 24,
        px32: CGFloat = 32,
        px40: CGFloat = 40,
        px48: CGFloat = 48,
        px100: CGFloat = 100
    ) {
        self.px2 = px2
        self.px4 = px4
        self.px8 = px8
        self.px12 = px12
        self.px16 = px16
        self.px24 = px24
        self.px32 = px32
        self.px40 = px40
        self.px48 = px48
        self.px100 = px100
    }
}
