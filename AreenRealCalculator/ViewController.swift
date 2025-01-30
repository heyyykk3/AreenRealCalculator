//
//  ViewController.swift
//  AreenRealCalculator
//
//  Created by english on 2025-01-28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textbox: UITextField!
    
    @IBOutlet weak var plusminus: UIButton!
    @IBOutlet weak var AC: UIButton!
    @IBOutlet weak var x: UIButton!
    
    @IBOutlet weak var equal: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var multiply: UIButton!
    @IBOutlet weak var divide: UIButton!
    
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var dot: UIButton!
    @IBOutlet weak var zero: UIButton!
    
    
    var currentInput: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textbox.text = "0"    }
    
    @IBAction func zero(_ sender: Any) {   if currentInput == "0" {
        return
    }
    currentInput += "0"
    textbox.text = currentInput
    }
    
    @IBAction func dot(_ sender: Any) {let components = currentInput.split(separator: " ")
        if let lastComponent = components.last, lastComponent.contains(".") {
            return}
    }
    
    
    
    
    @IBAction func numberTapped(_ sender: UIButton) {
        guard let numberText = sender.titleLabel?.text else { return }

          if currentInput == "0" || currentInput == "" {
              currentInput = numberText
          } else {
              currentInput += numberText
          }

          textbox.text = currentInput
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let operatorText = sender.titleLabel?.text else { return }
        
        if !currentInput.isEmpty {
            currentInput += " \(operatorText) "
            textbox.text = currentInput
        }
    }
    @IBAction func equalsTapped(_ sender: UIButton) {
        let expression = NSExpression(format: currentInput.replacingOccurrences(of: "×", with: "*").replacingOccurrences(of: "÷", with: "/"))
        
        if let result = expression.expressionValue(with: nil, context: nil) as? Double {
            currentInput = String(result)
            textbox.text = currentInput
        }
    }
    @IBAction func clearTapped(_ sender: UIButton) {
           currentInput = ""
           textbox.text = "0"
       }
       
       @IBAction func plusMinusTapped(_ sender: UIButton) {
           if let value = Double(currentInput) {
               currentInput = String(value * -1)
               textbox.text = currentInput
           }
       }

}
