//
//  TutorialView.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 11/07/23.
//

import SwiftUI

struct TutorialView: View {
    
    @ObservedObject var viewModel: TutorialViewModel
    @State var animating = false
    
    init(viewModel: TutorialViewModel = TutorialViewModel()) {
        self.viewModel = viewModel
        
    }
    
    var tutorialInfo: TutorialViewModel.TutorialCardInfo {
        viewModel.currentInfo
    }
    
    
    
    var body: some View {
        ZStack {
            Image("settignsBackgroundView")
                .resizable()
                .frame(width: 332, height: 497)
            
            
            VStack(spacing: 17) {
                Text(tutorialInfo.title)
                    .font(.custom("Fredoka", size: 34))
                    .fontWeight(.bold)
                    .padding(.top, 30)
                
                VStack {
                    imageView
                        .frame(height: 181)
             
                    
                    Text(tutorialInfo.description)
                        .font(.custom("Fredoka", size: 20))
                        .padding(.horizontal, 45)
                        .layoutPriority(1001)
                }
                
                
               
                VStack(spacing: 18) {
                    pageControl
                    
                    bottomButtons
                }
                .padding(.top)

               
                
                
            }
            .padding(.top, 30)
        }

    }
    
    
    
    private var imageView: some View {
        ZStack {
            if viewModel.isThirdCardInfoSelected {
                Image("brilho")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 280.HAdapted, height: 280.VAdapted)
                    .rotationEffect(Angle(degrees: animating ? 360 : 0))
                    .animation(Animation.linear(duration: 20).repeatForever(autoreverses: false), value: animating)
                    .onAppear {
                        animating = true
                    }
                
                Image("emblema-capivara")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200.HAdapted, height: 200.VAdapted)
            } else {
                Image(tutorialInfo.imageURL)
            }
        }
    }
    
    private var pageControl: some View {
        HStack(spacing: 18) {
            Circle()
                .frame(width: 13)
                .foregroundStyle(viewModel.isFirstCardInfoSelected ? .black : .white)
            Circle()
                .frame(width: 13)
                .foregroundStyle(viewModel.isSecondCardInfoSelected ? .black : .white)
            Circle()
                .frame(width: 13)
                .foregroundStyle(viewModel.isThirdCardInfoSelected ? .black : .white)
        }
    }
    
    
    private var bottomButtons: some View {
        HStack(spacing: 8) {
            if !viewModel.isFirstCardInfoSelected {
                Button(action: {
                    withAnimation {
                        viewModel.backButtonPressed()
                    }
                }) {
                    Image("back-button")
                }
                
                Button(action: {
                    withAnimation {
                        
                        viewModel.continueButtonPressed()
                    }
                }) {
                    Image("nextlevel-button")
                        .resizable()
                        .frame(width: 193, height: 59)
                }
                
                
            } else {
                Button(action: {
                    withAnimation {
                        viewModel.continueButtonPressed()
                    }
                    
                }) {
                    Image("nextlevel-button")
                        .resizable()
                        .frame(width: 193, height: 59)
                }
                
                
            }
        }
    }
}





struct TutorialView_Preview: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
