//
//  ViewController.swift
//  FlagGuessr
//
//  Created by Zach Tumbleson on 6/18/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    @IBAction func tapButton(_ sender: UIButton) {
        questionsAnswered += 1
        
        if sender.tag == correctAnswer {
            score += 1
        } else {
            if score > 0 {
                score -= 1
            }
            
            let alert = UIAlertController(title: "OOPS!", message: "That's the flag of \(countries[sender.tag])", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: .default))
            present(alert, animated: true)
        }
        
        if questionsAnswered % 10 == 0 {
            let alert = UIAlertController(title: "GAME OVER", message: "After 10 questions, your score is \(score)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { _ in self.reset() }))
            present(alert, animated: true)
            return
        }
        
        askQuestion()
    }
    
    var countries: [String] = []
    var score = 0
    var correctAnswer = 0
    var questionsAnswered = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries = [
            "estonia",
            "france",
            "germany",
            "ireland",
            "italy",
            "monaco",
            "nigeria",
            "poland",
            "russia",
            "spain",
            "uk",
            "us"
        ]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "Flag: \(countries[correctAnswer].uppercased()) Score: \(score)"
    }
    
    func reset() {
        score = 0
        questionsAnswered = 0
        self.askQuestion()
    }
}

