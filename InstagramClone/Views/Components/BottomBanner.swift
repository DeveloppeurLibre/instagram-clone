//
//  BottomBanner.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 30/12/2020.
//

import SwiftUI

struct BottomBanner: View {
	
	let indication: String
	let actionText: String
	let action: () -> Void
	
    var body: some View {
		VStack {
			Rectangle()
				.frame(height: 0.5)
				.foregroundColor(.gray)
			HStack {
				Text(indication)
					.foregroundColor(.gray)
				Button(action: action, label: {
					Text(actionText)
						.fontWeight(.semibold)
				})
			}
			.font(.caption)
			.padding(16)
		}
    }
}

struct BottomBanner_Previews: PreviewProvider {
    static var previews: some View {
		BottomBanner(indication: "Test indication", actionText: "Action", action: {})
			.previewLayout(.sizeThatFits)
			.padding(.top)
    }
}
