//
//  InstagramCloneApp.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 14/12/2020.
//

import SwiftUI

@main
struct InstagramCloneApp: App {

    var body: some Scene {
        WindowGroup {
            FeedView()
                .environmentObject(AppState())
        }
    }
}
