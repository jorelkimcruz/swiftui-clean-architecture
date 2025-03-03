//
//  WeatherRequest.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/3/25.
//

import Foundation
/*
 
 

 */
enum Hourly: String, CaseIterable {
    case temperature2m = "temperature_2m"
    case relativeHumidity2m = "relative_humidity_2m"
    case precipitation = "precipitation"
    case windSpeed10m = "wind_speed_10m"
}

enum Daily: String, CaseIterable {
    case temperature2mMax = "temperature_2m_max"
    case temperature2mMin = "temperature_2m_min"
    case precipitationSum = "precipitation_sum"
}

struct WeatherRequest {
    let latitude: Double
    let longitude: Double
    let hourly: [Hourly]?
    let daily: [Daily]?

    func body() -> [String: Any] {
        var parameters: [String: Any] = [
            "latitude": latitude,
            "longitude": longitude,
            "timezone": "GMT",
        ]
        if let hourly {
            parameters["hourly"] = hourly.map({ $0.rawValue }).joined(separator: ",")
        }
        if let daily {
            parameters["daily"] = daily.map({ $0.rawValue }).joined(separator: ",")
        }
        return parameters
    }
}
