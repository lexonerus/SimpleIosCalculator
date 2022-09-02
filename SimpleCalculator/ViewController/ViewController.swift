//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Alex Krzywicki on 25.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Views
    
    // MARK: Properties
    var service: CalcService?
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
       get {
          return .portrait
       }
    }

    
    
    // MARK: ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        service = CalcService(displayView: self)
    }

    func updateDisplay(text: String) {
        
    }
}

// MARK: Private Actions
private extension ViewController {

}

