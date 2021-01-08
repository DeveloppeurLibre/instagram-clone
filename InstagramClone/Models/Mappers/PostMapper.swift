//
//  PostMapper.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 07/01/2021.
//

import Foundation

struct PostMapper {
	
	static func map(restPost: RestPost, restUser: RestUser, comments: [Comment], isLiked: Bool, isSaved: Bool) -> Post {
		return Post(
			user: UserMapper.map(restUser: restUser),
			location: restPost.location,
			imageURL: URL(string: restPost.contentURL),
			likesCount: restPost.likesCount,
			description: restPost.description,
			date: restPost.creationDate.dateValue(),
			comments: comments,
			isLiked: isLiked,
			isSaved: isSaved
		)
	}
}
