//
//  QuestionViewController.swift
//  SonGKSmartQuizz
//
//  Created by BVU on 5/20/23.
//  Copyright © 2023 BVU. All rights reserved.
//

import UIKit


class QuestionViewController: UIViewController {

    var totalTime: Int = 0
    var timePerQues: Int = 0
    var level: String?
    var timer: Timer?
    var questions: [Question] = [
        Question(
            id: 1,
            image: "001-koala.png",
            text: "What is this?",
            answer: [
                "cat",
                "koala",
                "panda",
                "snake"
            ],
            correctAswer: 1),
        Question(
            id: 2,
            image: "001-panda.png",
            text: "What is this?",
            answer: [
                "cat",
                "koala",
                "panda",
                "snake"
            ],
            correctAswer: 2),
        Question(
            id: 3,
            image: "002-snail.png",
            text: "What is this?",
            answer: [
                "snail",
                "koala",
                "panda",
                "snake"
            ],
            correctAswer: 0),
        Question(
            id: 4,
            image: "002-turtle.png",
            text: "What is this?",
            answer: [
                "cat",
                "koala",
                "panda",
                "turtle"
            ],
            correctAswer: 3),
        Question(
            id: 5 ,
            image: "003-fox.png",
            text: "What is this?",
            answer: [
                "cat",
                "fox",
                "panda",
                "snake"
            ],
            correctAswer: 1),
        Question(
            id: 6,
            image: "003-tiger.png",
            text: "What is this?",
            answer: [
                "tiger",
                "koala",
                "panda",
                "snake"
            ],
            correctAswer: 0),
        Question(
            id: 7,
            image: "004-cat.png",
            text: "What is this?",
            answer: [
                "cat",
                "koala",
                "panda",
                "snake"
            ],
            correctAswer: 0),
        Question(
            id: 8,
            image: "004-owl.png",
            text: "What is this?",
            answer: [
                "owl",
                "koala",
                "panda",
                "snake"
            ],
            correctAswer: 0),
        Question(
            id: 9,
            image: "005-crab.png",
            text: "What is this?",
            answer: [
                "cat",
                "koala",
                "panda",
                "crab"
            ],
            correctAswer: 3),
        Question(
            id: 10,
            image: "005-whale.png",
            text: "What is this?",
            answer: [
                "cat",
                "whale",
                "panda",
                "snake"
            ],
            correctAswer: 1),
        Question(
            id: 11,
            image: "006-elephant.png",
            text: "What is this?",
            answer: [
                "cat",
                "koala",
                "elephant",
                "snake"
            ],
            correctAswer: 2),
        Question(
            id: 12,
            image: "007-bee.png",
            text: "What is this?",
            answer: [
                "bee",
                "koala",
                "panda",
                "snake"
            ],
            correctAswer: 0),
        Question(
            id: 13,
            image: "008-snake.png",
            text: "What is this?",
            answer: [
                "cat",
                "koala",
                "panda",
                "snake"
            ],
            correctAswer: 3),
        Question(
            id: 14,
            image: "009-hen.png",
            text: "What is this?",
            answer: [
                "cat",
                "koala",
                "panda",
                "hen"
            ],
            correctAswer: 3),
        Question(
            id: 15,
            image: "010-penguin.png",
            text: "What is this?",
            answer: [
                "penguin",
                "koala",
                "panda",
                "snake"
            ],
            correctAswer: 0),
        
    ]
    
    @IBOutlet weak var answerBtn1: UISwitch!
    @IBOutlet weak var answerBtn2: UISwitch!
    @IBOutlet weak var answerBtn3: UISwitch!
    @IBOutlet weak var answerBtn4: UISwitch!
    @IBOutlet weak var labelAnswered: UILabel!
    @IBOutlet weak var labelCorrectAnswer: UILabel!
    @IBOutlet weak var labelTimePerQuest: UILabel!
    @IBOutlet weak var labelTotalTime: UILabel!
    @IBOutlet weak var labelAnswer1: UILabel!
    @IBOutlet weak var labelAnswer2: UILabel!
    @IBOutlet weak var labelAnswer3: UILabel!
    @IBOutlet weak var labelAnswer4: UILabel!
    @IBOutlet weak var labelQues: UILabel!
    @IBOutlet weak var imageQues: UIImageView!
    @IBOutlet weak var nextBtn: UIButton!
    
