//
//  ResultsViewController.swift
//  Personality Quiz
//
//  Created by Dipesh Trikam on 29/08/19.
//  Copyright © 2019 Dipesh Trikam. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var responses: [Answer]!
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
        calculatePersonalityResult()

    }

    func calculatePersonalityResult() {
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        let responseTypes = responses.map {$0.type}

        print(responseTypes)

        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response]
                ?? 0) + 1
        }

        print(frequencyOfAnswers)

        let frequentAnswersSorted = frequencyOfAnswers.sorted(by:
            { (pair1, pair2) -> Bool in
                return pair1.value > pair2.value
        })

        let mostCommonAnswer = frequentAnswersSorted.first!.key

//        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 >
//            $1.1 }.first!.key

        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }

}
