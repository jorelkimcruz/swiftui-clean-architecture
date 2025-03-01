//
//  Routes.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//

import Foundation

enum Routes: Hashable {
    case splash
}

enum FullScreenCover: String, Identifiable {
    var id: String {
        rawValue
    }

    case dashboard
}

// enum Sheet: String, Identifiable {
//    var id: String {
//        self.rawValue
//    }
//    // Add your sheet cases here
//    case
// }
