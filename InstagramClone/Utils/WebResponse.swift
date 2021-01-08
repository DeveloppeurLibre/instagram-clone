//
//  WebResponse.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 06/01/2021.
//

import Foundation

enum WebResponse<T> {
	case success(response: T)
	case failure(error: Error)
}
