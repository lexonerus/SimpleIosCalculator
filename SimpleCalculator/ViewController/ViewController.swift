//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Alex Krzywicki on 25.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Views
    // 1
    let display             = UITextField()
    let displayView         = UIView()
    let mainVStack          = UIStackView()
    
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
        // 2
        configureAppearance()
    }

    func updateDisplay(text: String) {
        DispatchQueue.main.async {
            self.display.text = text
        }
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        print(sender.tag)
        updateDisplay(text: String(sender.tag))
    }
}

// MARK: Private Actions
private extension ViewController {
    // 3
    func configureAppearance() {
        setupMainVStack()
        setupDisplay()
        setupButtons()
    }
    // 4
    func setupMainVStack() {
        mainVStack.axis = .vertical
        mainVStack.frame = CGRect(x: 0, y: 60, width: Constants.screenWidth, height: Constants.screenHeight)
        mainVStack.alignment = .fill
        mainVStack.distribution = .fill
        mainVStack.backgroundColor = .systemGreen
        view.addSubview(mainVStack)
        
    }
    // 5
    func createHStack(yPosition: Int) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.frame = CGRect(x: 0, y: yPosition, width: Int(Constants.screenWidth), height: 80)
        return stack
    }
    // 6
    func createButton(order: Int, title: String, tag: Int) -> UIButton {

        let button = UIButton(frame: CGRect(x: (0+Int(Constants.screenWidth/4)*order+2), y: 0, width: Int(Constants.screenWidth)/4-2, height: 80))

        button.setTitle(title, for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.tag = tag
        
        return button
    }
    // 7
    /*
    func setupButtons() {
        let line1 = createHStack(yPosition: Int(displayView.frame.height)+0)
        line1.addSubview(createButton(order: 0, title: "button 1"))
        line1.addSubview(createButton(order: 1, title: "button 2"))
        line1.addSubview(createButton(order: 2, title: "button 3"))
        line1.addSubview(createButton(order: 3, title: "button 4"))
        mainVStack.addSubview(line1)
        
        let line2 = createHStack(yPosition: Int(displayView.frame.height)+82)
        line2.addSubview(createButton(order: 0, title: "button 5"))
        line2.addSubview(createButton(order: 1, title: "button 6"))
        line2.addSubview(createButton(order: 2, title: "button 7"))
        line2.addSubview(createButton(order: 3, title: "button 8"))
        mainVStack.addSubview(line2)
        
        let line3 = createHStack(yPosition: Int(displayView.frame.height)+82*2)
        line3.addSubview(createButton(order: 0, title: "button 9"))
        line3.addSubview(createButton(order: 1, title: "button 10"))
        line3.addSubview(createButton(order: 2, title: "button 11"))
        line3.addSubview(createButton(order: 3, title: "button 12"))
        mainVStack.addSubview(line3)
        
        let line4 = createHStack(yPosition: Int(displayView.frame.height)+82*3)
        line4.addSubview(createButton(order: 0, title: "button 9"))
        line4.addSubview(createButton(order: 1, title: "button 10"))
        line4.addSubview(createButton(order: 2, title: "button 11"))
        line4.addSubview(createButton(order: 3, title: "button 12"))
        mainVStack.addSubview(line4)
        
        let line5 = createHStack(yPosition: Int(displayView.frame.height)+82*4)
        
        // 9
        let zeroButton = UIButton(frame: CGRect(x: (0+2), y: 0, width: (Int(Constants.screenWidth)/4)*2-2, height: 80))
        zeroButton.setTitle("0", for: .normal)
        zeroButton.backgroundColor = .systemBlue
        zeroButton.tag = 13
        zeroButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        zeroButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        line5.addSubview(zeroButton)

        line5.addSubview(createButton(order: 2, title: "button 15"))
        line5.addSubview(createButton(order: 3, title: "button 16"))
        mainVStack.addSubview(line5)
    
    }
    */
    func setupLine1() {
        let line1 = createHStack(yPosition: Int(displayView.frame.height)+0)
        
        let acButton = createButton(order: 0, title: "AC", tag: 13)
        acButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let changeSignButton = createButton(order: 1, title: "+/-", tag: 14)
        changeSignButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let percentButton = createButton(order: 2, title: "%", tag: 15)
        percentButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let divButton = createButton(order: 3, title: "/", tag: 16)
        divButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        line1.addSubview(acButton)
        line1.addSubview(changeSignButton)
        line1.addSubview(percentButton)
        line1.addSubview(divButton)
        
        mainVStack.addSubview(line1)
    }
    func setupLine2() {
        let line2 = createHStack(yPosition: Int(displayView.frame.height)+82)
        
        let sevenButton = createButton(order: 0, title: "7", tag: 7)
        sevenButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let eightButton = createButton(order: 1, title: "8", tag: 8)
        eightButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let nineButton = createButton(order: 2, title: "9", tag: 9)
        nineButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let multButton = createButton(order: 3, title: "*", tag: 12)
        multButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        line2.addSubview(sevenButton)
        line2.addSubview(eightButton)
        line2.addSubview(nineButton)
        line2.addSubview(multButton)
        
        mainVStack.addSubview(line2)
    }
    func setupLine3() {
        let line3 = createHStack(yPosition: Int(displayView.frame.height)+82*2)
        
        let fourButton = createButton(order: 0, title: "4", tag: 4)
        fourButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let fiveButton = createButton(order: 1, title: "5", tag: 5)
        fiveButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let sixButton = createButton(order: 2, title: "6", tag: 6)
        sixButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let subsButton = createButton(order: 3, title: "-", tag: 11)
        subsButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        
        line3.addSubview(fourButton)
        line3.addSubview(fiveButton)
        line3.addSubview(sixButton)
        line3.addSubview(subsButton)
        
        mainVStack.addSubview(line3)
    }
    func setupLine4() {
        let line4 = createHStack(yPosition: Int(displayView.frame.height)+82*3)
        
        let oneButton = createButton(order: 0, title: "1", tag: 1)
        oneButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let twoButton = createButton(order: 1, title: "2", tag: 2)
        twoButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let threeButton = createButton(order: 2, title: "3", tag: 3)
        threeButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let plusButton = createButton(order: 3, title: "+", tag: 10)
        plusButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        line4.addSubview(oneButton)
        line4.addSubview(twoButton)
        line4.addSubview(threeButton)
        line4.addSubview(plusButton)
        
        mainVStack.addSubview(line4)
    }
    func setupLine5() {
        let line5 = createHStack(yPosition: Int(displayView.frame.height)+82*4)
        
        // 9
        let zeroButton = UIButton(frame: CGRect(x: (0+2), y: 0, width: (Int(Constants.screenWidth)/4)*2-2, height: 80))
        zeroButton.setTitle("0", for: .normal)
        zeroButton.backgroundColor = .systemBlue
        zeroButton.tag = 0
        zeroButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        zeroButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        let dotButton = createButton(order: 2, title: ".", tag: 17)
        dotButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let equalButton = createButton(order: 3, title: "=", tag: 18)
        equalButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        line5.addSubview(zeroButton)
        line5.addSubview(dotButton)
        line5.addSubview(equalButton)
        
        mainVStack.addSubview(line5)
    }
    func setupButtons() {
        setupLine1()
        setupLine2()
        setupLine3()
        setupLine4()
        setupLine5()
    }
    // 8
    func setupDisplay() {
        displayView.frame = CGRect(x: 0, y: 0, width: Constants.screenWidth, height: mainVStack.frame.height - (82*5)-60-30)
        displayView.backgroundColor = .lightGray
        
        
        display.frame = CGRect(x: 15, y: 15, width: displayView.frame.width-30, height: displayView.frame.height-15)
        display.backgroundColor             = .gray
        display.textAlignment               = .right
        display.contentVerticalAlignment    = .bottom
        display.text                        = "0"
        display.textColor                   = .white
        display.font = UIFont.boldSystemFont(ofSize: 80)
        
        displayView.addSubview(display)
        mainVStack.addSubview(displayView)
    }
}

