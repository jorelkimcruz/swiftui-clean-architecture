import SwiftUI

public struct DarkTheme: Theme {
    public var primary: Color {
        Color(red: 0.3, green: 0.6, blue: 1.0)
    }

    public var secondary: Color {
        Color(red: 0.4, green: 0.7, blue: 1.0)
    }

    public var background: Color {
        Color(red: 0.11, green: 0.11, blue: 0.12)
    }

    public var surface: Color {
        Color(red: 0.17, green: 0.17, blue: 0.18)
    }

    public var error: Color {
        Color(red: 1.0, green: 0.4, blue: 0.4)
    }

    public var text: ThemeText {
        ThemeText(
            primary: Color.white.opacity(0.87),
            secondary: Color.white.opacity(0.60),
            disabled: Color.white.opacity(0.38)
        )
    }

    public var typography: ThemeTypography {
        ThemeTypography()
    }

    public var spacing: ThemeSpacing {
        ThemeSpacing()
    }
}
