//
//  GMMemImage.swift
//  GetMem
//
//  Created by Polina on 19.02.2024.
//

import SwiftUI
struct GMMemImage: View {
    let url: String
    var body: some View {
        AsyncImage(
            url: URL(string: url),
            transaction: Transaction(animation: .easeInOut(duration: 0.5))
        ) { phase in
            switch phase {
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
        .background(.red)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
//        AsyncImage(url: URL(string: url)) { image in
//            image
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .animation(.easeInOut(duration: 0.3), value: url)
//        } placeholder: {
//            ProgressView()
//        }
//        //.frame(height: 250)
//        .background(.red)
//        .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
    
    }
}

//#Preview {
//    GMMemImage(url: "https://i.imgflip.com/1nck6k.jpg")
//        .padding()
//}
