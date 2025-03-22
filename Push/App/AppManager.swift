//
//  File.swift
//  Push
//
//  Created by Rhodri Richards on 22/03/2025.
//

import Foundation

public final class AppManager: ObservableObject {
    
    @Published var currentView: AppView = .lockScreen
    
    enum AppView {
        case lockScreen
        case homeScreen
    }
}
