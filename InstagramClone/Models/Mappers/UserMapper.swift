//
//  UserMapper.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 07/01/2021.
//

import Foundation

struct UserMapper {
	
	static func map(restUser: RestUser) -> User {
		return User(
			name: restUser.userName,
			imageURL: URL(string: restUser.imageURL)
		)
	}
}
