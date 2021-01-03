//
//  AuthInteractor.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 03/01/2021.
//

import SwiftUI
import Firebase

protocol AuthInteractor {
	func signUp(withEmail email: String,
				password: String,
				completion: @escaping (AuthDataResult?, Error?) -> Void)
}

class StubAuthInteractor: AuthInteractor {
	
	func signUp(withEmail email: String,
				password: String,
				completion: (AuthDataResult?, Error?) -> Void) {
		
	}
}
