//
//  RestCommentMapper.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 07/01/2021.
//

import Firebase

struct RestCommentMapper {
	
	static func map(data: [String: Any]) -> RestComment? {
		guard
			let date = data["date"] as? Timestamp,
			let likesCount = data["likesCount"] as? UInt,
			let text = data["text"] as? String,
			let userID = data["userID"] as? String else {
			return nil
		}
		return RestComment(
			date: date,
			likesCount: likesCount,
			text: text,
			userID: userID
		)
	}
}
