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
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private var singleButtons: [UIButton]!
    
    @IBOutlet private var multipleLabels: [UILabel]!
    @IBOutlet private var multipleSwitches: [UISwitch]!
    
    @IBOutlet private var rangedLabels: [UILabel]!
    
    @IBOutlet private weak var singleStackView: UIStackView!
    @IBOutlet private weak var multipleStackView: UIStackView!
    @IBOutlet private weak var rangedStackView: UIStackView!
    
    @IBOutlet private weak var questionProgressView: UIProgressView!
    
    // MARK: - Properties
    private var questionIndex = 0
    
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
        
        let question = Question.list[questionIndex]
        let answers = question.answers
        let totalProgress = Float(questionIndex) / Float(Question.list.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = question.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
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
