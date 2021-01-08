//
//  LocalPostsInteractor.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 28/12/2020.
//

import Foundation

class PostsInteractorImplementation: PostsInteractor {
	
	private let postsRepository: PostsRepository
	private let usersRepository: UsersRepository
	
	init(postsRepository: PostsRepository, usersRepository: UsersRepository) {
		self.postsRepository = postsRepository
		self.usersRepository = usersRepository
	}
	
	func loadPosts(completion: @escaping ([Post]) -> Void) {
		postsRepository.loadPosts { response in
			switch response {
				case .failure:
					completion([])
				case .success(response: let restPosts):
					var posts = [Post]()
					for restPost in restPosts {
						self.usersRepository.loadUser(fromId: restPost.userID) { response in
							switch response {
								case .failure(error: let error):
									print(error.localizedDescription)
								case .success(response: let restUser):
									if let restUser = restUser {
										let newPost = PostMapper.map(
											restPost: restPost,
											restUser: restUser,
											comments: self.loadComments(restPost: restPost),
											isLiked: false, // FIXME (Quentin Cornu) To fix when connected user ID is available
											isSaved: false // FIXME (Quentin Cornu) To fix when connected user ID is available
										)
										posts.append(newPost)
										// TODO: (Quentin Cornu) Improve the efficiency of this function. For now, it calls the completion each time a new post is loaded.
										completion(posts)
									}
							}
						}
					}
			}
		}
	}
	
	func addComment(comment: Comment, in post: Post) {
		post.comments.append(comment)
	}
	
	private func loadComments(restPost: RestPost) -> [Comment] {
		var comments = [Comment]()
		for restComment in restPost.comments {
			usersRepository.loadUser(fromId: restComment.userID) { response in
				switch response {
					case .failure(error: let error):
						print(error.localizedDescription)
					case .success(response: let restUser):
						if let restUser = restUser {
							let newComment = CommentMapper.map(
								restComment: restComment,
								restUser: restUser
							)
							comments.append(newComment)
						}
				}
			}
		}
		return comments
	}
}
