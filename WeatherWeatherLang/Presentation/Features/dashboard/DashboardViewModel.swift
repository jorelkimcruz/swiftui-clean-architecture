//
//  DashboardViewModel.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//

import Foundation

class DashboardViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var isError = false
    @Published var weather: WeatherForecast?

    private let getWeatherUsecase: GetWeatherUsecase

    init(_ getWeatherUsecase: GetWeatherUsecase) {
        self.getWeatherUsecase = getWeatherUsecase
    }

    func onScreenOpen() {
        Task {
            do {
                try await self.getWeather()
            } catch {
                isError = true
            }
        }
    }

    @MainActor
    func getWeather() async throws {
        do {
            isLoading = true
            weather = try await getWeatherUsecase.run()
            isLoading = false
        } catch {
            isError = true
            isLoading = false
        }
    }
}

extension DashboardViewModel {}
