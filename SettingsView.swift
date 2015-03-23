//
//  SettingsView.swift
//  Tips
//
//  Created by Irene Onyeneho on 3/22/15.
//  Copyright (c) 2015 Irene Onyeneho. All rights reserved.
//

import Foundation

import UIKit


class SettingsView : UIViewController {
    
    var defaults = NSUserDefaults.standardUserDefaults()

    
    @IBOutlet weak var defaultTipField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
    
        var defaultTip = (defaultTipField.text as NSString).doubleValue
        
        defaults.setDouble(defaultTip, forKey: "defaultTipNumber")
        
      
        
        defaults.synchronize()

        navigationController?.popViewControllerAnimated(true)
        
        
    }
    
    
    //@IBAction func onTap(sender: AnyObject) {
    
      //  view.endEditing(true)
        
   // }
    

}