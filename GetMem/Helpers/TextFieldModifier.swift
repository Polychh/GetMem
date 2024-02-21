//
//  TextFieldModifier.swift
//  GetMem
//
//  Created by Polina on 18.02.2024.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    var roundCorners: CGFloat
    var gradientFirstColor: Color
    var gradientSecondColor: Color
    var textColor: Color

    func body(content: Content) -> some View {
        content
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [gradientFirstColor, gradientSecondColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(roundCorners)
            .padding(3)
            .foregroundColor(textColor)
            .overlay(RoundedRectangle(cornerRadius: roundCorners)
                .stroke(LinearGradient(gradient: Gradient(colors: [gradientFirstColor, gradientSecondColor]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2))
            .font(.body)
            .shadow(radius: 10)
    }
}
