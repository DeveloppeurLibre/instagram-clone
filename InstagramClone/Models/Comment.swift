//
//  Comment.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 15/12/2020.
//

import Foundation

class Comment: ObservableObject, Identifiable {
    let id: UUID
    let user: User
    let text: String
    let date: Date
    @Published var isLiked: Bool
    
    init(user: User, text: String, date: Date, isLiked: Bool) {
        self.id = UUID()
        self.user = user
        self.text = text
        self.date = date
        self.isLiked = isLiked
    }
}
