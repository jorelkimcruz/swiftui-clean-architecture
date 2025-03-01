//
//  DailyForecast.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//

public struct DailyForecast: Codable {
    public let time: [String]
    public let temperature2mMax: [Double]
    public let temperature2mMin: [Double]
    public let precipitationSum: [Double]
}

private enum CodingKeys: String, CodingKey {
    case time
    case temperature2mMax = "temperature_2m_max"
    case temperature2mMin = "temperature_2m_min"
    case precipitationSum = "precipitation_sum"
}
