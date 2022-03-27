//
//  UIViewController.swift
//  PersonalityQuiz
//
//  Created by Stanislav Lemeshaev on 26.03.2022.
//  Copyright © 2022 slemeshaev. All rights reserved.
//

import UIKit

extension UIViewController {
    static func loadFromStoryboard(_ identifier: String) -> Self {
        let storyboard = UIStoryboard(name: identifier, bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(identifier: identifier)
        
        return viewController as! Self
    }
    
    static func loadFromStoryboard(_ identifier: String, answers: [Answer]) -> Self {
        let storyboard = UIStoryboard(name: identifier, bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(identifier: identifier, creator: { coder -> AnswerController? in
            AnswerController(coder, answers)
        })
        
        return viewController as! Self
    }
}
