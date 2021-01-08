//
//  FirebasePostsRepository.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 06/01/2021.
//

import Firebase

struct FirebasePostsRepository: PostsRepository {
	
	let database = Firestore.firestore()
	
	func loadPosts(completion: @escaping (WebResponse<[RestPost]>) -> Void) {
		let postsCollection = database.collection("posts")
		postsCollection.getDocuments { (querySnapshot, error) in
			if let error = error {
				completion(.failure(error: error))
			}
			var restPosts = [RestPost]()
			for document in querySnapshot!.documents {
				if let restPost = RestPostMapper.map(data: document.data()) {
					restPosts.append(restPost)
				}
			}
			completion(.success(response: restPosts))
		}
	}
}
