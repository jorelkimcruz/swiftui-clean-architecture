//
//  Coordinator.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//

import Foundation
import SwiftUI

class Coordinator: ObservableObject {
    @Published var path: NavigationPath = .init()
//    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    var parameter: Any?

    func push(page: Routes) {
        path.append(page)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

//    func presentSheet(_ sheet: Sheet) {
//        self.sheet = sheet
//    }

    func presentFullScreenCover(_ cover: FullScreenCover, parameter: Any?) {
        self.parameter = parameter
        fullScreenCover = cover
    }

//    func dismissSheet() {
//        self.sheet = nil
//    }

    func dismissCover() {
        fullScreenCover = nil
        parameter = nil
    }

    @ViewBuilder
    func build(page: Routes) -> some View {
        switch page {
        case .splash: SplashView()
        }
    }

//    @ViewBuilder
//    func buildSheet(sheet: Sheet) -> some View {
//        switch sheet {
//        case .forgotPassword: ForgotPasswordView()
//        }
//    }

    @ViewBuilder
    func buildCover(cover: FullScreenCover) -> some View {
        if let param = parameter as? String {
            switch cover {
            case .notSafeView: NotSafeView()
            case .dashboard: DashboardView()
            }
        } else {
            SplashView()
        }
    }
}
