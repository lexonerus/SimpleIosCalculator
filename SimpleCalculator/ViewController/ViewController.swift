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
    var service: CalcService?
    
    // MARK: Config appearance
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
       get {
          return .portrait
       }
    }
    
    // MARK: ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        service = CalcService(displayView: self)
        display.text = "0"
    }

    func updateDisplay(text: String) {
        DispatchQueue.main.async {
            self.display.text = text
        }
    }
}

// MARK: Private Actions
private extension ViewController {
    @IBAction func acPressed(_ sender: Any) {
        service?.acAction()
    }
    @IBAction func changeSign(_ sender: Any) {
        service?.changeSign()
    }
    @IBAction func percent(_ sender: Any) {
        service?.percent()
    }
    @IBAction func division(_ sender: Any) {
        service?.division()
    }
    @IBAction func multiplication(_ sender: Any) {
        service?.multiplication()
    }
    @IBAction func substraction(_ sender: Any) {
        service?.substraction()
    }
    @IBAction func addition(_ sender: Any) {
        service?.addition()
    }
    @IBAction func result(_ sender: Any) {
        service?.makeResult()
    }
    @IBAction func dot(_ sender: Any) {
        service?.dot()
    }
    @IBAction func swipeLeftOnDisplay(_ sender: Any) {
        service?.removeCharacter()
    }
    @IBAction func numberAction(_ sender: UIButton) {
        service?.numberAction(number: sender.tag)
    }
}

