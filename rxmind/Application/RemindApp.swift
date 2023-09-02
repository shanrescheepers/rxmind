//
//  RemindApp.swift
//  Remind

import SwiftUI

@main
struct rxmindApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            SplashView()
           
        }
    }
}
