//
//  DependencyInjectionInitializer+viewmodel.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//
import SwiftUI
import Swinject

extension DependencyInjectionInitializer {
    func initViewModel() {
        container.register(StateObject<DashboardViewModel>.self) { _  in
            StateObject(wrappedValue: DashboardViewModel(self.container.resolve(GetWeatherUsecase.self)!))
        }.inObjectScope(.container)
        do {
            try validateDependencies()
        } catch {
            print("Error registering dependencies: \(error)")
        }
    }

    private func validateDependencies() throws {
        let dependencies: [() -> Any?] = [
            { self.container.resolve(StateObject<DashboardViewModel>.self) },
        ]

        for resolve in dependencies {
            guard resolve() != nil else {
                throw DependencyInjectionError.dependencyNotRegistered
            }
        }
        print("All viewmodel dependencies are successfully registered.")
    }
}
