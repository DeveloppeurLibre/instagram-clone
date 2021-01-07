//
//  RestPost.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 07/01/2021.
//

import Firebase

struct RestPost {
	let comments: [RestComment]
	let contentURL: String
	let creationDate: Timestamp
	let description: String
	let likesCount: UInt
	let location: String?
	let userID: String
	let usersWhoLiked: [String]
}
