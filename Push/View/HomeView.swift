//
//  HomeView.swift
//  Push
//
//  Created by Rhodri Richards on 22/03/2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appManager: AppManager
    @Environment(\.scenePhase) private var scenePhase
    var body: some View {
        VStack {
            Text("Welcome Back to the App!")
            
            Button {
                // Lock the app
                appManager.currentView = .lockScreen
            } label: {
                Text("Sign Out")
            }
            .padding()
            
        }
        .onChange(of: scenePhase) {
            print(scenePhase)
            if scenePhase == .inactive || scenePhase == .background {
                appManager.currentView = .lockScreen
            }
        }

    }
}

#Preview {
    HomeView()
}

