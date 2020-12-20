//
//  CameraCoordinator.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 19/12/2020.
//

import UIKit

class CameraCoordinator: NSObject {
	
	private var cameraViewer: CameraViewer
	
	init(cameraViewer: CameraViewer) {
		self.cameraViewer = cameraViewer
	}
}

extension CameraCoordinator: UINavigationControllerDelegate {}

extension CameraCoordinator: UIImagePickerControllerDelegate {
	func imagePickerController(_ picker: UIImagePickerController,
							   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		guard let selectedImage = info[.originalImage] as? UIImage else { return }
		self.cameraViewer.selectedImage = selectedImage
	}
}
