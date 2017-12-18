//
//  ViewController.swift
//  Tip_Calculator_2018_Submission
//
//  Created by Owner on 18/12/2017.
//  Copyright © 2017 Adeyemi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tipControl: UISegmentedControl!
    @IBOutlet var billField: UITextField!
    @IBOutlet var tipLabel: UILabel!
    
    @IBOutlet var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentages = [0.18,0.2,0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //tipLabel.text = "$\(tip)"
        tipLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format: "$%.2f",total)
    }
    
}

