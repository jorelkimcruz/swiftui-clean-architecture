//
//  DependencyInjection+Initializer.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//

import Swinject

final class DependencyInjectionInitializer {
    static let shared = DependencyInjectionInitializer()
    let container: Container

    init() {
        container = Container()
        initViewModel()
    }
}
