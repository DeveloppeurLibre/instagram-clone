//
//  CameraViewer.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 19/12/2020.
//

import UIKit
import SwiftUI

struct CameraViewer: UIViewControllerRepresentable {
	
	@Environment(\.presentationMode) private var presentationMode
	private let screenWidth = UIScreen.main.bounds.width
	private let aspectRatio: CGFloat = 16.0 / 9.0
	private let controller: UIImagePickerController
	
	init() {
		controller = UIImagePickerController()
		controller.sourceType = .camera
		controller.showsCameraControls = false
	}
	
	func makeUIViewController(context: Context) -> UIImagePickerController {
		return controller
	}
	
	func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
		
	}
	
	func takePicture() {
		controller.takePicture()
	}
}
