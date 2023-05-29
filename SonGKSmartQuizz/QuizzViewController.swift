//
//  QuizzViewController.swift
//  SonGKSmartQuizz
//
//  Created by BVU on 5/20/23.
//  Copyright © 2023 BVU. All rights reserved.
//

import UIKit

class QuizzViewController: UIViewController {

    @IBOutlet weak var labelDokho: UILabel!
    @IBOutlet weak var labelTongThoiGian: UILabel!
    @IBOutlet weak var labelThoiGianCau: UILabel!
    @IBOutlet weak var labelSoCau: UILabel!
    var level: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        labelDokho.text = level
        labelSoCau.text = "10"
        
        switch level {
        case "Slow":
            labelTongThoiGian.text = "100"
            labelThoiGianCau.text = "10"
        case "Normal":
            labelTongThoiGian.text = "60"
            labelThoiGianCau.text = "6"
        case "Fast":
            labelTongThoiGian.text = "30"
            labelThoiGianCau.text = "3"
        default:
            break
        }
    }
    
    @IBSegueAction func startQuizz(_ coder: NSCoder, sender: Any?) -> QuestionViewController? {
        switch level {
        case "Slow":
            let questionViewController = QuestionViewController(coder: coder)
            questionViewController?.totalTime = 100
            questionViewController?.timePerQues = 10
            questionViewController?.level = self.level
            return questionViewController
        case "Normal":
            let questionViewController = QuestionViewController(coder: coder)
            questionViewController?.totalTime = 60
            questionViewController?.timePerQues = 6
            
            return questionViewController
        case "Fast":
            let questionViewController = QuestionViewController(coder: coder)
            questionViewController?.totalTime = 30
            questionViewController?.timePerQues = 3
            
            return questionViewController
        default:
           
            break
        }
        return nil
    }
    
    
}
