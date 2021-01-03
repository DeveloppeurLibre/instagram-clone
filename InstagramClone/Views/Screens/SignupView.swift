//
//  SignupView.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 30/12/2020.
//

import SwiftUI

struct SignupView: View {
	
	@Environment(\.presentationMode) private var presentationMode
	@State private var emailAddress: String = ""
	@State private var password: String = ""
	@State private var passwordConfirmation: String = ""
	@State private var disabled: Bool = true
	@Environment(\.interactors) var interactors: InteractorsContainer

    var body: some View {
		VStack(spacing: 32) {
			Spacer()
			Text("Enter your Email")
				.font(.title)
			VStack(spacing: 16) {
				CustomTextField(placeholder: "Email Address", text: $emailAddress) { _ in
					updateDisability()
				}
				CustomTextField(placeholder: "Password", text: $password, onChange: { _ in
					updateDisability()
				}, isSecured: true)
				CustomTextField(placeholder: "Confirm your password", text: $passwordConfirmation, onChange: { _ in
					updateDisability()
				}, isSecured: true)
				CustomButton(text: "Next", action: {
					nextButtonPressed()
				}, disabled: $disabled)
			}
			.padding()
			Spacer()
			BottomBanner(indication: "Already have an account ?", actionText: "Sign In.") {
				presentationMode.wrappedValue.dismiss()
			}
		}
    }
	
	private func updateDisability() {
		if !emailAddress.isEmpty && !password.isEmpty && !passwordConfirmation.isEmpty {
			disabled = false
		} else {
			disabled = true
		}
	}
	
	private func nextButtonPressed() {
		guard password == passwordConfirmation else {
			// TODO: (Quentin Cornu) To handle
			return
		}
		interactors.authInteractor.signUp(withEmail: emailAddress, password: password) { (userData, error) in
			if let error = error {
				print(error.localizedDescription)
				return
			}
			if let _ = userData {
				// TODO: (Quentin Cornu) To handle
			}
		}
	}
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
