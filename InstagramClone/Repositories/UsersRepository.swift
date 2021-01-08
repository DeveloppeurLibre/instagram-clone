//
//  UsersRepository.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 06/01/2021.
//

import Foundation

protocol UsersRepository {
	func loadUsers(completion: @escaping (WebResponse<[RestUser]>) -> Void)
	func loadUser(fromId id: String,
				  completion: @escaping (WebResponse<RestUser?>) -> Void)
}
