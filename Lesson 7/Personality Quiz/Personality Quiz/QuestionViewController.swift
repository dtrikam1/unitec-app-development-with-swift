//
//  QuestionViewController.swift
//  Personality Quiz
//
//  Created by Dipesh Trikam on 29/08/19.
//  Copyright © 2019 Dipesh Trikam. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!


    var questions: [Question] = [
        Question(text: "Which food do you like the most?",
                 type:.multiple,
                 answers: [
                    Answer(text: "Steak", type: .dog),
                    Answer(text: "Fish", type: .cat),
                    Answer(text: "Carrots", type: .rabbit),
                    Answer(text: "Corn", type: .turtle)
            ]),

        Question(text: "Which activities do you enjoy?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Swimming", type: .turtle),
                    Answer(text: "Sleeping", type: .cat),
                    Answer(text: "Cuddling", type: .rabbit),
                    Answer(text: "Eating", type: .dog)
            ]),

        Question(text: "How much do you enjoy car rides?",
                 type: .multiple,
                 answers: [
                    Answer(text: "I dislike them", type: .cat),
                    Answer(text: "I get a little nervous",
                           type: .rabbit),
                    Answer(text: "I barely notice them",
                           type: .turtle),
                    Answer(text: "I love them", type: .dog)
            ])
    ]

    var answersChosen: [Answer] = []

    var questionIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        resetGame()
        updateUI()
    }

    func resetGame() {
        questionIndex = 0
        answersChosen = []
    }

    func updateUI() {
//        singleStackView.isHidden = true
//        multipleStackView.isHidden = true
//        rangedStackView.isHidden = true
//
        navigationItem.title = "Question #\(questionIndex+1)"

//
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        questionLabel.text = currentQuestion.text
//
//        switch currentQuestion.type {
//        case .single:
//            singleStackView.isHidden = false
//        case .multiple:
//            multipleStackView.isHidden = false
//        case .ranged:
//            rangedStackView.isHidden = false
//        }

        multipleStackView.isHidden = false

        updateMultipleStack(using: currentAnswers)
    }

    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }

    @IBAction func multipleAnswerButtonPressed(_ sender: Any) {
        let currentAnswers = questions[questionIndex].answers

        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }

        nextQuestion()
    }

    func nextQuestion() {
        questionIndex += 1

        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as!
            ResultsViewController
            resultsViewController.responses = answersChosen
        }
    }

    @IBAction func unwindToQuizIntroduction(segue: UIStoryboardSegue) {

    }
}
