//
//  ContentType.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 19/12/2020.
//

import Foundation

enum ContentType: String, CaseIterable, Identifiable {
	var id: String { self.rawValue }
	case story = "Story"
	case post = "Post"
}
