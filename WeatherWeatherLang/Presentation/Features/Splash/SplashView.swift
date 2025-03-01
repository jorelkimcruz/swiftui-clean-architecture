//
//  ContentView.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//

import SwiftUI
import Lottie

struct SplashView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @State private var showDashboard = false // State to control navigation
    
    var body: some View {
        LottieView(
            animation: .named(
                "splash"
            )
        ).playing()
            .animationDidFinish({
                completed in
                coordinator.presentFullScreenCover(.dashboard)
            })
        
        
    }
    
}

#Preview {
    SplashView()
}
