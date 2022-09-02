//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Alex Krzywicki on 25.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Views
    let display = UITextField()
    let mainVStack = UIStackView()
    
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
        configureAppearance()
    }

    func updateDisplay(text: String) {
        
    }
}

// MARK: Private Actions
private extension ViewController {
    func configureAppearance() {
        setupMainVStack()
        setupButtons()
    }

    func setupMainVStack() {
        mainVStack.axis = .vertical
        mainVStack.frame = CGRect(x: 0, y: 60, width: Constants.screenWidth, height: Constants.screenHeight)
        mainVStack.alignment = .fill
        mainVStack.distribution = .fill
        mainVStack.backgroundColor = .systemGreen
        view.addSubview(mainVStack)
        
    }
    
    func createHStack(yPosition: Int) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.frame = CGRect(x: 0, y: yPosition, width: Int(Constants.screenWidth), height: 80)
        return stack
    }
    func createButton(order: Int, title: String) -> UIButton {

        let button = UIButton(frame: CGRect(x: (0+Int(Constants.screenWidth/4)*order+2), y: 0, width: Int(Constants.screenWidth)/4-2, height: 80))

        button.setTitle(title, for: .normal)
        button.backgroundColor = .systemBlue
        
        return button
    }
    
    func setupButtons() {
        let line1 = createHStack(yPosition: 0)
        line1.addSubview(createButton(order: 0, title: "button 1"))
        line1.addSubview(createButton(order: 1, title: "button 2"))
        line1.addSubview(createButton(order: 2, title: "button 3"))
        line1.addSubview(createButton(order: 3, title: "button 4"))
        mainVStack.addSubview(line1)
        
        let line2 = createHStack(yPosition: 82)
        line2.addSubview(createButton(order: 0, title: "button 5"))
        line2.addSubview(createButton(order: 1, title: "button 6"))
        line2.addSubview(createButton(order: 2, title: "button 7"))
        line2.addSubview(createButton(order: 3, title: "button 8"))
        mainVStack.addSubview(line2)
        
        let line3 = createHStack(yPosition: 164)
        line3.addSubview(createButton(order: 0, title: "button 9"))
        line3.addSubview(createButton(order: 1, title: "button 10"))
        line3.addSubview(createButton(order: 2, title: "button 11"))
        line3.addSubview(createButton(order: 3, title: "button 12"))
        mainVStack.addSubview(line3)
        
        let line4 = createHStack(yPosition: 246)
        line4.addSubview(createButton(order: 0, title: "button 9"))
        line4.addSubview(createButton(order: 1, title: "button 10"))
        line4.addSubview(createButton(order: 2, title: "button 11"))
        line4.addSubview(createButton(order: 3, title: "button 12"))
        mainVStack.addSubview(line4)
        
        let line5 = createHStack(yPosition: 328)
        line5.addSubview(createButton(order: 0, title: "button 13"))
        line5.addSubview(createButton(order: 1, title: "button 14"))
        line5.addSubview(createButton(order: 2, title: "button 15"))
        line5.addSubview(createButton(order: 3, title: "button 16"))
        mainVStack.addSubview(line5)
    
    }
}

