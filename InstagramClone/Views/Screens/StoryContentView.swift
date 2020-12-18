//
//  StoryContentView.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 17/12/2020.
//

import SwiftUI
import KingfisherSwiftUI

struct StoryContentView: View {
	
	@ObservedObject var story: Story
	@State private var comment: String = ""
	@Environment(\.presentationMode) var presentationMode
	private let screenWidth = UIScreen.main.bounds.size.width
	
    var body: some View {
		ZStack(alignment: .top) {
			Rectangle()
				.ignoresSafeArea()
			ZStack(alignment: .top) {
				content
				VStack {
					HStack {
						KFImage(story.user.imageURL)
							.resizable()
							.aspectRatio(contentMode: .fill)
							.frame(width: 40, height: 40)
							.clipShape(Circle())
						Text(story.user.name)
							.font(.headline)
							.foregroundColor(.white)
						Text(story.contents[0].publicationDate.timeAgo)
							.foregroundColor(Color.init(white: 0.9))
						Spacer()
						HStack(spacing: 16) {
							Image(systemName: "ellipsis")
							// FIXME: (Quentin Cornu) To complete with action
							Image(systemName: "xmark")
								.onTapGesture {
									presentationMode.wrappedValue.dismiss()
								}
						}
						.imageScale(.large)
						.foregroundColor(.white)
					}
					.padding()
					.background(
						LinearGradient(
							gradient: Gradient(
								colors: [Color(white: 0, opacity: 0.5), .clear]),
							startPoint: .top,
							endPoint: .bottom
						)
					)

				}
			}.cornerRadius(10)
			VStack {
				Spacer()
				HStack(spacing: 16) {
					ZStack {
						RoundedRectangle(cornerRadius: 22.5)
							.stroke(Color.white, lineWidth: 0.5)
							.frame(height: 45)
						ZStack(alignment: .leading) {
							if comment.isEmpty {
								Text("Send Message")
									.foregroundColor(.white)
									.padding(.leading, 16)
							}
							TextField("", text: $comment)
								.foregroundColor(.white)
								.padding()
						}
						.font(.system(size: 18))
					}
					Image(systemName: "paperplane")
						.font(.system(size: 28))
						.foregroundColor(.white)
				}
				.padding(.horizontal, 16)
				.padding(.vertical, 8)
			}.ignoresSafeArea(.keyboard, edges: .bottom)
		}
    }
	
	private var content: AnyView {
		switch story.contents[0].type {
			case .image(url: let url):
				return AnyView(
					KFImage(url)
						.resizable()
						.aspectRatio(contentMode: .fill)
						.clipShape(Rectangle())
						.frame(width: screenWidth, height: screenWidth * 16 / 9)
						
				)
			case .video(url: _):
				return AnyView(Rectangle())
		}
	}
}

struct StoryContentView_Previews: PreviewProvider {
	
	static let story = Story.mockedData[0]
	
    static var previews: some View {
		StoryContentView(story: story)
    }
}
