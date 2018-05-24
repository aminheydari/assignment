//
//  miniGameVC.swift
//  toolkit_assignment_2
//
//  Created by AMIN HEYDARI on 10/05/2018.
//  Copyright © 2018 AMIN HEYDARI. All rights reserved.
//

import UIKit

class miniGameVC: UIViewController {
    
    // connect all elements as a outlet here
    
    @IBOutlet weak var gifAnim: UIImageView!
    @IBOutlet weak var userGuessTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func Guess(_ sender: Any) {
        
        // here I use arc4random_uniform method to choose random number by system
        
        let fingerGuess = String(arc4random_uniform(6))
        
        print(fingerGuess)
        
        // check if the choosen number is right or wrong
        
        if fingerGuess == userGuessTextField.text {
            resultLabel.text = "You're right"
        }else {
            resultLabel.text = "Wrong! it was a " + fingerGuess
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
