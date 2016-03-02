//
//  ViewController.swift
//  tips
//
//  Created by Hoang on 2/28/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totallabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var firstValue: Int!
    var secondValue: Int!
    var thirdValue: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totallabel.text = "$0.00"
        //billField.text = ""
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        firstValue = defaults.integerForKey("first")
        if (firstValue == 0) {
            firstValue = 18
        }
        
        secondValue = defaults.integerForKey("second")
        if (secondValue == 0) {
            secondValue = 20
        }
        
        thirdValue = defaults.integerForKey("third")
        if (thirdValue == 0) {
            thirdValue = 22
        }
        
        tipControl.setTitle(String(firstValue) + "%", forSegmentAtIndex: 0)
        tipControl.setTitle(String(secondValue) + "%", forSegmentAtIndex: 1)
        tipControl.setTitle(String(thirdValue) + "%", forSegmentAtIndex: 2)
        
        updateUI()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        updateUI()
    }
    
    func updateUI() {
        let tipPercentages = [Double(firstValue)/100
                , Double(secondValue)/100
                , Double(thirdValue)/100]
        let selectedTipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
            
        let billAmount:Double? = Double(billField.text!)
        if (billAmount != nil) {
            let tip = billAmount! * selectedTipPercentage
            let total = billAmount! + tip
            
            tipLabel.text = String(format: "$%.2f", tip)
            totallabel.text = String(format: "$%.2f", total)
        }
    }
}

