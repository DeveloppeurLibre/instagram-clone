//
//  CommentListView.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 28/12/2020.
//

import SwiftUI
import KingfisherSwiftUI

struct CommentListView: View {
	
	@ObservedObject var post: Post
	@State private var comment: String = ""
	
	@Environment(\.interactors) var interactors: InteractorsContainer
	
    var body: some View {
		VStack {
			List {
				ForEach(post.comments) { comment in
					HStack(alignment: .top) {
						KFImage(comment.user.imageURL)
							.resizable()
							.aspectRatio(contentMode: .fill)
							.frame(width: 35, height: 35)
							.clipShape(Circle())
						VStack(alignment: .leading, spacing: 8) {
							Text(comment.text)
							HStack {
								Text(comment.date.timeAgo)
								Text("\(comment.numberOfLikes) like\(comment.numberOfLikes > 1 ? "s" : "")")
									.fontWeight(.semibold)
							}
							.font(.caption)
							.foregroundColor(.gray)
						}
						Image(systemName: "heart\(comment.isLiked ? ".fill" : "")")
							.foregroundColor(comment.isLiked ? .red : .gray)
							.imageScale(.small)
							.onTapGesture {
								if comment.isLiked {
									comment.numberOfLikes -= 1
								} else {
									comment.numberOfLikes += 1
								}
								comment.isLiked.toggle()
								post.objectWillChange.send()
							}
					}
					.padding(.vertical, 8)
				}
			}
			// FIXUP: (Quentin Cornu) Use url of connected user
			NewCommentTextField(
				imageURL: User.mockedData[0].imageURL!,
				comment: $comment,
				onPostAction: {
					let newComment = Comment(
						user: User.mockedData[0],
						text: comment, date: Date(),
						numberOfLikes: 0,
						isLiked: false
					)
					interactors.postsInteractor.addComment(comment: newComment, in: post)
				}
			)
			.padding()
		}
		.navigationBarTitle("Comments")
		.navigationBarItems(trailing: Button(action: {
			// FIXME: (Quentin Cornu) To handle
		}, label: {
			Image(systemName: "paperplane")
		}))
		.foregroundColor(.primary)
		.navigationBarTitleDisplayMode(.inline)
    }
}

struct CommentListView_Previews: PreviewProvider {
	
	@State static var post = Post.mockedData[1]
	
    static var previews: some View {
		NavigationView {
			CommentListView(post: post)
		}
    }
}
