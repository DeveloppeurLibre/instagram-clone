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
	@State private var indexOfDisplayedContent = 0 {
		didSet {
			story.contents[indexOfDisplayedContent].isNew = false
		}
	}
	@Environment(\.presentationMode) var presentationMode
	private let screenWidth = UIScreen.main.bounds.size.width
	
    var body: some View {
		ZStack(alignment: .top) {
			Rectangle()
				.ignoresSafeArea()
			ZStack(alignment: .top) {
				content
				HStack {
					Button(action: {
						showPreviousStory()
					}, label: {
						Rectangle()
							.frame(width: 80, height: screenWidth * 16 / 9)
							.foregroundColor(.clear)
					})
					Spacer()
					Button(action: {
						showNextStory()
					}, label: {
						Rectangle()
							.frame(width: 80, height: screenWidth * 16 / 9)
							.foregroundColor(.clear)
					})
				}
				VStack(spacing: 4) {
					HStack(spacing: 4) {
						ForEach(0...story.contents.count - 1, id: \.self) { index in
							Rectangle()
								.frame(height: 1)
								.foregroundColor(.init(white: 0.9, opacity: index <= indexOfDisplayedContent ? 0.9 : 0.5))
						}
					}
					.padding(8)
					HStack {
						KFImage(story.user.imageURL)
							.resizable()
							.aspectRatio(contentMode: .fill)
							.frame(width: 40, height: 40)
							.clipShape(Circle())
						Text(story.user.name)
							.font(.headline)
							.foregroundColor(.white)
						Text(story.contents[indexOfDisplayedContent].publicationDate.timeAgo)
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
					.padding(.horizontal)
				}
				.background(
					LinearGradient(
						gradient: Gradient(
							colors: [Color(white: 0, opacity: 0.5), .clear]),
						startPoint: .top,
						endPoint: .bottom
					)
				)
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
		.onAppear(perform: {
			redirectToFirstNewContent()
		})
    }
	
	private var content: AnyView {
		switch story.contents[indexOfDisplayedContent].type {
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
	
	private func showPreviousStory() {
		guard indexOfDisplayedContent > 0 else {
			presentationMode.wrappedValue.dismiss()
			return
		}
		indexOfDisplayedContent -= 1
		story.objectWillChange.send()
	}
	
	private func showNextStory() {
		guard indexOfDisplayedContent < story.contents.count - 1 else {
			presentationMode.wrappedValue.dismiss()
			return
		}
		indexOfDisplayedContent += 1
		story.objectWillChange.send()
	}
	
	private func redirectToFirstNewContent() {
		for index in 0..<story.contents.count {
			if story.contents[index].isNew {
				indexOfDisplayedContent = index
				return
			}
		}
	}
}

struct StoryContentView_Previews: PreviewProvider {
	
	static let story = Story.mockedData[0]
	
    static var previews: some View {
		StoryContentView(story: story)
    }
}
