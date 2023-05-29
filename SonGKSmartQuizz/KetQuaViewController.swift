//
//  KetQuaViewController.swift
//  SonGKSmartQuizz
//
//  Created by BVU on 5/20/23.
//  Copyright © 2023 BVU. All rights reserved.
//

import UIKit

class KetQuaViewController: UIViewController {

    @IBOutlet weak var labelLevel: UILabel!
    @IBOutlet weak var labelAnswered: UILabel!
    @IBOutlet weak var labelCorrectAnswer: UILabel!
    @IBOutlet weak var labelStar: UILabel!
    var level: String?
    var answered: Int = 0
    var correctAnswer: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        labelLevel.text = level
        labelAnswered.text = String(answered) + "/10"
        labelCorrectAnswer.text = ("\(correctAnswer)/10")
        if(correctAnswer >= 10){
            labelStar.text = "⭐️⭐️⭐️⭐️⭐️"
        }
        else if(correctAnswer >= 8){
            labelStar.text = "⭐️⭐️⭐️⭐️"
        }else if(correctAnswer >= 6){
            labelStar.text = "⭐️⭐️⭐️"
        }else if(correctAnswer >= 4){
            labelStar.text = "⭐️⭐️"
        }else if(correctAnswer >= 3){
             labelStar.text = "⭐️"
        }else{
            labelStar.text = "Bạn chưa có sao nào"
        }
    }
    
}
