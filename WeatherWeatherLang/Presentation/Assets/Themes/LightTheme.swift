import SwiftUI

public struct LightTheme: Theme {
    public var primary: Color {
        .white
    }

    public var blue: Color {
        Color(red: 0.2, green: 0.5, blue: 1.0)
    }

    public var secondary: Color {
        Color(red: 0.6, green: 0.8, blue: 1.0)
    }

    public var background: Color {
        Color(red: 0.98, green: 0.98, blue: 0.98)
    }

    public var surface: Color {
        .white
    }

    public var error: Color {
        Color(red: 0.95, green: 0.3, blue: 0.3)
    }

    public var text: ThemeText {
        ThemeText(
            primary: .white,
            secondary: Color.black.opacity(0.60),
            disabled: Color.black.opacity(0.38)
        )
    }

    public var typography: ThemeTypography {
        ThemeTypography()
    }

    public var spacing: ThemeSpacing {
        ThemeSpacing()
    }
}
