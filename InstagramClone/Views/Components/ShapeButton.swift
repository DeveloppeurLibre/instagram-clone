//
//  ShapeButton.swift
//  InstagramClone
//
//  Created by Quentin Cornu on 14/12/2020.
//

import SwiftUI

struct ShapeButton: View {
    
    let systemName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Image(systemName: systemName)
                .foregroundColor(.primary)
                .imageScale(.large)
        })
    }
}

struct ShapeButton_Previews: PreviewProvider {
        
    static var previews: some View {
        ShapeButton(
            systemName: "ellipsis",
            action: {}
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
