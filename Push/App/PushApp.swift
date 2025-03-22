//
//  PushApp.swift
//  Push
//
//  Created by Rhodri Richards on 22/03/2025.
//

import SwiftUI

@main
struct PushApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var appManager = AppManager()
    var body: some Scene {
        WindowGroup {
            Group {
                switch appManager.currentView {
                case .lockScreen:
                    LockView()
                case .homeScreen:
                    HomeView()

                }
            }
            .environmentObject(appManager)
        }
    }
}
