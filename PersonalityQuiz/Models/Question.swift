//
//  Question.swift
//  PersonalityQuiz
//
//  Created by Stanislav Lemeshaev on 09.03.2022.
//  Copyright © 2022 slemeshaev. All rights reserved.
//

struct Question {
    let text: String
    let type: ResponseType
    let answers: [Answer]
    
    static let list: [Question] = [
        Question(text: "What kind of food do you prefer?", type: .single, answers: [
            Answer(text: "Carrot", type: .rabbit),
            Answer(text: "Fish", type: .cat),
            Answer(text: "Corn", type: .turtle),
            Answer(text: "Steak", type: .dog),
        ]),
        Question(text: "What do you like to do?", type: .multiple, answers: [
            Answer(text: "Eat", type: .dog),
            Answer(text: "Swim", type: .turtle),
            Answer(text: "Read", type: .rabbit),
            Answer(text: "Sleep", type: .cat),
        ]),
        Question(text: "Do you like car trips?", type: .range, answers: [
            Answer(text: "Hate", type: .cat),
            Answer(text: "Don't mind", type: .rabbit),
            Answer(text: "Like", type: .turtle),
            Answer(text: "Love", type: .dog),
        ]),
    ]
}
