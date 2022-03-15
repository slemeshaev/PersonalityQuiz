//
//  WelcomeController.swift
//  PersonalityQuiz
//
//  Created by Stanislav Lemeshaev on 23.01.2022.
//  Copyright © 2022 slemeshaev. All rights reserved.
//

import UIKit

class WelcomeController: UIViewController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction private func startGameTapped(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "QuestionView", bundle: nil)
        let questionVC = storyBoard.instantiateViewController(withIdentifier: "QuestionVC") as! QuestionController
        questionVC.modalPresentationStyle = .fullScreen
        present(questionVC, animated: true, completion: nil)
    }
    
    @IBAction private func unwind(_ segue: UIStoryboardSegue) {
        print(#line, #function)
    }
}
