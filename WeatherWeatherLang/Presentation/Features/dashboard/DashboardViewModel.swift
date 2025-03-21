//
//  DashboardViewModel.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//
// TODO: Update to @Observalbe if the lowest supported ios version is 17. 
// currently @Observable only supports ios 17 above.

import Foundation

class DashboardViewModel: ObservableObject {
    @Published var viewState: ViewState = .idle
    @Published var weather: WeatherForecastProtocol?

    private let getWeatherUsecase: GetWeatherUsecase

    init(_ getWeatherUsecase: GetWeatherUsecase) {
        self.getWeatherUsecase = getWeatherUsecase
    }

    func onScreenOpen() {
        Task {
            do {
                try await self.getWeather()
            } catch {
                viewState = .error(error: error)
            }
        }
    }

    func currentTemperature() -> String {
        weather?.current?.temperature ?? ""
    }

    @MainActor
    func getWeather() async throws {
        do {
            viewState = .loading
            weather = try await getWeatherUsecase.run()
            viewState = .success
        } catch {
            viewState = .error(error: error)
        }
    }
}

extension DashboardViewModel {}
