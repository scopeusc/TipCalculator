//
//  ViewController.swift
//  TipCalcSwift
//
//  Created by Suraya Shivji on 9/18/16.
//  Copyright © 2016 Suraya Shivji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var bill: UITextField!
    @IBOutlet weak var tipSegments: UISegmentedControl!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var settingsBarButton: UIBarButtonItem!
    @IBOutlet weak var payText: UILabel!
    @IBOutlet var tipView: UIView!
    
    var numPeople: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.bill.becomeFirstResponder()
        self.bill.textAlignment = NSTextAlignment.right;
        resultView.alpha = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        // dismiss keyboard
        view.endEditing(true)
    }
    
    @IBAction func animateValues(_ sender: AnyObject) {
        // called when the bill begins editing (editingdidbegin)
        UIView.animate(withDuration: 0.6, animations: {
            self.resultView.alpha = 1
        })
    }
    
    @IBAction func updateTip(_ sender: AnyObject) {
        let tipPercentages = [0.15, 0.20, 0.25]
        let bill = Double(self.bill.text!) ?? 0
        let tip = bill * tipPercentages[self.tipSegments.selectedSegmentIndex]
        let total = (tip + bill) / Double(numPeople)
        
        var formatter: NumberFormatter {
            let format = NumberFormatter()
            format.numberStyle = .decimal
            format.numberStyle = .currency
            format.locale = Locale.current
            return format
        }
        // use formatter for decimal currency and local currency
        tipLabel.text = formatter.string(from: tip as NSNumber)!  + " tip"
        totalLabel.text = formatter.string(from: total as NSNumber)
    }
    
    @IBAction func personClicked(_ sender: UIButton) {
        // calculate number of people
        // toggle alpha
        if(sender.alpha < 1) {
            numPeople += 1
            sender.alpha = 1
        }
        else {
            numPeople -= 1
            sender.alpha = 0.3
        }
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let defaultTip = defaults.integer(forKey: "default_tip_index")
        self.tipSegments.selectedSegmentIndex = defaultTip
        updateTip(self)
        
        
        // set color scheme for current view
        if let color = defaults.object(forKey: "color") {
            var schema = UIColor.init(red: 0.57, green:0.49, blue: 1.00, alpha: 1.0)
            if color as! String == "black" {
                schema = UIColor.black
            }
            UIView.animate(withDuration: 0.1, animations: {
                self.tipLabel.textColor = schema
                self.totalLabel.textColor = schema
                self.payText.textColor = schema
                self.tipView.backgroundColor = schema
            })
        }
    }
}

