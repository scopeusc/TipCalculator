//
//  SettingsViewController.swift
//  TipCalcSwift
//
//  Created by Suraya Shivji on 9/19/16.
//  Copyright © 2016 Suraya Shivji. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipSegments: UISegmentedControl!
    @IBOutlet var settingsView: UIView!
    @IBOutlet weak var colorTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        
        // set color scheme for current view
        if let color = defaults.object(forKey: "color") {
            var schema = UIColor.init(red: 0.57, green:0.49, blue: 1.00, alpha: 1.0)
            if color as! String == "black" {
                schema = UIColor.black
            }
                self.settingsView.backgroundColor = schema
                self.colorTitle.textColor = schema
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeDefaultTip(_ sender: AnyObject) {
        // save key value pair for default tip
        let defaults = UserDefaults.standard
        defaults.set(tipSegments.selectedSegmentIndex, forKey: "default_tip_index")
        defaults.synchronize()
    }
    
    @IBAction func blackColorScheme(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set("black", forKey: "color")
        defaults.synchronize()
        
        UIView.animate(withDuration: 0.6, animations: {
            self.settingsView.backgroundColor = UIColor.black
            self.colorTitle.textColor = UIColor.black
        })
    }
    
    @IBAction func purpleColorScheme(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set("purple", forKey: "color")
        defaults.synchronize()
        
        var purple = UIColor.init(red: 0.57, green:0.49, blue: 1.00, alpha: 1.0)
        
        UIView.animate(withDuration: 0.6, animations: {
            self.settingsView.backgroundColor = purple
            self.colorTitle.textColor = purple
        })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
