//
//  FeedHeader.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 15/12/2020.
//

import SwiftUI

struct FeedHeader: View {
	
	@State private var isPresentingContentCreationView = false
	
    var body: some View {
        HStack(spacing: 16) {
            Image("instagram_header")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 40)
            Spacer()
            ShapeButton(systemName: "plus.app", action: {
				isPresentingContentCreationView.toggle()
			})
			.fullScreenCover(isPresented: $isPresentingContentCreationView, content: {
				ContentCreationView()
			})
			ShapeButton(systemName: "heart", action: {})
			ShapeButton(systemName: "paperplane", action: {})
        }
        .padding(.horizontal, 16)
    }
}

struct FeedHeader_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FeedHeader()
            Spacer()
        }
    }
}
