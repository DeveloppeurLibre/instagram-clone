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

    var body: some View {
		VStack {
			FeedHeader()
			ScrollView {
				VStack {
					ForEach(appState.userData.posts) { post in
						PostView(post: post)
					}
				}
			}
		}
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
            .environmentObject(AppState.preview)
    }
}
