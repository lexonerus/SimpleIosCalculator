//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Alex Krzywicki on 25.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Views
    @IBOutlet weak var display: UITextField!
    
    // MARK: Properties
    private var currentOperation = Operations.noAction
    private var currentNumber    = "0"
    private var firstNumber      = 0.0
    private var secondNumber     = 0.0
    private var isDouble         = false
    private var result           = ""
    
    // MARK: Config appearance
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
       get {
          return .portrait
       }
    }
    
    // MARK: ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        display.text = currentNumber
    }
}

// MARK: Private Methods
private extension ViewController {
    func status() {
        print(
            """
            current number = \(currentNumber)
            first = \(firstNumber)
            second = \(secondNumber)
            result = \(result)
            """
        )
    }
    
    func updateDisplay(text: String) {
        DispatchQueue.main.async {
            self.display.text = text
        }
    }

    func acAction() {
        firstNumber = 0.0
        secondNumber = 0.0
        currentOperation = .noAction
        currentNumber = ""
        result = ""
        updateDisplay(text: currentNumber)
        status()
        updateDisplay(text: "0")
    }
    func makeCalculation(operation: Operations) {
        if currentOperation != .noAction {
            
            if currentNumber != "" {
                secondNumber = Double(currentNumber)!
                
                switch operation {
                case .noAction:
                    print("No action")
                case .addition:
                    result = String(firstNumber + secondNumber)
                case .substraction:
                    result = String(firstNumber - secondNumber)
                case .division:
                    result = String(firstNumber / secondNumber)
                case .multiplication:
                    result = String(firstNumber * secondNumber)
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
        
        status()

    }
}

// MARK: Private Actions
private extension ViewController {
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
        currentNumber = String(Double(currentNumber)! / 100)
        updateDisplay(text: currentNumber)
        result = currentNumber
        firstNumber = Double(result)!
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
    @IBAction func swipeLeftOnDisplay(_ sender: Any) {
        currentNumber.removeLast()
        updateDisplay(text: currentNumber)
    }
    @IBAction func numberAction(_ sender: UIButton) {
        if currentNumber != "0" {
            currentNumber.append(String(sender.tag))
            updateDisplay(text: currentNumber)
        } else {
            currentNumber = String(sender.tag)
            updateDisplay(text: currentNumber)
        }
    }
}

