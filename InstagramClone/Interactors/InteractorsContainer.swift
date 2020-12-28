//
//  InteractorsContainer.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 28/12/2020.
//

import SwiftUI

class InteractorsContainer: EnvironmentKey {
	
	let postsInteractor: PostsInteractor
	
	init(postsInteractor: PostsInteractor) {
		self.postsInteractor = postsInteractor
	}
	
	static var defaultValue: InteractorsContainer {
		return .init(postsInteractor: StubPostsInteractor())
	}
	
	static var local: InteractorsContainer {
		return .init(postsInteractor: LocalPostsInteractor())
	}
}

extension EnvironmentValues {
	var interactors: InteractorsContainer {
		get { self[InteractorsContainer.self] }
		set { self[InteractorsContainer.self] = newValue }
	}
}
