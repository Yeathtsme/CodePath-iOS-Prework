//
//  SettingsViewController.swift
//  Tip_Calculator_2018_Submission
//
//  Created by Owner on 20/12/2017.
//  Copyright © 2017 Adeyemi. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var slider1: UISlider!
    
    @IBOutlet var slider2: UISlider!

    @IBOutlet var slider3: UISlider!
    
    @IBOutlet var tipPercentageControl: UISegmentedControl!
    @IBOutlet var label1: UILabel!
    
    @IBOutlet var label2: UILabel!
    
    @IBOutlet var label3: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set labels + sliders to values
        label1.text = String(ViewController.Color.data[0])
        label2.text = String(ViewController.Color.data[1])
        label3.text = String(ViewController.Color.data[2])
        slider1.value = ViewController.Color.data[0]
        slider2.value = ViewController.Color.data[1]
        slider3.value = ViewController.Color.data[2]
        self.view.backgroundColor = UIColor(red:CGFloat(ViewController.Color.data[0])/255,green: CGFloat(ViewController.Color.data[1])/255, blue: CGFloat(ViewController.Color.data[2])/255,alpha: 1)
        tipPercentageControl.selectedSegmentIndex = ViewController.Tip.tipPercentages
    }

    
    @IBAction func defaultTipControl(_ sender: Any) {
        
        if tipPercentageControl.selectedSegmentIndex == 0 {
            ViewController.Tip.tipPercentages = 0
        }
        if tipPercentageControl.selectedSegmentIndex == 1 {
            ViewController.Tip.tipPercentages = 1
        }
        if tipPercentageControl.selectedSegmentIndex == 2 {
            ViewController.Tip.tipPercentages = 2
        }
    }

    
    
    @IBAction func slider1Action(_ sender: Any) {
        // Updating variables
        ViewController.Color.data[0] = Float(slider1.value)
        ViewController.Color.data[1] = Float(slider2.value)
        ViewController.Color.data[2] = Float(slider3.value)
        self.view.backgroundColor = UIColor(red:CGFloat(ViewController.Color.data[0])/255,green: CGFloat(ViewController.Color.data[1])/255, blue: CGFloat(ViewController.Color.data[2])/255,alpha: 1)
        
        
        
        label1.text = String(ViewController.Color.data[0])
        label2.text = String(ViewController.Color.data[1])
        label3.text = String(ViewController.Color.data[2])
       // Testing Changed Values
        print(" red: \(label1.text ?? "N/A") green: \(label2.text ?? "N/A") blue: \(label3.text ?? "N/A")")
        UserDefaults.standard.set(ViewController.Color.data,forKey: "colorArray")
        UserDefaults.standard.synchronize()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
