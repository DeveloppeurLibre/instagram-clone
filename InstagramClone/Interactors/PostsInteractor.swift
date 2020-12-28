//
//  PostsInteractor.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 28/12/2020.
//

import Foundation

protocol PostsInteractor {
	func loadPosts() -> [Post]
}

class StubPostsInteractor: PostsInteractor {
	
	func loadPosts() -> [Post] {
		return []
	}
}
