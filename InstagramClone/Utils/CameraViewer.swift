//
//  CameraViewer.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 19/12/2020.
//

import UIKit
import SwiftUI

struct CameraViewer: UIViewControllerRepresentable {
	
	@Binding var selectedImage: UIImage?
	@Environment(\.presentationMode) var presentationMode
	private let screenWidth = UIScreen.main.bounds.width
	private let aspectRatio: CGFloat = 16.0 / 9.0
	private var controller: UIImagePickerController
	
	init(selectedImage: Binding<UIImage?>) {
		self._selectedImage = selectedImage
		controller = UIImagePickerController()
	}
	
	func makeUIViewController(context: Context) -> UIImagePickerController {
		controller.sourceType = .camera
		controller.showsCameraControls = false
		controller.delegate = context.coordinator
		return controller
	}
	
	func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
		
	}
	
	func makeCoordinator() -> CameraCoordinator {
		return CameraCoordinator(cameraViewer: self)
	}
	
	func takePicture() {
		controller.takePicture()
	}
}
