//
//  ViewState.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/5/25.
//

import Foundation

enum ViewState {
    case idle
    case loading
    case success
    case error(error: Error)
}
