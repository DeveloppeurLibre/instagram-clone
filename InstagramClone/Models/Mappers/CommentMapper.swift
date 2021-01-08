//
//  CommentMapper.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 07/01/2021.
//

import Foundation

struct CommentMapper {
	
	static func map(restComment: RestComment, restUser: RestUser) -> Comment {
		return Comment(
			user: UserMapper.map(restUser: restUser),
			text: restComment.text,
			date: restComment.date.dateValue(),
			numberOfLikes: restComment.likesCount,
			isLiked: false // FIXME : (Quentin Cornu) To fix when likes are implemented in Firebase
		)
	}
}
