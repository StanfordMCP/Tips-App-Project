//
//  ViewController.swift
//  Tips
//
//  Created by Irene Onyeneho on 3/16/15.
//  Copyright (c) 2015 Irene Onyeneho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var defaultTipOutput: UILabel!
    
    //let tapDefaultTipOutput = UITapGestureRecognizer()
    //Wanted to update the default tip when the label is pressed    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "0.00"
        totalLabel.text = "0.00"
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
      
        var defaultTipValue = defaults.doubleForKey("defaultTipNumber")
        
        if (defaultTipValue == 0){
            defaults.setDouble(0.0, forKey: "defaultTipNumber")
            defaults.synchronize()
            //defaultTipValue = 1
        }
        
        defaultTipOutput.text = String (format: "%.1f", defaultTipValue)
        
        tipControl.selectedSegmentIndex = UISegmentedControlNoSegment
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = 0.0 // tipPercentages[tipControl.selectedSegmentIndex]
        
        if (tipControl.selectedSegmentIndex == UISegmentedControlNoSegment) {
            
            tipPercentage = (defaults.doubleForKey("defaultTipNumber"))/100
            
            
            
        } else {
            
            tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        }

        
        
        var billAmount = Double ((billField.text as NSString).doubleValue)
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String (format: "$%.2f", tip)
        totalLabel.text = String (format: "$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)

    }
   
    
    
    
    }


   

  



