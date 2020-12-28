//
//  FeedView.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 14/12/2020.
//

import SwiftUI
import CoreData

struct FeedView: View {
    
    @EnvironmentObject var appState: AppState
	@Environment(\.interactors) var interactors: InteractorsContainer

    var body: some View {
		VStack {
			FeedHeader()
			ScrollView {
				ScrollView(.horizontal, showsIndicators: false) {
					HStack(spacing: 13) {
						Spacer(minLength: 0)
						ForEach(appState.userData.stories) { story in
							StoryView(story: story)
						}
						Spacer(minLength: 0)
					}
				}
				VStack {
					ForEach(appState.userData.posts) { post in
						PostView(post: post)
					}
				}
			}
		}.onAppear {
			loadPosts()
		}
	}
	
	private func loadPosts() {
		appState.userData.posts = interactors.postsInteractor.loadPosts()
	}
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
            .environmentObject(AppState.preview)
    }
}
