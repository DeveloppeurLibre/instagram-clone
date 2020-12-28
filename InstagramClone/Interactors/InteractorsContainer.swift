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
	
	init(postsInteractor: PostsInteractor,
		 storiesInteractor: StoriesInteractor) {
		self.postsInteractor = postsInteractor
		self.storiesInteractor = storiesInteractor
	}
	
	static var defaultValue: InteractorsContainer {
		return .init(postsInteractor: StubPostsInteractor(),
					 storiesInteractor: StubStoriesInteractor())
	}
	
	static func local(appState: AppState) -> InteractorsContainer {
		return .init(
			postsInteractor: LocalPostsInteractor(),
			storiesInteractor: LocalStoriesInteractor(appState: appState)
		)
	}
}

extension EnvironmentValues {
	var interactors: InteractorsContainer {
		get { self[InteractorsContainer.self] }
		set { self[InteractorsContainer.self] = newValue }
	}
}
