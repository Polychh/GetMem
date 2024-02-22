//
//  GMLikeButton.swift
//  GetMem
//
//  Created by Polina on 19.02.2024.
//

import SwiftUI

struct GMLikeDislikeButtons: View {
    var actionLike: () -> Void
    var actionDisLike: () -> Void
    
    var body: some View {
        HStack{
            Button(action: {
                actionDisLike()
            }) {
                Text(Image(systemName: "hand.thumbsdown"))
                    .font(.system(size: 50))
            }
            .padding(8)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            Spacer()
            Button(action: {
                actionLike()
            }) {
                Text(Image(systemName:"hand.thumbsup"))
                    .font(.system(size: 50))
            }
            .padding(8)
            .background(.green)
            .foregroundColor(.white)
            .clipShape(Circle())
        }
    }
}

