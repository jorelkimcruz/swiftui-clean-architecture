//
//  CoordinatorProtocol.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//

import SwiftUI

protocol DestinationProtocol: Equatable {
    associatedtype Destination: View
    var content: Destination {
        get
    }
    var transition: Transition {
        get
    }
}

protocol CoordinatorProtocol: View {
    associatedtype MainContent: Coordinatable
    associatedtype Destination: DestinationProtocol
    var mainView: MainContent {
        get
    }
    var activeRoute: Destination? {
        get
    }
}

// implemented by routes enum inside each view
protocol Routing: Equatable {}

// implemented by the view that has routes
protocol Coordinatable: View {
    associatedtype Route: Routing
}

enum Transition {
    case push
    case bottomSheet
    case url
}
