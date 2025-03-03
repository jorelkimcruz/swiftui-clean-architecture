//
//  DependencyInjectionInitializer+viewmodel.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//
import Swinject

extension DependencyInjectionInitializer {
    func initApi() {
        container.register(API.self) { _ in API() }
        do {
            try validateDependencies()
        } catch {
            print("Error registering dependencies: \(error)")
        }
    }

    private func validateDependencies() throws {
        let dependencies: [() -> Any?] = [
            { self.container.resolve(API.self) },
        ]

        for resolve in dependencies {
            guard resolve() != nil else {
                throw DependencyInjectionError.dependencyNotRegistered
            }
        }
        print("All API dependencies are successfully registered.")
    }
}
