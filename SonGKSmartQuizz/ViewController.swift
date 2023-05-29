//
//  ViewController.swift
//  SonGKSmartQuizz
//
//  Created by BVU on 5/20/23.
//  Copyright © 2023 BVU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBSegueAction func start(_ coder: NSCoder, sender: Any?) -> QuizzViewController? {
        if let button = sender as? UIButton {
            let buttonText = button.titleLabel?.text
            let quizzViewController = QuizzViewController(coder: coder)
            quizzViewController?.level = buttonText
            
            return quizzViewController
        }
        return nil;
    }
    
    @IBAction func selectLevel(_ sender: UIButton) {
        performSegue(withIdentifier: "startGame", sender: sender)
    }
    
    @IBAction func unwindToQuizIntroduction(segue:
    UIStoryboardSegue) {
     
    }
    
}

