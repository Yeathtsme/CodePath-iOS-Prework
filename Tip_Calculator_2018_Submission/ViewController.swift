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
    
    struct Color{ // Background color array
        static var data: [Float] = [150,150,150]
    }
    struct Tip{
        static var tipPercentages = 0
    }
    // Set Bill Textfile as first responder
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billField.becomeFirstResponder()
        print("Hello World")
        //Save Data
        //let colorKey = UserDefaults.standard
        UserDefaults.standard.set(Color.data,forKey: "colorArray")
        UserDefaults.standard.synchronize()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //Retrive Data
        let colorKey = UserDefaults.standard
//        Color.data = colorKey.array(forKey: "colorArray") as? [Float] ?? [Float]()
        if let color = UserDefaults.standard.array(forKey: "colorArray") {
            print("Color Exist")
            
            if color.count == 0 {
                print("Color is empty")
            }else{
                print("Color is not empty, it has \(color.count) items")
            }
        }else {
            print("Color is nil")
        }
        // hides back bar button item
        self.navigationItem.hidesBackButton = true
        // sets background color
        self.view.backgroundColor = UIColor(red:CGFloat(Color.data[0])/255,green: CGFloat(Color.data[1])/255, blue: CGFloat(Color.data[2])/255,alpha: 1)
        tipControl.selectedSegmentIndex = Tip.tipPercentages
        
        
           }
 
    // Removes keyboard when you tap the background
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any) { // calculates tip and display tip + new total
        
        let tipPercentages = [0.18,0.2,0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //tipLabel.text = "$\(tip)"
        tipLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format: "$%.2f",total)
        
    }
    
}

