//
//  ViewController.swift
//  Calculator
//
//  Created by Nicholas Bittencourt  on 2019-10-03.
//  Copyright © 2019 Nicholas Bittencourt . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var currentNumber:Double = 0
    var storedNumber:Double = 0
    var operation = 0
    var isPerformingOperation:Bool = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


    @IBAction func onDigitPressed(_ sender: Any) {
        
        let tag = (sender as! UIButton).tag
        
        if isPerformingOperation {
            
            isPerformingOperation = false
            resultLabel.text = String(tag)
            currentNumber = Double(resultLabel.text!)!
            
        } else {
            
                resultLabel.text = resultLabel.text! + String(tag)
                currentNumber = Double(resultLabel.text!)!
            
            
            print("Current Number: ")
            print(currentNumber)
            print("Stored Number: ")
            print(storedNumber)
        }
        
    }
    
    @IBAction func clear(_ sender: Any) {
        
        resultLabel.text = ""
        currentNumber = 0
        storedNumber = 0
        operation = 0
    }
    
    
    @IBAction func operatorPressed(_ sender: Any) {
        
        let tag = (sender as! UIButton).tag
        
        switch tag {
            
        //division
        case 20:
            isPerformingOperation = true;
            storedNumber = currentNumber
            resultLabel.text = "÷"
            operation = tag
        //*
        case 21:
            isPerformingOperation = true;
            storedNumber = currentNumber
            resultLabel.text = "×"
            operation = tag
        //-
        case 22:
            isPerformingOperation = true;
            storedNumber = currentNumber
            resultLabel.text = "-"
            operation = tag
        //+
        case 23:
            isPerformingOperation = true;
            storedNumber = currentNumber
            resultLabel.text = "+"
            operation = tag
        //=
        case 24:
            equals(tag: operation)
        default:
            storedNumber = currentNumber
            resultLabel.text = ""
        }
        
    }
    
    func equals(tag: Int) {
        
        switch tag {
            
            //division
            case 20:
                currentNumber = storedNumber / currentNumber
            //*
            case 21:
                currentNumber *= storedNumber
            //-
            case 22:
                currentNumber = storedNumber - currentNumber
            //+
            case 23:
                currentNumber += storedNumber
            default:
                storedNumber = currentNumber
        }
        
        resultLabel.text = String(currentNumber)
    }
}

