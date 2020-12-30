//
//  CustomTextField.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 29/12/2020.
//

import SwiftUI

struct CustomTextField: View {
	
	let placeholder: String
	let isSecured: Bool
	let onChange: (String) -> Void
	@Binding var text: String
	
	init(placeholder: String,
		 text: Binding<String>,
		 onChange: @escaping (String) -> Void = { _ in },
		 isSecured: Bool = false) {
		self.placeholder = placeholder
		self._text = text
		self.onChange = onChange
		self.isSecured = isSecured
	}
	
    var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 5)
				.stroke(Color.gray, lineWidth: 0.5)
				.background(Color.gray.opacity(0.05))
				.frame(height: 50)
			if isSecured {
				SecureField(placeholder, text: $text)
					.padding(.horizontal)
					.onChange(of: text, perform: onChange)
			} else {
				TextField(placeholder, text: $text)
					.padding(.horizontal)
					.onChange(of: text, perform: onChange)
			}
		}
    }
}

struct CustomTextField_Previews: PreviewProvider {
	
	@State static var text = "developpeur_libre"
	
    static var previews: some View {
		CustomTextField(placeholder: "User name", text: $text)
			.previewLayout(.sizeThatFits)
			.padding()
    }
}
