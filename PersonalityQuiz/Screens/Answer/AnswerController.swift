//
//  AnswerController.swift
//  PersonalityQuiz
//
//  Created by Stanislav Lemeshaev on 16.02.2022.
//  Copyright © 2022 slemeshaev. All rights reserved.
//

import UIKit

class AnswerController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private weak var animalLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    // MARK: - Properties
    private let answers: [Answer]
    
    // MARK: - Init
    init?(_ coder: NSCoder, _ answers: [Answer]) {
        self.answers = answers
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
    }
    
    // MARK: - IBActions
    @IBAction private func finishTestTapped(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "WelcomeView", bundle: nil)
        let welcomeVC = storyBoard.instantiateViewController(withIdentifier: "WelcomeVC") as! WelcomeController
        welcomeVC.modalPresentationStyle = .fullScreen
        present(welcomeVC, animated: true, completion: nil)
    }
    
    // MARK: - Private
    private func calculatePersonalityResult() {
        let frequencyOfAnswers = answers.reduce(into: [:]) { counts, answers in
            counts[answers.type, default: 0] += 1
        }
        
        if let mostCommonAnswer = frequencyOfAnswers.sorted(by: { $0.value > $1.value }).first?.key {
            updateUI(with: mostCommonAnswer)
        }
    }
    
    private func updateUI(with animal: AnimalType) {
        animalLabel.text = "You are \(animal.rawValue)!"
        descriptionLabel.text = animal.definition
    }
}
