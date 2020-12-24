//
//  Date+Formatter.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 15/12/2020.
//

import Foundation

extension Date {
	var timeAgo: String {
		let timeInterval = self.distance(to: Date())
		var stringDate = ""
		if timeInterval < 60 {
			stringDate = "\(Int(timeInterval)) second".pluralize(with: timeInterval)
		} else if timeInterval / 60 < 60 {
			let minutesTimeInterval = timeInterval / 60
			stringDate = "\(Int(minutesTimeInterval)) minute".pluralize(with: minutesTimeInterval)
		} else if timeInterval / 3600 < 24 {
			let hoursTimeInterval = timeInterval / 3600
			stringDate = "\(Int(hoursTimeInterval)) hour".pluralize(with: hoursTimeInterval)
		} else if timeInterval / 86400 < 30 {
			let daysTimeInterval = timeInterval / 86400
			stringDate = "\(Int(daysTimeInterval)) day".pluralize(with: daysTimeInterval)
		} else if timeInterval / 2592000 < 12 {
			let monthsTimeInterval = timeInterval / 2592000
			stringDate = "\(Int(monthsTimeInterval)) month".pluralize(with: monthsTimeInterval)
		} else {
			let yearsTimeInterval = timeInterval / 31104000
			stringDate = "\(Int(yearsTimeInterval)) year".pluralize(with: yearsTimeInterval)
		}
		return stringDate + " ago"
	}
}
