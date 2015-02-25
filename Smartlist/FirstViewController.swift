//
//  FirstViewController.swift
//  Smartlist
//
//  Created by Panashe Mahachi on 2015-02-25.
//  Copyright (c) 2015 Panashe Mahachi. All rights reserved.
//

import UIKit

// items

var toDo = [String]()


class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var smartListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // User defaults
        
        // Just set to string array now
        
        if NSUserDefaults.standardUserDefaults().objectForKey("toDo") != nil{
            save()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return toDo.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDo[indexPath.row]
        
        return cell
    }
    
    // Swipe to delete called when user tries to edit item
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            toDo.removeAtIndex(indexPath.row)
            save()
            smartListTable.reloadData()
        }
        
    }
    
    // Called everytime view appears
    override func viewDidAppear(animated: Bool) {
        
        smartListTable.reloadData()
        
    }
    
    func save(){
        toDo = NSUserDefaults.standardUserDefaults().objectForKey("toDo") as [String]
    }
}

