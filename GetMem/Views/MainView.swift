//
//  ContentView.swift
//  GetMem
//
//  Created by Polina on 18.02.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    @ObservedObject var persistanceController: PersistanceController
    
    var body: some View {
        VStack(spacing: 16){
            CleanRepeatButton {viewModel.reloadViews()}
            GMTextField(text: $viewModel.text)
                .padding(.horizontal, 8)
            GMButton(action: {
                viewModel.showAlertIfTextIsEmpty(text: viewModel.text)
            }, actionToAniamate:{
                viewModel.opacityStack = (viewModel.opacityStack == 0 && viewModel.isAnimatedQuestionStack) ? 1 : 0
            }, isEnabled: viewModel.doneDownload)
            VStack(spacing: 0){
                QuestinsStack()
                    .opacity(viewModel.showingImage ? 0 : 1)
                    .onTapGesture {
                        viewModel.showImage()
                        withAnimation(.smooth(duration: 1.5)) {
                            viewModel.opacityImage = ( viewModel.opacityImage == 0) ? 1 : 0
                        }
                    }
                    .overlay {
                        VStack(spacing: 8){
                            GMMemImage(url: viewModel.imageURL)
                            Spacer()
                            GMLikeDislikeButtons {
                                persistanceController.add(question: viewModel.text, image: viewModel.imageURL)
                            } actionDisLike: {
                                viewModel.getRandomMem()
                            }
                        }
                        .opacity(viewModel.showingImage ? viewModel.opacityImage : 0)
                    }
            }
            .opacity(viewModel.showingStackQuestion ? viewModel.opacityStack : 0)
            //Spacer()
        }
        .alert(isPresented: $viewModel.showingAlert) {
            Alert(title: Text("Ошибка"), message: Text("Введите ваш вопрос"), dismissButton: .default(Text("Ok")))
        }
        .padding()
    }
}

