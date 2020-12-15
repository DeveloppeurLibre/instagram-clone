//
//  FillableShapeButton.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 15/12/2020.
//

import SwiftUI

struct FillableShapeButton: View {
    
    let systemName: String
    let fillColor: Color
    @Binding var isFilled: Bool
    
    var body: some View {
        Button(action: {
            isFilled.toggle()
        }, label: {
            Image(systemName: "\(systemName)\(isFilled ? ".fill" : "")")
                .foregroundColor(isFilled ? fillColor : .primary)
                .imageScale(.large)
        })
    }
}

struct FillableShapeButton_Previews: PreviewProvider {
        
    @State static var isFilled = false
    
    static var previews: some View {
        FillableShapeButton(
            systemName: "heart",
            fillColor: .red,
            isFilled: $isFilled
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
