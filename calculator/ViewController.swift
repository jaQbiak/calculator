//
//  ViewController.swift
//  calculator
//
//  Created by Patryk Jakubiak on 09/12/2020.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var calculatorWorkings: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    
    var workings:String = ""
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        clearAll()
    }

    @IBAction func allClearTap(_ sender: Any) {
        clearAll()
    }
    
    func clearAll() {
        workings = " "
        calculatorWorkings.text = ""
        calculatorResults.text = ""
    }
    
    @IBAction func backTap(_ sender: Any) {
        if (!workings.isEmpty) {
            workings.removeLast()
            calculatorWorkings.text = workings
        }
    }
    
    @IBAction func equalsTap(_ sender: Any) {
        let trimmedWorkings = workings.trimmingCharacters(in: .whitespacesAndNewlines)
        if (isFirstCharacterAnInt(character: trimmedWorkings.first ?? ".") && isLastCharacterAnInt(character: trimmedWorkings.last ?? ".")) {
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calculatorResults.text = resultString
        }
    }
    
    func isFirstCharacterAnInt(character: Character) -> Bool {
        return Int(String(character)) != nil
    }
    
    func isLastCharacterAnInt(character: Character) -> Bool {
        if (character == "%") {
            return true
        } else {
            return Int(String(character)) != nil
        }
    }
    
    func formatResult(result: Double) -> String {
        if (result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
        }
    }
    
    func addToWorking(value: String) {
        workings += value
        calculatorWorkings.text = workings
    }
    
    @IBAction func percentTap(_ sender: Any) {
        addToWorking(value: "%")
    }
    
    @IBAction func divideTap(_ sender: Any) {
        addToWorking(value: "/")
    }
    
    @IBAction func timesTap(_ sender: Any) {
        addToWorking(value: "*")
    }
    
    @IBAction func minusTap(_ sender: Any) {
        addToWorking(value: "-")
    }
    
    @IBAction func plusTap(_ sender: Any) {
        addToWorking(value: "+")
    }
    
    @IBAction func decimalTap(_ sender: Any) {
        addToWorking(value: ".")
    }
    
    @IBAction func zeroTap(_ sender: Any) {
        addToWorking(value: "0")
    }
    
    @IBAction func oneTap(_ sender: Any) {
        addToWorking(value: "1")
    }
    
    @IBAction func twoTap(_ sender: Any) {
        addToWorking(value: "2")
    }
    
    @IBAction func threeTap(_ sender: Any) {
        addToWorking(value: "3")
    }
    
    @IBAction func fourTap(_ sender: Any) {
        addToWorking(value: "4")
    }
    
    @IBAction func fiveTap(_ sender: Any) {
        addToWorking(value: "5")
    }
    
    @IBAction func sixTap(_ sender: Any) {
        addToWorking(value: "6")
    }
    
    @IBAction func sevenTap(_ sender: Any) {
        addToWorking(value: "7")
    }
    
    @IBAction func eightTap(_ sender: Any) {
        addToWorking(value: "8")
    }
     
    @IBAction func nineTap(_ sender: Any) {
        addToWorking(value: "9")
    }
    
    
    
}

