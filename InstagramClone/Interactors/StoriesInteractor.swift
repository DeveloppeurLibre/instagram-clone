//
//  StoriesInteractor.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 28/12/2020.
//

import Foundation
import SwiftUI

protocol StoriesInteractor {
	func loadStories() -> [Story]
	func addStoryContent(picture: Image) -> Void
}

class StubStoriesInteractor: StoriesInteractor {
	
	func loadStories() -> [Story] {
		return []
	}
	
	func addStoryContent(picture: Image) {
		
	}
}
