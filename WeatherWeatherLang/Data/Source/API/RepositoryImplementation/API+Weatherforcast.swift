//
//  API+Weatherforcast.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//

extension API {
    func weather(latitude: Double,
                 longitude: Double,
                 hourly: [String] = ["temperature_2m", "relative_humidity_2m", "precipitation", "wind_speed_10m"],
                 daily: [String]? = ["temperature_2m_max", "temperature_2m_min", "precipitation_sum"],
                 timezone: String = "GMT") async throws -> WeatherForecast {
        var parameters: [String: Any] = [
            "latitude": latitude,
            "longitude": longitude,
            "timezone": timezone,
            "hourly": hourly.joined(separator: ","),
        ]

        if let daily {
            parameters["daily"] = daily.joined(separator: ",")
        }

        return try await fetch("forecast", parameters: parameters)
    }
}
