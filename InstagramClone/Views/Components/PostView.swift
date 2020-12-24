//
//  PostView.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 14/12/2020.
//

import SwiftUI
import KingfisherSwiftUI

struct PostView: View {
    
    @ObservedObject var post: Post
    
    private let maxComments = 2
    @State private var showMore = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                KFImage(post.user.imageURL)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(post.user.name)
                        .font(.headline)
                    if let location = post.location {
                        Text(location)
                            .font(.caption)
                    }
                }
                Spacer()
                ShapeButton(systemName: "ellipsis", action: {})
            }.padding(8)
            KFImage(post.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    FillableShapeButton(systemName: "heart", fillColor: .red, isFilled: $post.isLiked)
                    ShapeButton(systemName: "message", action: {})
                    ShapeButton(systemName: "paperplane", action: {})
                    Spacer()
                    FillableShapeButton(systemName: "bookmark", fillColor: .primary, isFilled: $post.isSaved)
                }
                Text("\(post.likesCount.formattedWithSeparator) like\(post.likesCount > 1 ? "s" : "")")
                    .font(.headline)
                VStack(alignment: .leading, spacing: 0) {
                    (Text("\(post.user.name)").font(.headline) + Text(" \(post.description)")).lineLimit(showMore ? nil : 2)
                    Text(showMore ? "less" : "more")
                        .foregroundColor(.secondary)
                        .onTapGesture {
                            showMore.toggle()
                        }
                }
                if !post.comments.isEmpty {
                    Text("View all \(post.comments.count) comments")
                        .foregroundColor(.secondary)
                        .onTapGesture {
                            // FIXME: (Quentin Cornu) To handle
                        }
                }
				Text(post.date.timeAgo)
					.font(.footnote)
					.foregroundColor(.secondary)
            }.padding()
        }
    }
}

struct PostView_Previews: PreviewProvider {
    
    @State static var post1 = Post.mockedData[0]
    @State static var post2 = Post.mockedData[1]
    
    static var previews: some View {
        Group {
            PostView(post: post1)
                .previewLayout(.sizeThatFits)
            PostView(post: post2)
                .previewLayout(.sizeThatFits)
        }
    }
}
