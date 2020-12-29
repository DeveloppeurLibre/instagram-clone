//
//  NewCommentTextField.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 29/12/2020.
//

import SwiftUI
import KingfisherSwiftUI

struct NewCommentTextField: View {
	
	let imageURL: URL
	@Binding var comment: String
	let onPostAction: () -> Void
	
	private let textFieldHeight: CGFloat = 40.0
	private let emojis = ["😍", "😂", "🤓", "❤️", "😇", "😘", "🔥", "😎"]
	
    var body: some View {
		VStack {
			HStack {
				ForEach(emojis, id: \.self) { emoji in
					Spacer()
					EmojiButton(emoji: emoji, comment: $comment)
					Spacer()
				}
			}
			HStack {
				KFImage(imageURL)
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: textFieldHeight, height: textFieldHeight)
					.clipShape(Circle())
				ZStack {
					RoundedRectangle(cornerRadius: textFieldHeight / 2.0)
						.stroke(Color.init(white: 0.6), lineWidth: 0.5)
						.frame(height: textFieldHeight)
					HStack {
						TextField("Add a comment...", text: $comment)
							.font(.system(size: 14))
							.padding()
						if !comment.isEmpty {
							Button(action: onPostAction, label: {
								Text("Post")
									.fontWeight(.semibold)
									.foregroundColor(.blue)
									.padding(.trailing)
									
							})
						}
					}
				}
			}
		}
    }
	
	private struct EmojiButton: View {

		let emoji: String
		@Binding var comment: String
		
		var body: some View {
			Button(action: {
				comment = comment + emoji
			}, label: {
				Text(emoji)
					.font(.system(size: 28))
			})
		}
	}
}

struct NewCommentTextField_Previews: PreviewProvider {
	
	@State static var comment = ""
	
    static var previews: some View {
		NewCommentTextField(
			imageURL: User.mockedData[0].imageURL!,
			comment: $comment,
			onPostAction: {}
		)
    }
}
