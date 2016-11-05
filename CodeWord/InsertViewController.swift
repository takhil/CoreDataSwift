//
//  InsertViewController.swift
//  CodeWord
//
//  Created by Akhil Tirumalasetty on 9/10/16.
//  Copyright © 2016 Akhil Tirumalasetty. All rights reserved.
//

import UIKit
import CoreData




class InsertViewController: UIViewController {

    @IBOutlet weak var titleTxtField: UITextField!
    @IBOutlet weak var hintTxtField: UITextField!
    @IBOutlet weak var unameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    @IBAction func saveButton(sender: AnyObject) {
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
     let  codeWordRow =  NSEntityDescription.insertNewObjectForEntityForName("UserInfo", inManagedObjectContext: managedContext)
    
        
        //3
        codeWordRow.setValue(titleTxtField.text, forKey: "title")
        codeWordRow.setValue(hintTxtField.text, forKey: "hint")
        codeWordRow.setValue(unameTxtField.text, forKey: "uname")
        codeWordRow.setValue(emailTxtField.text, forKey: "email")
        codeWordRow.setValue(passwordTxtField.text, forKey: "password")
        //4
        do {
            try managedContext.save()
            print("SAVE to coredata")
            self.navigationController?.popViewControllerAnimated(true)

            //UserInfo.append(person)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
    @IBAction func cancelButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
