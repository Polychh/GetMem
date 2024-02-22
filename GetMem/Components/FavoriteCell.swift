//
//  FavoriteCell.swift
//  GetMem
//
//  Created by Polina on 20.02.2024.
//

import SwiftUI

struct FavoriteCell: View {
    let image: String
    let question: String
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100, alignment: .center)
                    .clipped()
            } placeholder: {
                ProgressView()
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
            VStack(alignment: .leading){
                Text(question)
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.purple)
            }
          
        }
        .padding(8)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(color: .purple, radius: 5, x: 0, y: 0))
    }
}
