//
//  GMTextField.swift
//  GetMem
//
//  Created by Polina on 18.02.2024.
//

import SwiftUI

struct GMTextField: View {
    var text: Binding <String>
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Задай свой вопрос!").font(.title2)
                .foregroundColor(.purple).opacity(0.8)
            HStack {
                TextField("", text: text, prompt: Text("Введите ваш вопрос").foregroundColor(.white))  
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
            }
            .modifier(TextFieldModifier(roundCorners: 10, gradientFirstColor: .orange, gradientSecondColor: .purple, textColor: .white))
        }
    }
}


