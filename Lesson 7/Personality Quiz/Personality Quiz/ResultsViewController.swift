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

        for response in responseTypes {
            // If the value exists add one to it otherwise initialize it to zero
            frequencyOfAnswers[response] = (frequencyOfAnswers[response]
                ?? 0) + 1
        }

        let frequentAnswersSorted = frequencyOfAnswers.sorted(by:
            { (pair1, pair2) -> Bool in
                return pair1.value > pair2.value
        })

        if let mostCommonAnswer = frequentAnswersSorted.first?.key {
            resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
            resultDefinitionLabel.text = mostCommonAnswer.definition
        }

    // let mostCommonAnswer = frequentAnswersSorted.first?.key

//      “The closure may be simplified using trailing closure syntax: using $0 and $1 as argument names and removing the implied return. Combined with retrieving the first element's key, you can simplify all of the code onto one line:”

//        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 >
//            $1.1 }.first!.key


    }

}
