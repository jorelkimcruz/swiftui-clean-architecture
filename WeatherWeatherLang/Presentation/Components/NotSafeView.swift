//
//  NotSafeView.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//

import SwiftUI

struct NotSafeView: View {
    var body: some View {
        VStack(alignment: .center, content: {
            Text("Security Warning!")
            Text("your device is jailbroken")
        })
    }
}

#Preview {
    NotSafeView()
}
