//
//  ViewController.swift
//  WhatMemeAreYou
//
//  Created by Swift on 10.09.2022.
//

import UIKit

class QuestionsViewController: UIViewController {
    //MARK: - IBOutlets

    @IBOutlet var questionLabel: UILabel!

    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!

    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwithes: [UISwitch]!



    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var ranedSider: UISlider!

    @IBOutlet var questionProressView: UIProgressView!

    // MARK: - Private Properties
    private let questions = Question.getQuestions()
    private var answerChosen: [Answer] = []
    private var questionIndex = 0 // Индекс текущего вопросв

    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }

    // MARK: - IBActions
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        guard let currentIndx = singleButtons.firstIndex(of: sender) else { return }
    }
    @IBAction func multipleAnswerButtonPressed() {
    }

    @IBAction func rangedAnswerButtonPressed() {
    }

}

//MARK: - User Interface
extension QuestionsViewController {
    private func updateUI(){
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        let currentQuestion = questions[questionIndex]

        questionLabel.text = currentQuestion.title

        let totalProgress = Float(questionIndex) / Float(questions.count)

        questionProressView.setProgress(totalProgress, animated: true)

        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"

        showCurrentAnswers(for: currentQuestion.type)
    }

    private func showCurrentAnswers(for type: ResponseType) {
        switch type {
        case .single:
            showSingleStackView(with: currentAnswers)
        case .multiple:
            break
        case .ranged:
            break
        }
    }

    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false

        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.title, for: .normal)
        }
    }
}
