//
//  WelcomeController.swift
//  PersonalityQuiz
//
//  Created by Stanislav Lemeshaev on 23.01.2022.
//  Copyright © 2022 slemeshaev. All rights reserved.
//

import UIKit

protocol WelcomeControllerDelegate: AnyObject {
    func welcomeControllerDidStartGame()
}

class WelcomeController: UIViewController {
    
    weak var delegate: WelcomeControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func startGameTapped(_ sender: UIButton) {
        delegate?.welcomeControllerDidStartGame()
    }
}
