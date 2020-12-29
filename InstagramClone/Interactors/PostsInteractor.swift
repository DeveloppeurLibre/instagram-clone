//
//  PostsInteractor.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 28/12/2020.
//

import Foundation

protocol PostsInteractor {
	func loadPosts() -> [Post]
	func addComment(comment: Comment, in post: Post)
}

class StubPostsInteractor: PostsInteractor {
	
	func loadPosts() -> [Post] {
		return []
	}
	
	func addComment(comment: Comment, in post: Post) {
		
	}
}
