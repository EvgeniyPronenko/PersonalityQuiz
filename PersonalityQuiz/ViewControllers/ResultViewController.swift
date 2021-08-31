//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov and Evgeniy Pronenko :) on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответствии с этим животным
    // 4. Избавиться от кнопки возврата на предыдущий экран
    @IBOutlet weak var resultPicture: UILabel!
    @IBOutlet weak var resultText: UILabel!
    
    var dogAnswersCount = 0
    var turtleAnswersCount = 0
    var catAnswersCount = 0
    var rabbitAnswersCount = 0
    
    var answersChosen: [Answer] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for answer in answersChosen {
            if answer.animal == Animal.dog { dogAnswersCount += 1}
            if answer.animal == Animal.turtle { turtleAnswersCount += 1}
            if answer.animal == Animal.cat { catAnswersCount += 1}
            if answer.animal == Animal.rabbit { rabbitAnswersCount += 1}
        }
        
        if dogAnswersCount > turtleAnswersCount ||
           dogAnswersCount > catAnswersCount ||
           dogAnswersCount > rabbitAnswersCount
        {
            showResult(animal: Animal.dog)
        } else if turtleAnswersCount > catAnswersCount ||
                  turtleAnswersCount > rabbitAnswersCount
        {
            showResult(animal: Animal.turtle)
        } else if catAnswersCount > rabbitAnswersCount {
            showResult(animal: Animal.cat)
        } else {
            showResult(animal: Animal.rabbit)
        }
        print("dog \(dogAnswersCount)")
        print("turtle \(turtleAnswersCount)")
        print("cat \(catAnswersCount)")
        print("rabbit \(rabbitAnswersCount)")
        
    }
    
    private func showResult(animal: Animal) {
        resultPicture.text = String(animal.rawValue)
        resultText.text = animal.definition
    }
}
