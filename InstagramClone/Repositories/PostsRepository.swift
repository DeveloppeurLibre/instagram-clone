//
//  PostsRepository.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 06/01/2021.
//

import Foundation

protocol PostsRepository {
	func loadPosts(completion: @escaping (WebResponse<[RestPost]>) -> Void)
}
