//
//  String+Formatter.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 15/12/2020.
//

import Foundation

extension String {
	func pluralize<T: Comparable & Numeric>(with value: T) -> String {
		value >= 2 ? "\(self)s" : self
	}
}
