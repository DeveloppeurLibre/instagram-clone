//
//  CustomButton.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 29/12/2020.
//

import SwiftUI

struct CustomButton: View {
	
	let text: String
	let action: () -> Void
	@Binding var disabled: Bool
	
	init(text: String, action: @escaping () -> Void, disabled: Binding<Bool>) {
		self.text = text
		self.action = action
		self._disabled = disabled
	}
	
    var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 5.0)
				.frame(height: 50)
				.foregroundColor(disabled ? Color.blue.opacity(0.7) : Color.blue)
			Button(action: action, label: {
				Text(text)
					.foregroundColor(.white)
					.fontWeight(.semibold)
			})
			.disabled(disabled)
		}
    }
}

struct CustomButton_Previews: PreviewProvider {
	
	@State static var abled = true
	@State static var disabled = false
	
    static var previews: some View {
		Group {
			CustomButton(text: "Test Button", action: {}, disabled: $abled)
			CustomButton(text: "Test Disabled Button", action: {}, disabled: $disabled)
		}
		.previewLayout(.sizeThatFits)
		.padding()
	}
}
