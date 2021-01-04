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
	@State private var errorMessage = ""
	@State private var isShowingMainTabView = false
	@Environment(\.interactors) var interactors: InteractorsContainer

    var body: some View {
		NavigationView {
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
				Text(errorMessage)
					.foregroundColor(.red)
				Spacer()
				BottomBanner(indication: "Already have an account ?", actionText: "Sign In.") {
					presentationMode.wrappedValue.dismiss()
				}
				NavigationLink(
					destination: MainTabView().navigationBarHidden(true),
					isActive: $isShowingMainTabView,
					label: { Text("") }
				)
				.hidden()
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
			errorMessage = "The two passwords must be the same"
			return
		}
		interactors.authInteractor.signUp(withEmail: emailAddress, password: password) { (userData, error) in
			if let error = error {
				errorMessage = error.localizedDescription
				return
			}
			if let _ = userData {
				isShowingMainTabView.toggle()
			}
		}
	}
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
