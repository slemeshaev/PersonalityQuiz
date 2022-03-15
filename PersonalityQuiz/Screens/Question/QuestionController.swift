//
//  QuestionController.swift
//  PersonalityQuiz
//
//  Created by Stanislav Lemeshaev on 28.01.2022.
//  Copyright © 2022 slemeshaev. All rights reserved.
//

import UIKit

class QuestionController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private weak var singleStackView: UIStackView!
    @IBOutlet private weak var multipleStackView: UIStackView!
    @IBOutlet private weak var rangedStackView: UIStackView!
    
    // MARK: - Properties
    private var questionIndex = 2
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - Private
    private func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        
        let question = Question.list[questionIndex]
        
        switch question.type {
        case .single:
            singleStackView.isHidden = false
        case .multiple:
            multipleStackView.isHidden = false
        case .range:
            rangedStackView.isHidden = false
        }
        
        // TODO: change to segue to results screen
        questionIndex = (questionIndex + 1) % Question.list.count
    }
}
