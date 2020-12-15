//
//  Post.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 14/12/2020.
//

import Foundation

class Post: Identifiable, ObservableObject {
    let id: UUID
    let user: User
    let location: String?
    let imageURL: URL?
    let likesCount: UInt
    let description: String
    @Published var isLiked: Bool
    @Published var isSaved: Bool
    
    init(user: User,
         location: String?,
         imageURL: URL?,
         likesCount: UInt,
         description: String,
         isLiked: Bool,
         isSaved: Bool) {
        self.id = UUID()
        self.user = user
        self.location = location
        self.imageURL = imageURL
        self.isLiked = isLiked
        self.isSaved = isSaved
        self.likesCount = likesCount
        self.description = description
    }
}
