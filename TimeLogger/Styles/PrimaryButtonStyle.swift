//
//  PrimaryButtonStyle.swift
//  TimeLogger
//
//  Created by Carlos Evelo on 1/9/24.
//

import Foundation
import SwiftUI

struct PrimaryButtonStyle : ButtonStyle {
    var backgroundColor : Color
    
    init(backgroundColor: Color) {
        self.backgroundColor = backgroundColor
    }
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .foregroundColor(.gray)
                .offset(y: 5)
            Circle()
                .foregroundColor(backgroundColor)
                .offset(y: configuration.isPressed ? 5 : 0)
            configuration.label
                .offset(y: configuration.isPressed ? 5 : 0)
                .font(.system(size: 30))
                .foregroundColor(Color.white)
        }
        .frame(width: 200, height: 200)
        .shadow(radius: 10)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        Button("Button") {
            
        }
        .buttonStyle(PrimaryButtonStyle(backgroundColor: .blue))
    }
}
