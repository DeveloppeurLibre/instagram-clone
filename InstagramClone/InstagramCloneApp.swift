//
//  InstagramCloneApp.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 14/12/2020.
//

import SwiftUI

@main
struct InstagramCloneApp: App {
	
	private let appState = AppState()

    var body: some Scene {
        WindowGroup {
			MainTabView()
				.environmentObject(appState)
				.environment(\.interactors, InteractorsContainer.local(appState: appState))
        }
    }
}
