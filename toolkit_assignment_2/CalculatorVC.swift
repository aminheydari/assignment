//
//  CalculatorVC.swift
//  toolkit_assignment_2
//
//  Created by AMIN HEYDARI on 10/05/2018.
//  Copyright © 2018 AMIN HEYDARI. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {
    
    
    // to make a calclator operation we need enum which I make here
    
    enum Operation:String {
        case Add = "+"
        case Subtract = "-"
        case Divide = "/"
        case Multiply = "*"
        case Empty = "Empty"
    }
    
    
    @IBOutlet weak var outoutLbl: UILabel!
    
    // variable which I need to do operation
    
    // this one is for a number which be pressed
    var pressingNumber = ""
    // left operant for first number
    var leftValue = ""
    // right operant for second number
    var rightValue = ""
    // for showing result
    var result = ""
    // for current operation
    var recentOperation:Operation = .Empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // when application run output label shows number 0
        outoutLbl.text = "0"
        
    }
    
    
    @IBAction func number(_ sender: UIButton) {
        
        // this function means when user click each number according to the tag which button should works.
        pressingNumber += "\(sender.tag)"
        //to display number in output:
        outoutLbl.text = pressingNumber
    }
    
    // this function will reset all the information
    
    @IBAction func allClear(_ sender: UIButton) {
        pressingNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        recentOperation = .Empty
        outoutLbl.text = "0"
    }
    
    // this function will put dot
    
    @IBAction func dot(_ sender: UIButton) {
        pressingNumber += "."
        outoutLbl.text = pressingNumber
    }
    
    // this function is for when user click on equal button
    
    @IBAction func equal(_ sender: UIButton) {
        operation(operation: recentOperation)
    }
    
    // this function is for when user click on add button
    
    @IBAction func add(_ sender: UIButton) {
        operation(operation: .Add)
    }
    
     // this function is for when user click on subtract button
    
    @IBAction func subtract(_ sender: UIButton) {
        operation(operation: .Subtract)
    }
    
     // this function is for when user click on multiply button
    
    @IBAction func multiply(_ sender: UIButton) {
        operation(operation: .Multiply)
    }
    
     // this function is for when user click on divide button
    
    @IBAction func divide(_ sender: UIButton) {
        operation(operation: .Divide)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // here is the main function to doing operation
    
    func operation(operation: Operation) {
        
        // check if current operation is not equal to Null
        if recentOperation != .Empty {
            
            // check for empty string
            
            if pressingNumber != "" {
                
                // turn to right value
                
                rightValue = pressingNumber
                pressingNumber = ""
                
                // here I start to performing calculation
                
                if recentOperation == .Add {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                }else if recentOperation == .Subtract {
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                }else if recentOperation == .Multiply {
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                }else if recentOperation == .Divide {
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
                leftValue = result
                if(Double(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                    result = "\(Int(Double(result)!))"
                }
                outoutLbl.text = result
            }
            
            recentOperation = operation
            
            // this is the operator after left
            
        }else{
            leftValue = pressingNumber
            pressingNumber = ""
            recentOperation = operation
        }
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
