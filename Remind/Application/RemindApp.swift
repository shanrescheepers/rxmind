//
//  RemindApp.swift
//  Remind

import SwiftUI

@main
struct RemindApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            SplashView()
           
        }
    }
}
