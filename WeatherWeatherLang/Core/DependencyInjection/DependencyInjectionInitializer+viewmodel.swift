//
//  DependencyInjectionInitializer+viewmodel.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//
import Swinject

extension DependencyInjectionInitializer {
    func initViewModel() {
        container.register(DashboardViewModel.self) { _  in
            DashboardViewModel(self.container.resolve(GetWeatherUsecase.self)!)
        }.inObjectScope(.container)
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
        print("All viewmodel dependencies are successfully registered.")
    }
}
