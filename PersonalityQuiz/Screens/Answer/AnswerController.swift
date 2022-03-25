//
//  AnswerController.swift
//  PersonalityQuiz
//
//  Created by Stanislav Lemeshaev on 16.02.2022.
//  Copyright © 2022 slemeshaev. All rights reserved.
//

import UIKit

class AnswerController: UIViewController {
    // MARK: - Properties
    let answers: [Answer]
    
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
    
    // MARK: - Private
    private func calculatePersonalityResult() {
        let frequencyOfAnswers = answers.reduce(into: [:]) { counts, answers in
            counts[answers.type, default: 0] += 1
        }
        
        let frequencyOfAnswersSorted = frequencyOfAnswers.sorted { $0.value > $1.value }
        let mostCommonAnswer = frequencyOfAnswersSorted.first?.key
        print("### MostCommonAnswer: \(String(describing: mostCommonAnswer))")
    }
}
