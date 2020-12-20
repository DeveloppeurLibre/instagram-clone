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
	@State private var takenPicture: UIImage?
	@State private var cameraViewer: CameraViewer?
	@Environment(\.presentationMode) var presentationMode
	private let scale: CGFloat = 3.0 / 4.0 * 16.0 / 9.0
	private let screenSize = UIScreen.main.bounds
	
    var body: some View {
		ZStack(alignment: .top) {
			Rectangle()
				.foregroundColor(.black)
				.ignoresSafeArea()
			Group {
				if let takenPicture = takenPicture {
					Image(uiImage: takenPicture)
						.resizable()
						.aspectRatio(contentMode: .fill)
				} else if let cameraViewer = cameraViewer {
					cameraViewer
						.scaleEffect(scale, anchor: .top)
				}
			}
			.frame(width: screenSize.width, height: screenSize.width * 16 / 9)
			.cornerRadius(10)
			VStack {
				HStack() {
					Spacer()
					Image(systemName: "xmark")
						.foregroundColor(.white)
						.imageScale(.large)
						.onTapGesture {
							if let _ = takenPicture {
								takenPicture = nil
							} else {
								presentationMode.wrappedValue.dismiss()
							}
						}
				}
				.padding()
				Spacer()
				if let _ = takenPicture {
					HStack {
						Spacer()
						Button(action: {
							// FIXME: (Quentin Cornu) Add story to AppState
							presentationMode.wrappedValue.dismiss()
						}, label: {
							ZStack {
								RoundedRectangle(cornerRadius: 20)
									.frame(width: 100, height: 40)
									.foregroundColor(.white)
								HStack {
									Text("Add")
										.fontWeight(.semibold)
									Image(systemName: "arrow.right")
								}
								.foregroundColor(.black)
							}
						})
					}
					.padding(8)
				} else {
					Button(action: {
						cameraViewer?.takePicture()
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
				}
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
		.onAppear {
			createCameraViewer()
		}
    }
	
	private func createCameraViewer() {
		cameraViewer = CameraViewer(selectedImage: $takenPicture)
	}
}

struct ContentCreationView_Previews: PreviewProvider {
    static var previews: some View {
        ContentCreationView()
    }
}
