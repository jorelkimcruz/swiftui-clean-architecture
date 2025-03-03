//
//  DashboardViewModel.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//

import Foundation

actor DashboardViewModel: ObservableObject {
    private let getWeatherUsecase: GetWeatherUsecase

    init(_ getWeatherUsecase: GetWeatherUsecase) {
        self.getWeatherUsecase = getWeatherUsecase
    }

    func getWeather() async throws -> WeatherForecastResponse {
        try await getWeatherUsecase.run()
    }
}
