//
//  FavorityMems.swift
//  GetMem
//
//  Created by Polina on 20.02.2024.
//

import SwiftUI

struct FavoriteMems: View {
    @ObservedObject var persistanceController: PersistanceController
    var body: some View {
        List{
            Section(header: Text("Любимые мемы")) {
                ForEach(persistanceController.savedEntities){ mem in
                    FavoriteCell(image: mem.imageMem ?? "", question: mem.question ?? "")
                        .listRowSeparator(.hidden)
                        .listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                    
                }
                .onDelete(perform: persistanceController.deleteMem)
            }
        }
        .listStyle(.plain)
    }
}


