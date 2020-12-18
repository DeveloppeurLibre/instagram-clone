//
//  StoryView.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 16/12/2020.
//

import SwiftUI
import KingfisherSwiftUI

struct StoryView: View {
	
	@ObservedObject var story: Story
	@State private var isPresenting = false
	
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
				KFImage(story.user.imageURL)
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: 72, height: 72)
					.clipShape(Circle())
				Circle()
					.stroke(lineWidth: story.isNew ? 2 : 1)
					.fill(
						story.isNew ? coloredGradient : grayGradient
					)
					.frame(width: 80, height: 80)
			}
			.padding(2)
			.onTapGesture {
				isPresenting.toggle()
			}
			.fullScreenCover(isPresented: $isPresenting, content: {
				StoryContentView(story: story)
			})
			Text(story.user.name)
				.font(.subheadline)
				.frame(maxWidth: 82)
				.lineLimit(1)
		}
    }
}

struct StoryView_Previews: PreviewProvider {
	
	static var story1 = Story.mockedData[0]
	static var story2 = Story.mockedData[1]
	
    static var previews: some View {
		Group {
			StoryView(story: story1)
			StoryView(story: story2)
		}
		.padding()
		.previewLayout(.sizeThatFits)
    }
}
