//
//  CleanRepeatButton.swift
//  GetMem
//
//  Created by Polina on 19.02.2024.
//

import SwiftUI

struct CleanRepeatButton: View {
    var action: () -> Void
    var body: some View {
        HStack{
            Spacer()
            Button(action: {
               action()
            }) {
                Text(Image(systemName:"repeat"))
                    .font(.title)
            }
            .foregroundStyle(
                LinearGradient(gradient: Gradient(colors: [.orange, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
        }
    }
}

#Preview {
    CleanRepeatButton {
        print("Done clean")
    }
}
