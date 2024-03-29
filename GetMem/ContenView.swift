//
//  ContenView.swift
//  GetMem
//
//  Created by Polina on 20.02.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var persistanceController = PersistanceController()
    var body: some View {
        TabView{
            Group{
                MainView(persistanceController: persistanceController)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Главная")
                    }
                FavoriteMemsView(persistanceController: persistanceController)
                    .tabItem {
                        Image(systemName: "star")
                        Text("Избранное")
                    }
            }
            .padding(8)
        }
        .accentColor(.purple)
    }
}

