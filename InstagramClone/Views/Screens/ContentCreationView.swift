//
//  ContentCreationView.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 19/12/2020.
//

import SwiftUI

struct ContentCreationView: View {
	
	@State private var sourceType: UIImagePickerController.SourceType = .camera
	@State private var selectedContentType: ContentType = .story
	private let scale: CGFloat = 3.0 / 4.0 * 16.0 / 9.0
	private let screenSize = UIScreen.main.bounds
	
    var body: some View {
		ZStack(alignment: .top) {
			Group {
				CameraViewer()
					.scaleEffect(scale, anchor: .top)
			}
			.frame(width: screenSize.width, height: screenSize.width * 16 / 9)
			.cornerRadius(10)
			VStack {
				HStack() {
					Spacer()
					Image(systemName: "xmark")
						.imageScale(.large)
				}
				.padding()
				Spacer()
				Button(action: {
					
				}, label: {
					ZStack {
						Circle()
							.foregroundColor(.white)
							.frame(width: 75, height: 75)
						Circle()
							.stroke(Color.white, lineWidth: 5)
							.frame(width: 85, height: 85)
					}
				})
				.padding()
				Picker("contentType", selection: $selectedContentType) {
					ForEach(ContentType.allCases) { type in
						Text(type.rawValue.capitalized)
							.tag(type)
					}
				}
				.pickerStyle(SegmentedPickerStyle())
				.frame(width: 200)
				.padding()
			}
		}
    }
}

struct ContentCreationView_Previews: PreviewProvider {
    static var previews: some View {
        ContentCreationView()
    }
}
