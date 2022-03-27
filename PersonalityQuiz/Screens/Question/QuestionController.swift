//
//  QuestionController.swift
//  PersonalityQuiz
//
//  Created by Stanislav Lemeshaev on 28.01.2022.
//  Copyright © 2022 slemeshaev. All rights reserved.
//

import UIKit

protocol QuestionControllerDelegate: AnyObject {
    func questionControllerDidGetResult(answers: [Answer])
}

class QuestionController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private var singleButtons: [UIButton]!
    
    @IBOutlet private var multipleLabels: [UILabel]!
    @IBOutlet private var multipleSwitches: [UISwitch]!
    @IBOutlet private weak var multipleAnswerButton: UIButton!
    
    @IBOutlet private var rangedLabels: [UILabel]!
    @IBOutlet private var rangedSlider: UISlider!
    
    @IBOutlet private weak var singleStackView: UIStackView!
    @IBOutlet private weak var multipleStackView: UIStackView!
    @IBOutlet private weak var rangedStackView: UIStackView!
    
    @IBOutlet private weak var questionProgressView: UIProgressView!
    
    // MARK: - Properties
    private var questionIndex = 0
    
    private var currentAnswers: [Answer] {
        currentQuestion.answers
    }
    
    private var currentQuestion: Question {
        Question.list[questionIndex]
    }
    
    private var chosenAnswers = [Answer]()
    
    weak var delegate: QuestionControllerDelegate?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - IBActions
    @IBAction private func singleButtonTapped(_ sender: UIButton) {
        let index = sender.tag
        
        guard 0 <= index && index < currentAnswers.count else {
            return
        }
        
        let answer = currentAnswers[index]
        chosenAnswers.append(answer)
        
        nextQuestion()
    }
    
    @IBAction private func multipleButtonTapped(_ sender: UIButton) {
        for (index, `switch`) in multipleSwitches.enumerated() {
            if `switch`.isOn && index < currentAnswers.count {
                let answer = currentAnswers[index]
                chosenAnswers.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction private func rangedButtonTapped(_ sender: UIButton) {
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        if index < currentAnswers.count {
            let answer = currentAnswers[index]
            chosenAnswers.append(answer)
        }
        nextQuestion()
    }
    
    @IBAction private func turnSwitchTapped(_ sender: UISwitch) {
        for `switch` in multipleSwitches {
            if `switch`.isOn {
                multipleAnswerButton.isEnabled = true; break
            } else {
                multipleAnswerButton.isEnabled = false
            }
        }
    }
    
    // MARK: - Private
    private func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        
        let totalProgress = Float(questionIndex) / Float(Question.list.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        navigationItem.hidesBackButton = true
        
        questionLabel.text = currentQuestion.text
        rangedSlider.maximumValue = 0.9999
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStackView()
        case .multiple:
            updateMultipleStackView()
        case .range:
            updateRangedStackView()
        }
    }
    
    private func updateSingleStackView() {
        singleStackView.isHidden = false
        
        for (index, button) in singleButtons.enumerated() {
            button.setTitle(nil, for: [])
            button.tag = index
        }
        
        for (button, answer) in zip(singleButtons, currentAnswers) {
            button.setTitle(answer.text, for: [])
        }
    }
    
    private func updateMultipleStackView() {
        multipleStackView.isHidden = false
        multipleAnswerButton.isEnabled = false
        
        for label in multipleLabels {
            label.text = nil
        }
        
        for (label, answer) in zip(multipleLabels, currentAnswers) {
            label.text = answer.text
        }
    }
    
    private func updateRangedStackView() {
        rangedStackView.isHidden = false
        rangedLabels.first?.text = currentAnswers.first?.text
        rangedLabels.last?.text = currentAnswers.last?.text
    }
    
    private func nextQuestion() {
        questionIndex = questionIndex + 1
        
        if questionIndex < Question.list.count {
            updateUI()
        } else {
            delegate?.questionControllerDidGetResult(answers: chosenAnswers)
        }
    }
}
