//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Alex Krzywicki on 25.07.2022.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Outlets for UI
    @IBOutlet weak var display: UITextField!
    
    // MARK: Properties
    private var currentOperation = Operation.noAction
    private var currentNumber   = "0"
    private var firstNumber     = 0.0
    private var secondNumber    = 0.0
    private var isDouble        = false
    private var result          = ""
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
       get {
          return .portrait
       }
    }
    
    // MARK: App lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        display.text = currentNumber
    }

    func updateDisplay(text: String) {
        DispatchQueue.main.async {
            self.display.text = text
        }
    }
    
    func afterOperation() {
        updateDisplay(text: result)
        firstNumber = Double(result)!
        currentNumber = result
    }
    
    func numberPressed(number: Int) {
        if currentNumber != "0" {
            currentNumber.append(String(number))
            updateDisplay(text: currentNumber)
        } else {
            currentNumber = String(number)
            updateDisplay(text: currentNumber)
        }
    }
    
    func acAction() {
        firstNumber = 0.0
        secondNumber = 0.0
        currentOperation = .noAction
        currentNumber = ""
        result = ""
        updateDisplay(text: currentNumber)
        print(
        """
        current number = \(currentNumber)
        first = \(firstNumber)
        second = \(secondNumber)
        result = \(result)
        """
        )
        updateDisplay(text: "0")
    }
    
    func makeCalculation(operation: Operation) {
        
       
        if currentOperation != .noAction {
            
            if currentNumber != "" {
                secondNumber = Double(currentNumber)!
                
                switch operation {
                case .noAction:
                    print("No action")
                case .addition:
                    result = String(firstNumber + secondNumber)
                    //afterOperation()
                case .substraction:
                    result = String(firstNumber - secondNumber)
                    //afterOperation()
                case .division:
                    result = String(firstNumber / secondNumber)
                    //afterOperation()
                case .multiplication:
                    result = String(firstNumber * secondNumber)
                    //afterOperation()
                case .changeSign:
                    print("Change sign")
                case .percent:
                    print("Percent")
                }
                
                firstNumber = Double(result)!
                if Double(result)!.truncatingRemainder(dividingBy: 1) == 0 {
                    result = String(Int(Double(result)!))
                }
                currentNumber = result
                updateDisplay(text: currentNumber)
                currentOperation = .noAction
                

            }

        } else {
            firstNumber = Double(currentNumber) ?? 0.0
            currentNumber = ""
            updateDisplay(text: "")
            currentOperation = operation
        }
        
        print(
        """
        current number = \(currentNumber)
        first = \(firstNumber)
        second = \(secondNumber)
        result = \(result)
        """
        )

    }
    
    // MARK: Button actions
    @IBAction func acPressed(_ sender: Any) {
        acAction()
    }
    @IBAction func changeSign(_ sender: Any) {
        var temp = currentNumber
        if temp.contains("-") {
            let sign = ["-"]
            temp = String(temp.filter { !sign.contains(String($0)) })
            print(temp)
            updateDisplay(text: temp)
            currentNumber = temp
        } else {
            temp = "-" + currentNumber
            print(temp)
            updateDisplay(text: temp)
            currentNumber = temp
        }
    }
    @IBAction func percent(_ sender: Any) {
        if Int(currentNumber)! > 0 {
            currentNumber = String(Double(currentNumber)! / 100)
            updateDisplay(text: currentNumber)
            result = currentNumber
            firstNumber = Double(result)!
        }
    }
    @IBAction func division(_ sender: Any) {
        makeCalculation(operation: .division)
    }
    @IBAction func multiplication(_ sender: Any) {
        makeCalculation(operation: .multiplication)
    }
    @IBAction func substraction(_ sender: Any) {
        if (currentNumber == "0") || (currentNumber == "") {
            currentNumber = "-"
            updateDisplay(text: currentNumber)
        } else {
            makeCalculation(operation: .substraction)
        }
    }
    @IBAction func addition(_ sender: Any) {
        makeCalculation(operation: .addition)
    }
    @IBAction func result(_ sender: Any) {
        makeCalculation(operation: currentOperation)
    }
    @IBAction func dot(_ sender: Any) {
        if currentNumber.contains(".") {
            return
        } else {
            currentNumber += "."
            updateDisplay(text: currentNumber)
        }
    }
    
    
    
    
    // MARK: Number buttons
    @IBAction func zero(_ sender: Any) {
        numberPressed(number: 0)
    }
    @IBAction func one(_ sender: Any) {
        numberPressed(number: 1)
    }
    @IBAction func two(_ sender: Any) {
        numberPressed(number: 2)
    }
    @IBAction func three(_ sender: Any) {
        numberPressed(number: 3)
    }
    @IBAction func four(_ sender: Any) {
        numberPressed(number: 4)
    }
    @IBAction func five(_ sender: Any) {
        numberPressed(number: 5)
    }
    @IBAction func six(_ sender: Any) {
        numberPressed(number: 6)
    }
    @IBAction func seven(_ sender: Any) {
        numberPressed(number: 7)
    }
    @IBAction func eight(_ sender: Any) {
        numberPressed(number: 8)
    }
    @IBAction func nine(_ sender: Any) {
        numberPressed(number: 9)
    }
    
}

