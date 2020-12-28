//
//  LocalStoriesInteractor.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 28/12/2020.
//

import Foundation
import SwiftUI

class LocalStoriesInteractor: StoriesInteractor {
	
	let appState: AppState
	
	init(appState: AppState) {
		self.appState = appState
	}
	
	func loadStories() -> [Story] {
		return Story.mockedData
	}
	
	func addStoryContent(picture: Image) {
		let newContent = Story.Content(
			isNew: true,
			type: .picture(image: picture),
			publicationDate: Date()
		)
		appState.userData.stories.first?.contents.append(newContent)
	}
}
