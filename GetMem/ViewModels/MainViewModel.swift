//
//  MainViewModel.swift
//  GetMem
//
//  Created by Polina on 18.02.2024.
//

import Foundation
import Combine
final class MainViewModel: ObservableObject{
    @Published var memsArray: [Meme] = []
    @Published var doneDownload: Bool = false
    @Published var imageURL: String = ""
    @Published var showingAlert: Bool = false
    @Published var showingStackQuestion: Bool = false
    @Published var showingImage: Bool = false
    @Published var isAnimatedQuestionStack: Bool = false
    @Published var text: String = ""
    @Published var opacityStack = 0.0
    @Published var opacityImage = 0.0
    
    private let network = NetworkService()
    
    init(){
        fetchMemsData()
    }
    
    func showAlertIfTextIsEmpty(text: String){
          if text.isEmpty{
              showingAlert = true
              isAnimatedQuestionStack = false
          } else{
              isAnimatedQuestionStack = true
              getRandomMem()
              showingStackQuestion = true
          }
      }
    
    func showImage(){
        showingImage = true
    }
    
    func reloadViews(){
        memsArray = []
        showingStackQuestion = false
        showingImage = false
        isAnimatedQuestionStack = false
        doneDownload = false
        text = ""
        opacityStack = 0.0
        opacityImage = 0.0
        fetchMemsData()
    }
    
    func getRandomMem(){
        guard let mem = memsArray.randomElement() else { print("error"); return}
        imageURL = mem.url
    }
    
    private func fetchMemsData(){
        Task{ @MainActor in
            do{
                memsArray = try await network.request()
                doneDownload = true
            } catch{
                print(error.localizedDescription)
            }
        }
    }
}
