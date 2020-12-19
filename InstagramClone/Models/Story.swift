//
//  Story.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 16/12/2020.
//

import Foundation

class Story: ObservableObject, Identifiable {
	
	let id: UUID
	let user: User
	@Published var contents: [Content]
	var isNew: Bool {
		contents.map { $0.isNew }.contains(true)
	}
	
	init(user: User, contents: [Content]) {
		self.id = UUID()
		self.user = user
		self.contents = contents
	}
	
	class Content: ObservableObject {
		@Published var isNew: Bool
		let type: ContentType
		let publicationDate: Date
		
		init(isNew: Bool, type: ContentType, publicationDate: Date) {
			self.isNew = isNew
			self.type = type
			self.publicationDate = publicationDate
		}
	}
	
	enum ContentType {
		case image(url: URL)
		case video(url: URL)
	}
}
