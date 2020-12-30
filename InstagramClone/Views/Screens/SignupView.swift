//
//  SignupView.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 30/12/2020.
//

import SwiftUI

struct SignupView: View {
	
	@Environment(\.presentationMode) private var presentationMode
	
    var body: some View {
		VStack {
			BottomBanner(indication: "Already have an account ?", actionText: "Sign In.") {
				presentationMode.wrappedValue.dismiss()
			}
		}
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
