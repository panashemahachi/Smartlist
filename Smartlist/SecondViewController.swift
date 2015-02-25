//
//  SecondViewController.swift
//  Smartlist
//
//  Created by Panashe Mahachi on 2015-02-25.
//  Copyright (c) 2015 Panashe Mahachi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var item: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        
        toDo.append(item.text)
        
        item.text = ""
        
        // Update NSUser Defaults
        NSUserDefaults.standardUserDefaults().setObject(toDo, forKey: "toDo")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        // Allow user to tap outside keyboard
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        item.resignFirstResponder()
        return true
    }
}

