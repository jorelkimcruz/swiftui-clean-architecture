//
//  Routes.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//

import Foundation

enum Routes: Identifiable, CaseIterable {
    case splash

    var id: Self {
        self
    }
}

enum FullScreenCover: Identifiable, CaseIterable {
    case dashboard, notSafeView

    var id: Self {
        self
    }
}

//
// enum Sheet: Identifiable, CaseIterable {
//    // Add your sheet cases here
//    case
//
//        var id: Self
//    {
//        self
//    }
// }
//
