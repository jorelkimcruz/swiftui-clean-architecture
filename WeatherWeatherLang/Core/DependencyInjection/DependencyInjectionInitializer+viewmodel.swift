//
//  DependencyInjectionInitializer+viewmodel.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//
import Swinject
enum DependencyInjectionError: Error {
    //    One or more dependencies are not registered in the container
    case dependencyNotRegistered
}

extension DependencyInjectionInitializer {
    func initViewModel() {
        container.register(DashboardViewModel.self) { _ in DashboardViewModel() }
        do {
            try validateDependencies()
        } catch {
            print("Error registering dependencies: \(error)")
        }
    }

    private func validateDependencies() throws {
        let dependencies: [() -> Any?] = [
            { self.container.resolve(DashboardViewModel.self) },
        ]

        for resolve in dependencies {
            guard resolve() != nil else {
                throw DependencyInjectionError.dependencyNotRegistered
            }
        }
        print("All dependencies are successfully registered.")
    }
}
