//
//  SettingsViewController.swift
//  tips
//
//  Created by Hoang on 3/2/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var secondField: UITextField!
    @IBOutlet weak var thirdField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        let defaults = NSUserDefaults.standardUserDefaults()
        
        var firstValue = defaults.integerForKey("first")
        if (firstValue == 0) {
            firstValue = 18
        }
        firstField.text = String(firstValue)

        var secondValue = defaults.integerForKey("second")
        if (secondValue == 0) {
            secondValue = 20
        }
        secondField.text = String(secondValue)
        
        var thirdValue = defaults.integerForKey("third")
        if (thirdValue == 0) {
            thirdValue = 22
        }
        thirdField.text = String(thirdValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func endEdit(sender: AnyObject) {
        var textField = sender as! UITextField
        if (textField == firstField) {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(textField.text, forKey: "first")
            defaults.synchronize()
        } else if (textField == secondField) {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(textField.text, forKey: "second")
            defaults.synchronize()
        } else {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(textField.text, forKey: "third")
            defaults.synchronize()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
