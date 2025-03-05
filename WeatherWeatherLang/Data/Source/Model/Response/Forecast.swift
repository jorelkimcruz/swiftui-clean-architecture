//
//  HourlyForecast.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//

enum Forecast: String, CaseIterable {
    case temperature2m = "temperature_2m"
    case relativeHumidity2m = "relative_humidity_2m"
    case precipitation
    case windSpeed10m = "wind_speed_10m"
}
