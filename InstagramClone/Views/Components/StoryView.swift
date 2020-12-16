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
	
    var body: some View {
		VStack(spacing: 4) {
			ZStack {
				KFImage(user.imageURL)
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: 72, height: 72)
					.clipShape(Circle())
				Circle()
					.stroke(lineWidth: 2)
					.fill(
						AngularGradient(
							gradient: Gradient(colors: [.purple, .red, .yellow, .red]),
							center: .center,
							startAngle: .degrees(100),
							endAngle: .degrees(540)
						)
					)
					.frame(width: 80, height: 80)
			}.padding(2)
			Text(user.name)
		}
		
    }
}

struct StoryView_Previews: PreviewProvider {
	
	static var user = User.mockedData
	
    static var previews: some View {
		StoryView(user: user)
			.padding()
			.previewLayout(.sizeThatFits)
    }
}
