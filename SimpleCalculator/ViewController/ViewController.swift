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
    private let calc = Calculator.shared
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
        currentNumber = "0"
        updateDisplay(text: currentNumber)
    }
    
    func makeCalculation(operation: Operation) {
        if currentOperation != .noAction {
            if currentNumber != "0" {
                secondNumber = Double(currentNumber)!
                currentNumber = "0"
                
                switch currentOperation {
                case .addition:
                    result = "\(firstNumber + secondNumber)"
                case .substraction:
                    result = "\(firstNumber - secondNumber)"
                case .multiplication:
                    result = String(firstNumber * secondNumber)
                case .division:
                    result = String(firstNumber / secondNumber)
                case .changeSign:
                    print(0)
                case .percent:
                    print(0)
                default:
                    print(9)
                }
                
                firstNumber = Double(result)!
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                    result = String(Int(Double(result)!))
                }
                updateDisplay(text: result)
                
            }
        } else {
            firstNumber         = Double(currentNumber)!
            currentNumber       = "0"
            currentOperation    = operation
        }
    }
    
    // MARK: Button actions
    @IBAction func acPressed(_ sender: Any) {
        acAction()
    }
    @IBAction func changeSign(_ sender: Any) {
        currentOperation = .changeSign
        makeCalculation(operation: currentOperation)
    }
    @IBAction func percent(_ sender: Any) {
        currentOperation = .percent
        makeCalculation(operation: currentOperation)
    }
    @IBAction func division(_ sender: Any) {
        currentOperation = .division
        makeCalculation(operation: currentOperation)
    }
    @IBAction func multiplication(_ sender: Any) {
        currentOperation = .multiplication
        makeCalculation(operation: currentOperation)
    }
    @IBAction func substraction(_ sender: Any) {
        currentOperation = .substraction
        makeCalculation(operation: currentOperation)
    }
    @IBAction func addition(_ sender: Any) {
        currentOperation = .addition
        makeCalculation(operation: currentOperation)
        updateDisplay(text: "0")
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

