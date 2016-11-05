//
//  ListViewController.swift
//  CodeWord
//
//  Created by Akhil Tirumalasetty on 9/4/16.
//  Copyright © 2016 Akhil Tirumalasetty. All rights reserved.
//

import UIKit
import CoreData


class ListViewController: UITableViewController {
    
     var listOfCodes    =   [NSManagedObject]()
     var titleDisplay   =   [String]()
     var hintDispaly    =   [String]()
    
    
let Items = ["Bus","Helicopter","Truck","Boat","Bicycle","Motorcycle","Plane","Train","Car","Scooter","Caravan"]
    
 let subTitle =
    ["A Motor Vechile","A Motor Vechile","A Motor Vechile","A Motor Vechile","A Motor Vechile","A Motor Vechile","A Motor Vechile","A Motor Vechile","A Motor Vechile","A Motor Vechile","A Motor Vechile"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "UserInfo")
        do {
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
           
            if(results.count>0){
                        listOfCodes = results as! [NSManagedObject]
                            }
            else{
                print("No data found")
            }
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfCodes.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->
        
        UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("codeRowInfo", forIndexPath: indexPath)
         let eachRow            = listOfCodes[indexPath.row]
        cell.textLabel!.text    =   eachRow.valueForKey("title") as? String
        cell.detailTextLabel!.text  = eachRow.valueForKey("hint") as? String
            
        return cell
    }
 
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let appDelegate =
//            UIApplication.sharedApplication().delegate as! AppDelegate
//        let managedContext = appDelegate.managedObjectContext
//        
//        managedContext.deleteObject(listOfCodes[indexPath.row] as NSManagedObject)
//        listOfCodes.removeAtIndex(indexPath.row)
//        do {
//            try managedContext.save()
//        } catch _ {
//        }       
//        self.tableView.reloadData()
        let detailViewController = storyboard?.instantiateViewControllerWithIdentifier("DetailViewController") as? DetailViewController
        detailViewController!.dataObject = listOfCodes[indexPath.row]
        self.navigationController?.pushViewController(detailViewController!, animated: true)
        
            }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if(editingStyle == .Delete){
            let appDelegate =
                UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
    
            managedContext.deleteObject(listOfCodes[indexPath.row] as NSManagedObject)
            listOfCodes.removeAtIndex(indexPath.row)
            do {
                try managedContext.save()
            } catch _ {
            }       
            self.tableView.reloadData()
        }
    }
    
    @IBAction func logoutButton(sender: AnyObject) {
        
       self.navigationController?.popViewControllerAnimated(true)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    

}