    var quesArray: [Question] = []
    var quesIndex = 0
    var correctAnswer = 0
    var timePerQues2 = 0
    var answered = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timePerQues2 = self.timePerQues
        while quesArray.count < 10 {
            if let randomElement = questions.randomElement(), !quesArray.contains(where: { $0.id == randomElement.id }) {
                quesArray.append(randomElement)
            }
        }
        UpdateUi()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
    }
    
    @objc func timerFired() {
        if(timePerQues2 == 0 && totalTime != 0 && quesIndex < 9){
            timePerQues2 = self.timePerQues
            if(answerBtn1.isOn || answerBtn2.isOn || answerBtn3.isOn || answerBtn4.isOn){
                checkAnswer()
            }
            quesIndex += 1
            UpdateUi()
        }
        if(timePerQues2 == 0 && quesIndex == 9){
            stopTimer()
            if(answerBtn1.isOn || answerBtn2.isOn || answerBtn3.isOn || answerBtn4.isOn){
                checkAnswer()
            }
            performSegue(withIdentifier: "showResult", sender: nil)
        }
        if(totalTime == 0){
            stopTimer()
            if(answerBtn1.isOn || answerBtn2.isOn || answerBtn3.isOn || answerBtn4.isOn){
                checkAnswer()
            }
            performSegue(withIdentifier: "showResult", sender: nil)
        }
        labelTotalTime.text = "\(totalTime)"
        labelTimePerQuest.text = "\(timePerQues2)"
        totalTime -= 1
        timePerQues2 -= 1
        
    }
    
    func UpdateUi(){
        answerBtn1.isOn = false
        answerBtn2.isOn = false
        answerBtn3.isOn = false
        answerBtn4.isOn = false
        labelCorrectAnswer.text = String(correctAnswer)
        labelAnswered.text = String(answered)
        imageQues.image = UIImage(named: quesArray[quesIndex].image)
        labelQues.text = quesArray[quesIndex].text
        labelAnswer1.text = quesArray[quesIndex].answer[0]
        labelAnswer2.text = quesArray[quesIndex].answer[1]
        labelAnswer3.text = quesArray[quesIndex].answer[2]
        labelAnswer4.text = quesArray[quesIndex].answer[3]
        
    }
    
    @IBAction func select1(_ sender: UISwitch) {
        if sender.isOn{
            answerBtn2.isOn = false
            answerBtn3.isOn = false
            answerBtn4.isOn = false
        
        }
    }
    @IBAction func select2(_ sender: UISwitch) {
        if sender.isOn{
            answerBtn1.isOn = false
            answerBtn3.isOn = false
            answerBtn4.isOn = false
        
        }
    }
    @IBAction func select3(_ sender: UISwitch) {
        if sender.isOn{
            answerBtn1.isOn = false
            answerBtn2.isOn = false
            answerBtn4.isOn = false
        
        }
    }
    @IBAction func select4(_ sender: UISwitch) {
        if sender.isOn{
            answerBtn1.isOn = false
            answerBtn2.isOn = false
            answerBtn3.isOn = false
        
        }
    }
    
    
    func checkAnswer(){
        var answer: Int?
        
        if(answerBtn1.isOn == true){
            answer = 0
        }
        else if(answerBtn2.isOn == true){
            answer = 1
        }
        else if(answerBtn3.isOn == true){
            answer = 2
        }
        else if(answerBtn4.isOn == true){
            answer = 3
        }else{
            return
        }
        answered += 1
        
        if(answer == quesArray[quesIndex].correctAswer){
            correctAnswer += 1
        }
            
    }
    
    func stopTimer(){
        timer?.invalidate()
        timer = nil
    }
    
    
    @IBAction func next(_ sender: Any) {
        timePerQues2 = self.timePerQues
    
        if(quesIndex == 8){
            nextBtn.setTitle("Finish", for: .normal)
        }
        if(quesIndex == 9){
            performSegue(withIdentifier: "showResult", sender: nil)
            timer?.invalidate()
            timer = nil
            return
        }
        
        checkAnswer()
        
        quesIndex+=1
        
        UpdateUi()
    }
    
    
    @IBSegueAction func showResult(_ coder: NSCoder, sender: Any?) -> KetQuaViewController? {
        let resultViewController = KetQuaViewController(coder: coder)
        resultViewController?.correctAnswer = self.correctAnswer
        resultViewController?.level = self.level ?? "slow"
        resultViewController?.answered = self.answered
        return resultViewController
    }
    
    
 
}
