//
//  GMButton.swift
//  GetMem
//
//  Created by Polina on 18.02.2024.
//

import SwiftUI

struct GMButton: View {
    var action: () -> Void
    var actionToAniamate: () -> Void
    var isEnabled: Bool
    
    var body: some View {
        VStack{
            Button {
                action()
                withAnimation(Animation.spring().speed(0.2)) {
                    actionToAniamate()
                }
                
            } label: {
                Text("Получить предсказание!")
                    .frame(maxWidth: 200, maxHeight: 30)
                    .foregroundColor(.white)
            }
            .buttonBorderShape(.capsule)
            .buttonStyle(.borderedProminent)
            .tint(.purple).opacity(0.9)
            .controlSize(.regular)
            .disabled(!isEnabled)
        }
    }
}


