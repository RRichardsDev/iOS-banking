//
//  ContentView.swift
//  Push
//
//  Created by Rhodri Richards on 22/03/2025.
//

import SwiftUI

import FirebaseMessaging

class PushNotificationViewModel: ObservableObject {
    @Published var fcmToken: String?

    init() {
        fetchFCMToken()
    }

    func fetchFCMToken() {
        Messaging.messaging().token { token, error in
            if let error = error {
                print("Error fetching FCM token: \(error)")
            } else if let token = token {
                DispatchQueue.main.async {
                    self.fcmToken = token
                }
                print("FCM token: \(token)")
            }
        }
    }
}

struct ContentView: View {
    @StateObject private var viewModel = PushNotificationViewModel()


    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            if let token = viewModel.fcmToken {
                            Text("Token: \(token)")
                                .font(.caption)
                                .padding()
                        }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
