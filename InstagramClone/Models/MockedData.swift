//
//  MockedData.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 14/12/2020.
//

import Foundation

extension Post {
    static let mockedData: [Post] = [
        Post(
            user: User.mockedData,
            location: nil,
            imageURL: URL(string: "https://images.pexels.com/photos/2040627/pexels-photo-2040627.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
            likesCount: 1782,
            description: "Lorem ipsum 🌴 dolor sit amet, consectetur adipiscing elit 😁 sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
            date: Date(timeIntervalSinceReferenceDate: -16789),
            comments: [],
            isLiked: true,
            isSaved: false
        ),
        Post(
            user: User.mockedData, location: "Beverly Hills, California",
            imageURL: URL(string: "https://images.pexels.com/photos/3225531/pexels-photo-3225531.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
            likesCount: 1782,
            description: "Test description",
            date: Date(timeIntervalSinceReferenceDate: -73289),
            comments: Comment.mockedData,
            isLiked: false,
            isSaved: true
        ),
        Post(
            user: User.mockedData, location: "Paris, France",
            imageURL: URL(string: "https://images.pexels.com/photos/3061217/pexels-photo-3061217.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
            likesCount: 1782,
            description: "Test description",
            date: Date(timeIntervalSinceReferenceDate: -98289),
            comments: Comment.mockedData,
            isLiked: false,
            isSaved: false
        )
    ]
}

extension User {
    static let mockedData = User(
        name: "test_user",
        imageURL: URL(string: "https://images.pexels.com/photos/194446/pexels-photo-194446.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500")
    )
}

extension Comment {
    static let mockedData = [
        Comment(user: User.mockedData, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", date: Date(timeIntervalSinceNow: -10000), isLiked: false),
        Comment(user: User.mockedData, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", date: Date(timeIntervalSinceNow: -10000), isLiked: false),
        Comment(user: User.mockedData, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", date: Date(timeIntervalSinceNow: -10000), isLiked: false),
    ]
}
