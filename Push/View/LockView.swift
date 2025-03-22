//
//  LockView.swift
//  Push
//
//  Created by Rhodri Richards on 22/03/2025.
//

import SwiftUI
import LocalAuthentication

struct LockView: View {
    @EnvironmentObject var appManager: AppManager
    @Environment(\.scenePhase) private var scenePhase

    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "faceid")
                       .resizable()
                       .scaledToFit()
                       .frame(width: 50, height: 50)
                       .foregroundColor(.blue)
                       .padding(.bottom)
            
            Text("Unlock with Face ID.")
                .padding(.vertical)
                
            
//            Button {
//                let context = LAContext()
//                authenticateWithPasscode(context: context)
//            } label: {
//                Text("Use Passcode")
//            }
            .onAppear {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    authenticate()
//                }
            }
            Spacer()
        }
        .onChange(of: scenePhase) {
            print(scenePhase)
            if scenePhase == .background {
                appManager.currentView = .lockScreen
            }
        }
        

    }

    
    private func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if
            context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            let reason = "we need to unlock your data!"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                DispatchQueue.main.async {
                    if success {
                        appManager.currentView = .homeScreen
                    } else {
                        // show proper error message
                    }
                }
            }
        } else {
            authenticateWithPasscode(context: context)
        }
    
    }
    func authenticateWithPasscode(context: LAContext) {
        let reason = "Authenticate using your passcode"

        context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authenticationError in
            DispatchQueue.main.async {
                if success {
                    appManager.currentView = .homeScreen
                } else {
                    // show proper error message
                }
            }
        }
    }
    
}

#Preview {
    LockView()
}

