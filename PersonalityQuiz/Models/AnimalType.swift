//
//  AnimalType.swift
//  PersonalityQuiz
//
//  Created by Stanislav Lemeshaev on 09.03.2022.
//  Copyright © 2022 slemeshaev. All rights reserved.
//

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "You are a dog"
        case .cat:
            return "You are a cat"
        case .rabbit:
            return "You are a rabbit"
        case .turtle:
            return "You are a turtle"
        }
    }
}
