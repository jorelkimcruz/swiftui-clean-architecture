//
//  ViewState.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/5/25.
//

import Foundation

enum ViewState: Equatable {
    static func == (lhs: ViewState, rhs: ViewState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle):
            return true
        case (.loading, .loading):
            return true
        case (.success, .success):
            return true
        case (.error, .error):
            return true
        default:
            return false
        }
    }
    
    case idle
    case loading
    case success
    case error(error: Error)
}
