//
//  InteractorsContainer.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 28/12/2020.
//

import SwiftUI

class InteractorsContainer: EnvironmentKey {
	
	let postsInteractor: PostsInteractor
	let storiesInteractor: StoriesInteractor
	let authInteractor: AuthInteractor
	
	init(postsInteractor: PostsInteractor,
		 storiesInteractor: StoriesInteractor,
		 authInteractor: AuthInteractor) {
		self.postsInteractor = postsInteractor
		self.storiesInteractor = storiesInteractor
		self.authInteractor = authInteractor
	}
	
	static var defaultValue: InteractorsContainer {
		return .init(postsInteractor: StubPostsInteractor(),
					 storiesInteractor: StubStoriesInteractor(),
					 authInteractor: StubAuthInteractor())
	}
	
	static func local(appState: AppState) -> InteractorsContainer {
		return .init(
			postsInteractor: LocalPostsInteractor(),
			storiesInteractor: LocalStoriesInteractor(appState: appState),
			authInteractor: AuthInteractorImplementation()
		)
	}
}

extension EnvironmentValues {
	var interactors: InteractorsContainer {
		get { self[InteractorsContainer.self] }
		set { self[InteractorsContainer.self] = newValue }
	}
}
