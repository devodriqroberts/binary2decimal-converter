//
//  ViewController.swift
//  binary
//
//  Created by Devodriq Roberts on 9/24/18.
//  Copyright © 2018 Devodriq Roberts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var binaryButton: UIButton!
    @IBOutlet weak var decimalButton: UIButton!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var clearButton: UIButton!
    

    let placeholder = NSAttributedString(string: "Enter a value...", attributes: [NSAttributedStringKey.foregroundColor:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), NSAttributedStringKey.font:UIFont(name: "Menlo", size: 36.0)!])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       disableButtons()
        
        valueTextField.attributedPlaceholder = placeholder
        valueTextField.addTarget(self, action: #selector(textFieldEditing), for: .editingChanged)
        
        
    }
    
    @objc func textFieldEditing() {
        valueTextField.text != "" ? enableButtons() : disableButtons()
    }
    
    func enableButtons() {
        binaryButton.isEnabled = true
        decimalButton.isEnabled = true
        
        binaryButton.alpha = 1.0
        decimalButton.alpha = 1.0
        
         clearButton.isHidden = false
    }
    
    func disableButtons() {
        binaryButton.isEnabled = false
        decimalButton.isEnabled = false
        
        binaryButton.alpha = 0.5
        decimalButton.alpha = 0.5
        
        clearButton.isHidden = true
    }
    
    func clearTextField() -> String {
        guard let text = valueTextField.text else { return ""}
        valueTextField.text = ""
        valueTextField.resignFirstResponder()
        return text
    }

    @IBAction func binaryButtonPressed(_ sender: Any) {
        binaryButton.alpha = 1.0
        decimalButton.alpha = 0.5
        let binaryValue = Int(clearTextField())!
        let binary = BinaryDecimal(binaryValue)
        valueTextField.text = binary.calculateBinaryValue()
    }
    
    @IBAction func decimalButtonPressed(_ sender: Any) {
        decimalButton.alpha = 1.0
        binaryButton.alpha = 0.5
        let decimalValue = clearTextField().map { Int(String($0))! }
        let decimal = BinaryDecimal(decimalValue)
        valueTextField.text = decimal.calculateIntValueForBinary()
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        valueTextField.text = ""
        disableButtons()
    }
    
    
}

