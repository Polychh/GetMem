//
//  QuestinsStack.swift
//  GetMem
//
//  Created by Polina on 19.02.2024.
//

import SwiftUI

struct QuestinsStack: View {
    var body: some View {
        GeometryReader { proxy in
            HStack{
                ForEach(0..<3, id: \.self) { _ in
                    Image("question1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: proxy.size.width * 0.33)
                }
            }
        }
    }
}


