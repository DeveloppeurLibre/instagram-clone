//
//  RestComment.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 07/01/2021.
//

import Firebase

struct RestComment {
	let date: Timestamp
	let likesCount: UInt
	let text: String
	let userID: String
}
