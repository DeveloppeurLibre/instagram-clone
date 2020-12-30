//
//  LoginView.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 29/12/2020.
//

import SwiftUI

struct LoginView: View {
	
	@State private var userName: String = ""
	@State private var password: String = ""
	@State private var disabled: Bool = true
	@State private var isShowingSignUp = false
	
    var body: some View {
		VStack {
			Spacer()
			Image("instagram_header")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(height: 60)
			VStack(spacing: 32) {
				VStack(alignment: .trailing, spacing: 16) {
					CustomTextField(placeholder: "User name", text: $userName) { _ in
						updateDisability()
					}
					CustomTextField(placeholder: "Password", text: $password, onChange: { value in
						updateDisability()
					}, isSecured: true)
					Button(action: {
						
					}, label: {
						Text("Forgot password?")
							.font(.footnote)
							.fontWeight(.semibold)
					})
				}
				CustomButton(text: "Log In", action: {
					print("\(userName)")
				}, disabled: $disabled)
				HStack(spacing: 24) {
					Rectangle()
						.frame(height: 0.5)
					Text("OR")
						.font(.subheadline)
						.fontWeight(.semibold)
					Rectangle()
						.frame(height: 0.5)
				}
				.foregroundColor(.gray)
				HStack {
					Image("facebook_button")
						.resizable()
						.renderingMode(.template)
						.frame(width: 20, height: 20)
						.cornerRadius(3.0)
					Text("Log In With Facebook")
						.font(.subheadline)
						.fontWeight(.semibold)
				}
				.foregroundColor(.blue)
			}
			.padding()
			Spacer()
			BottomBanner(indication: "Don't have an account?", actionText: "Sign Up") {
				isShowingSignUp.toggle()
			}
			.sheet(isPresented: $isShowingSignUp, content: {
				SignupView()
			})
		}
    }
	
	private func updateDisability() {
		if !userName.isEmpty && !password.isEmpty {
			disabled = false
		} else {
			disabled = true
		}
	}
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
