//
//  SplashView.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//

import Lottie
import SwiftUI

struct SplashView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @State private var showDashboard = false // State to control navigation
    var body: some View {
        LottieView(
            animation: .named(
                Lottie.splash
            )
        ).playing()
            .animationDidFinish { _ in
                if JailbreakDetection.isJailbroken {
                    coordinator.presentFullScreenCover(.notSafeView, parameter: nil)
                } else {
                    coordinator.presentFullScreenCover(.dashboard, parameter: "SHITNESS")
                }
            }
    }
}

#Preview {
    SplashView()
}
