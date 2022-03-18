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
    private var chosenAnswers = [Answer]() {
        didSet {
            print(chosenAnswers)
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - IBActions
    @IBAction private func singleButtonTapped(_ sender: UIButton) {
        let answers = Question.list[questionIndex].answers
        let index = sender.tag
        
        guard 0 <= index && index < answers.count else {
            return
        }
        
        let answer = answers[index]
        chosenAnswers.append(answer)
        
        nextQuestion()
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
            updateSingleStackView()
        case .multiple:
            updateMultipleStackView()
        case .range:
            updateRangedStackView()
        }
        
        func updateSingleStackView() {
            singleStackView.isHidden = false
            
            for (index, button) in singleButtons.enumerated() {
                button.setTitle(nil, for: [])
                button.tag = index
            }
            
            for (button, answer) in zip(singleButtons, answers) {
                button.setTitle(answer.text, for: [])
            }
        }
        
        func updateMultipleStackView() {
            multipleStackView.isHidden = false
            
            for label in multipleLabels {
                label.text = nil
            }
            
            for (label, answer) in zip(multipleLabels, answers) {
                label.text = answer.text
            }
        }
        
        func updateRangedStackView() {
            rangedStackView.isHidden = false
            rangedLabels.first?.text = answers.first?.text
            rangedLabels.last?.text = answers.last?.text
        }
    }
    
    private func nextQuestion() {
        // TODO: change to segue to results screen
        questionIndex = (questionIndex + 1) % Question.list.count
    }
}
