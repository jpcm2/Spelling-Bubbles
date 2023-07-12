//
//  TutorialViewModel.swift
//  spelling-bubbles
//
//  Created by Lucas Migge de Barros on 11/07/23.
//

import Foundation



class TutorialViewModel: ObservableObject {
    
    struct TutorialCardInfo {
        let title: String
        let imageURL: String
        let description: String
    }
    
    @Published var currentIndex: Int
    
    var userDidfinishTutorial: () -> Void
    
    init(currentIndex: Int = 0, userDidfinishTutorial: @escaping () -> Void) {
        self.currentIndex = currentIndex
        self.userDidfinishTutorial = userDidfinishTutorial
    }
    
    var currentInfo: TutorialCardInfo {
        tutorialInfoArray[currentIndex]
    }
    
    
    var isFirstCardInfoSelected: Bool {
        currentIndex == 0 ? true : false
    }
    
    var isSecondCardInfoSelected: Bool {
        currentIndex == 1 ? true : false
    }
    
    var isThirdCardInfoSelected: Bool {
        currentIndex == 2 ? true : false
    }
    
    
    func continueButtonPressed() {
        if !isThirdCardInfoSelected {
            presentNextCard()
        } else {
            userDidfinishTutorial()
        }
        
    }
    
    func presentNextCard() {
        currentIndex += 1
    }
    
    func backButtonPressed() {
        if currentIndex >= 0 {
            currentIndex -= 1
        }
        
    }
    
    var tutorialInfoArray: [TutorialCardInfo] = [
        TutorialCardInfo(title: "Forme os nomes",
                     imageURL: "Tutorial1",
                     description: "Use as pedras para formar o nome dos objetos destacados antes que eles cheguem à margem"),
        TutorialCardInfo(title: "Ganhe Tempo!",
                     imageURL: "Tutorial2",
                     description: "Quando o lixo estiver perto da margem, agite o aparelho para afastá-lo!"),
        TutorialCardInfo(title: "Junte emblemas",
                     imageURL: "Tutorial3",
                     description: "Avance de nível, conheça diferentes paisagens e colecione emblemas")
    ]
    
}
