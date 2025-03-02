//
//  JailbreakDetection.swift
//  WeatherWeatherLang
//
//  Created by jorel kim cruz on 3/2/25.
//

import UIKit

public enum JailbreakDetection {
    public static var isJailbroken: Bool {
        #if targetEnvironment(simulator)
            return false
        #else
        guard let cydiaUrlScheme = URL(string: "cydia://package/com.example.package") else { return false }

        if UIApplication.shared.canOpenURL(cydiaUrlScheme as URL) {
            return true
        }
        let fileManager = FileManager.default
                if fileManager.fileExists(atPath: "/Applications/Cydia.app") ||
                    fileManager.fileExists(atPath: "/Library/MobileSubstrate/MobileSubstrate.dylib") ||
                    fileManager.fileExists(atPath: "/bin/bash") ||
                    fileManager.fileExists(atPath: "/usr/sbin/sshd") ||
                    fileManager.fileExists(atPath: "/etc/apt") ||
                    fileManager.fileExists(atPath: "/usr/bin/ssh") ||
                    fileManager.fileExists(atPath: "/private/var/lib/apt") {
                    return true
                }

                if canOpen(path: "/Applications/Cydia.app") ||
                    canOpen(path: "/Library/MobileSubstrate/MobileSubstrate.dylib") ||
                    canOpen(path: "/bin/bash") ||
                    canOpen(path: "/usr/sbin/sshd") ||
                    canOpen(path: "/etc/apt") ||
                    canOpen(path: "/usr/bin/ssh") {
                    return true
                }

                let path = "/private/" + UUID().uuidString
                do {
                    try "anyString".write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
                    try fileManager.removeItem(atPath: path)
                    return true
                } catch {
                    return false
                }
        #endif
    }
}
