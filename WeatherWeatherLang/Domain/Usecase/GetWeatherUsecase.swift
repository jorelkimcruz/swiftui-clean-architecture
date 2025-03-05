//
//  getForecastUsecase.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/3/25.
//

import Foundation

struct GetWeatherUsecase {
    let repository: OpenMeteoRepository

    func run() async throws -> WeatherForecast {
        let request = WeatherRequest(latitude: 14.599512, longitude: 120.984222, hourly: nil,
                                     daily: nil, current: Forecast.temperature2m, elevation: nil,
                                     pastDays: nil, pastHours: nil, pastMinutely15: nil, forecastDays: nil,
                                     forecastHours: nil, forecastMinutely15: nil, startDate: nil, endDate: nil,
                                     startHour: nil, endHour: nil, temperatureUnit: .celcius)

        let response: WeatherForecastResponse = try await repository.getWeather(request: request)

        let utcOffset = String(response.utcOffset ?? 0)
        let generationTime = String(response.generationTime ?? 0)
        let temp = String(response.current?.temperature2m ?? 0)
        print(temp)

        return WeatherForecast(latitude: response.latitude, longitude: response.longitude,
                               elevation: response.elevation, generationTime: generationTime,
                               utcOffset: utcOffset, timezone: response.timezone,
                               timezoneAbbreviation: response.timezoneAbbreviation,
                               current: Current(interval: String(response.current?.interval ?? 0),
                                                temperature: temp,
                                                time: response.current?.time),
                               currentUnits: Current(interval: String(response.currentUnits?.interval ?? ""),
                                                     temperature: response.currentUnits?.temperature2m,
                                                     time: response.currentUnits?.time))
    }
}
