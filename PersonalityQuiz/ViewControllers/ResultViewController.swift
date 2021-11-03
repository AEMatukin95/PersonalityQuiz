//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Александр Матукин on 03.11.2021.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var resultAnimalLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var answerChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        resultAnimals()
    }
  
    private func resultAnimals() {
        
        var dictionaryAnimals: [Animal: Int] = [:]
        let animals = answerChosen.map { $0.animal }
        
        for animal in animals {
            if let typeAnimal = dictionaryAnimals[animal] {
                dictionaryAnimals.updateValue(typeAnimal + 1, forKey: animal)
            } else {
                dictionaryAnimals[animal] = 1
            }
        }
        
        let  sortedDictionaryAnimals = dictionaryAnimals.sorted {$0.value > $1.value }
        guard let resultDIctionaryAnimals = sortedDictionaryAnimals.first?.key else { return }
        updateLabels(with: resultDIctionaryAnimals)
    }
    
    private func updateLabels(with animal: Animal) {
        resultAnimalLabel.text = "Вы - \(animal.rawValue)"
        definitionLabel.text = "\(animal.definition)"
    }
}
