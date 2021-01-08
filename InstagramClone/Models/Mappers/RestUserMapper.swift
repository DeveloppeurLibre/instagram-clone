//
//  RestUserMapper.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 06/01/2021.
//

import Foundation

struct RestUserMapper {
	
	static func map(data: [String: Any]) -> RestUser? {
		guard
			let imageURL = data["imageURL"] as? String,
			let userName = data["username"] as? String else {
			return nil
		}
		let savedPostsIDs = data["savedPostsIDs"] as? [String] ?? []
		return RestUser(imageURL: imageURL, savedPosts: savedPostsIDs, userName: userName)
	}
}
