//
//  HourlyForecast.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//

public struct HourlyForecast: Codable {
    public let time: [String]
    public let temperature2m: [Double]
    public let relativeHumidity2m: [Int]
    public let precipitation: [Double]
    public let windSpeed10m: [Double]
}

private enum CodingKeys: String, CodingKey {
    case time
    case temperature2m = "temperature_2m"
    case relativeHumidity2m = "relative_humidity_2m"
    case precipitation
    case windSpeed10m = "wind_speed_10m"
}
