//
//  FirebaseUsersRepository.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 06/01/2021.
//

import Firebase

struct FirebaseUsersRepository: UsersRepository {
	
	let database: Firestore
	
	init() {
		self.database = Firestore.firestore()
	}
	
	func loadUsers(completion: @escaping (WebResponse<[RestUser]>) -> Void) {
		let usersCollection = database.collection("users")
		usersCollection.getDocuments { (querySnapshot, error) in
			if let error = error {
				completion(.failure(error: error))
				return
			}
			var restUsers = [RestUser]()
			for document in querySnapshot!.documents {
				if let restUser = RestUserMapper.map(data: document.data()) {
					restUsers.append(restUser)
				}
			}
			completion(.success(response: restUsers))
		}
	}
	
	func loadUser(fromId id: String,
				  completion: @escaping (WebResponse<RestUser?>) -> Void) {
		let userDocument = database.collection("users").document(id)
		userDocument.getDocument { (document, error) in
			if let error = error {
				completion(.failure(error: error))
				return
			}
			guard let data = document?.data() else {
				completion(.success(response: nil))
				return
			}
			completion(.success(response: RestUserMapper.map(data: data)))
		}
	}
}
