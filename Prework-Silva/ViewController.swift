//
//  ViewController.swift
//  Prework-Silva
//
//  Created by Isabel Silva on 12/20/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitAmountLabel: UILabel!
    
    @IBOutlet weak var splitNumLabel: UILabel!
    @IBOutlet weak var decrementPartyButton: UIButton!
    @IBOutlet weak var incrementPartyButton: UIButton!
    @IBOutlet weak var hideSplitTotal: UISwitch!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var splitByText: UILabel!
    @IBOutlet weak var totalSplitText: UILabel!
    
    var total : Double? = 0.0
    
    func splitOffOn (_ comand : Bool) {
        // if command is true keeps the following objects hidden, unhidden if false
        decrementPartyButton.isHidden = comand
        incrementPartyButton.isHidden = comand
        splitAmountLabel.isHidden = comand
        splitNumLabel.isHidden = comand
        splitByText.isHidden = comand
        totalSplitText.isHidden = comand
    }
    func calculateSplitAmmount(_ partySize : Int){
        // Calculate split amount based on partySize
        let splitAmount = total!/Double(partySize)
        // Update Split Number Label
        splitNumLabel.text = String(partySize)
        // Update Split Amount Label
        splitAmountLabel.text = String(format: "$%.2f", splitAmount)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Automatically have split check option turned off and call helper funtions to hide object
        hideSplitTotal.isOn = false
        splitOffOn(true)
    }

  
  
    @IBAction func calculateTipSlider(_ sender: Any) {
        // Get bill amount from the text input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get total tip by mutiplying tip * tipPercentage
        let tipPercentage = ceil(Double(tipSlider.value))
        let tip = bill * (tipPercentage/100)
        total = bill + tip
        
        // Update Tip Percentage Label
        tipPercentageLabel.text = String(format: "%.0f%%", tipPercentage)
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f",tip)
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f",total!)
        
    }
    
    @IBAction func calcIncrementParty(_ sender: Any) {
        // Get current split number and increment by 1
        let splitNum = Int(splitNumLabel.text!) ?? 1
        let newSize = splitNum + 1
        
        // Call helper function to update split amount
        calculateSplitAmmount(newSize)
    }
    
    @IBAction func calcDecrementParty(_ sender: Any) {
        // Get current split number and decrement by 1 (decreement can not be less than 1)
        let splitNum = Int(splitNumLabel.text!) ?? 1
        let newSize = (splitNum - 1) > 0 ? (splitNum-1) : 1
        // call helper function to update split amount
        calculateSplitAmmount(newSize)
    }
    @IBAction func showSplitTotal(_ sender: Any) {
        // Turn split option on or off based on switch
        if (hideSplitTotal.isOn){
            splitOffOn(false)
        }
        else{
            splitOffOn(true)
        }
        
    }
   
}



