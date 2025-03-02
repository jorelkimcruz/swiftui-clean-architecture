//
//  Main.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//

import SwiftData
import SwiftUI

@main
struct Main: App {
    @StateObject private var coordinator = Coordinator()

    init() {
        _ = DependencyInjectionInitializer()
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                coordinator.build(page: .splash)
                    .navigationDestination(for: Routes.self) { page in
                        coordinator.build(page: page)
                    }
                    //                      .sheet(item: $coordinator.sheet) { sheet in
                    //                          coordinator.buildSheet(sheet: sheet)
                    //                      }
                    .fullScreenCover(item: $coordinator.fullScreenCover) { item in
                        coordinator.buildCover(cover: item)
                    }
            }
            .environmentObject(coordinator)
        }
    }
}
