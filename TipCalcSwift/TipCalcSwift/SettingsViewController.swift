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
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    func animateAmount() {
        //editing did begin
        // editing did end 
        // stop and start animations for it
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
