//
//  AppState.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 14/12/2020.
//

import Foundation

class AppState: ObservableObject {
    @Published var userData = UserData()
    
    #if DEBUG
    static var preview: AppState {
        let state = AppState()
        state.userData.posts = Post.mockedData
        return state
    }
    #endif
}

extension AppState {
    struct UserData {
        var posts: [Post] = []
		var stories: [Story] = Story.mockedData
    }
}
