import SwiftUI

public class ThemeManager: ObservableObject {
    @Published public private(set) var current: Theme

    public static let shared = ThemeManager()

    private init() {
        self.current = LightTheme()
    }

    public func switchToLight() {
        current = LightTheme()
    }

    public func switchToDark() {
        current = DarkTheme()
    }

    public func switchTo(theme: Theme) {
        current = theme
    }
}

// Environment key for theme
private struct ThemeKey: EnvironmentKey {
    static let defaultValue: Theme = LightTheme()
}

// Environment value extension
public extension EnvironmentValues {
    var theme: Theme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}

// View extension for applying theme
public extension View {
    func theme(_ theme: Theme) -> some View {
        environment(\.theme, theme)
    }
}
