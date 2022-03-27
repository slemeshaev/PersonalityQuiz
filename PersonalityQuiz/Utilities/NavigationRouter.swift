//
//  NavigationRouter.swift
//  PersonalityQuiz
//
//  Created by Stanislav Lemeshaev on 26.03.2022.
//  Copyright © 2022 slemeshaev. All rights reserved.
//

import UIKit

class NavigationRouter {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let welcomeController = WelcomeController.loadFromStoryboard("WelcomeView")
        welcomeController.delegate = self
        navigationController.pushViewController(welcomeController, animated: false)
    }
}

// MARK: - WelcomeControllerDelegate
extension NavigationRouter: WelcomeControllerDelegate {
    func welcomeControllerDidStartGame() {
        let questionController = QuestionController.loadFromStoryboard("QuestionView")
        questionController.delegate = self
        navigationController.pushViewController(questionController, animated: true)
    }
}

// MARK: - QuestionControllerDelegate
extension NavigationRouter: QuestionControllerDelegate {
    func questionControllerDidGetResult(answers: [Answer]) {
        let answerController = AnswerController.loadFromStoryboard("AnswerView", answers: answers)
        answerController.delegate = self
        navigationController.pushViewController(answerController, animated: true)
    }
}

// MARK: - AnswerControllerDelegate
extension NavigationRouter: AnswerControllerDelegate {
    func answerControllerDidFinishGame() {
        navigationController.popToRootViewController(animated: true)
    }
}
