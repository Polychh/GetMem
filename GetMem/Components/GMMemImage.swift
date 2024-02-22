//
//  GMMemImage.swift
//  GetMem
//
//  Created by Polina on 19.02.2024.
//

import SwiftUI
struct GMMemImage: View {
    var url: String
    
    var body: some View {
        AsyncImage(
            url: URL(string: url),
            transaction: Transaction(animation: .easeInOut(duration: 0.5))
        ) { phase in
            switch phase {
            case .empty:
                ZStack {
                    Color.purple.opacity(0.1)
                    ProgressView()
                }
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            default:
                Image("error")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
    }
}
