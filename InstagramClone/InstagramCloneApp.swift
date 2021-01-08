//
//  InstagramCloneApp.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 14/12/2020.
//

import SwiftUI
import Firebase

@main
struct InstagramCloneApp: App {
	
	private let appState = AppState()

	init() {
		FirebaseApp.configure()
	}
	
    var body: some Scene {
        WindowGroup {
			if Auth.auth().currentUser != nil {
				MainTabView()
					.environmentObject(appState)
					.environment(\.interactors, InteractorsContainer.local(appState: appState))
			} else {
				LoginView()
					.environmentObject(appState)
					.environment(\.interactors, InteractorsContainer.local(appState: appState))
			}
        }
    }
}
