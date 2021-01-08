//
//  PostMapper.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 06/01/2021.
//

import Firebase

struct RestPostMapper {
		
	static func map(data: [String: Any]) -> RestPost? {
		guard
			let contentURL = data["contentURL"] as? String,
			let creationDate = data["creationDate"] as? Timestamp,
			let description = data["description"] as? String,
			let likesCount = data["likesCount"] as? UInt,
			let userID = data["userID"] as? String else {
			return nil
		}
		let comments = data["comments"] as? [[String: Any]] ?? []
		let usersWhoLiked = data["uwersWhoLiked"] as? [String] ?? []
		let location = data["location"] as? String ?? nil
		var restComments = [RestComment]()
		for data in comments {
			if let restComment = RestCommentMapper.map(data: data) {
				restComments.append(restComment)
			}
		}
		return RestPost(
			comments: restComments,
			contentURL: contentURL,
			creationDate: creationDate,
			description: description,
			likesCount: likesCount,
			location: location,
			userID: userID,
			usersWhoLiked: usersWhoLiked
		)
	}
}
