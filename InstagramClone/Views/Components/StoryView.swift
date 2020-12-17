//
//  StoryView.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 16/12/2020.
//

import SwiftUI
import KingfisherSwiftUI

struct StoryView: View {
	
	let user: User
	@Binding var isNew: Bool
	
	private let coloredGradient = AngularGradient(
		gradient: Gradient(colors: [.purple, .red, .yellow, .red]),
		center: .center,
		startAngle: .degrees(100),
		endAngle: .degrees(540)
	)
	
	private let grayGradient = AngularGradient(
		gradient: Gradient(colors: [Color.init(white: 0.8)]),
		center: .center
	)
	
    var body: some View {
		VStack(spacing: 4) {
			ZStack {
				KFImage(user.imageURL)
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: 72, height: 72)
					.clipShape(Circle())
				Circle()
					.stroke(lineWidth: isNew ? 2 : 1)
					.fill(
						isNew ? coloredGradient : grayGradient
					)
					.frame(width: 80, height: 80)
			}.padding(2)
			Text(user.name)
				.font(.subheadline)
				.frame(maxWidth: 82)
		}
    }
}

struct StoryView_Previews: PreviewProvider {
	
	static var user = User.mockedData[0]
	@State static var isNew = true
	@State static var isNotNew = false
	
    static var previews: some View {
		Group {
			StoryView(user: user, isNew: $isNew)
			StoryView(user: user, isNew: $isNotNew)
		}
		.padding()
		.previewLayout(.sizeThatFits)
    }
}
