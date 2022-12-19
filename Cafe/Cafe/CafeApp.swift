//
//  CafeApp.swift
//  Cafe
//
//  Created by 이준혁 on 2022/12/18.
//

import SwiftUI

@main
struct CafeApp: App {
    // App -> AppDelegate/SceneDelagete
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .accentColor(.green)
        }
    }
}

// tintColor -> Storyboard
// accentColor -> SwiftUI
